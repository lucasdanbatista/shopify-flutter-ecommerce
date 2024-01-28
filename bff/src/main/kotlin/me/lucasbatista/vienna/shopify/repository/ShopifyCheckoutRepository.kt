package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.entity.Address
import me.lucasbatista.vienna.sdk.entity.Cart
import me.lucasbatista.vienna.sdk.entity.Checkout
import me.lucasbatista.vienna.sdk.entity.ProcessedPayment
import me.lucasbatista.vienna.sdk.repository.CheckoutRepository
import me.lucasbatista.vienna.shopify.graphql.CompleteCheckoutMutation
import me.lucasbatista.vienna.shopify.graphql.CreateCheckoutMutation
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import me.lucasbatista.vienna.shopify.graphql.enums.CurrencyCode
import me.lucasbatista.vienna.shopify.graphql.enums.PaymentTokenType
import me.lucasbatista.vienna.shopify.graphql.inputs.CheckoutLineItemInput
import me.lucasbatista.vienna.shopify.graphql.inputs.MailingAddressInput
import me.lucasbatista.vienna.shopify.graphql.inputs.MoneyInput
import me.lucasbatista.vienna.shopify.graphql.inputs.TokenizedPaymentInputV3
import org.springframework.stereotype.Repository
import java.util.*

@Repository
class ShopifyCheckoutRepository(private val client: ShopifyGraphQLClient) : CheckoutRepository {
    override fun create(customerEmail: String, cart: Cart, shippingAddress: Address): Checkout {
        val result = client.executeAsAdmin(
            CreateCheckoutMutation(
                CreateCheckoutMutation.Variables(
                    customerEmail = customerEmail,
                    cartLines = cart.lines.map {
                        CheckoutLineItemInput(
                            variantId = "gid://shopify/ProductVariant/${it.productVariant.id}",
                            quantity = it.quantity,
                        )
                    },
                    shippingAddress = MailingAddressInput(
                        firstName = shippingAddress.recipientFirstName,
                        lastName = shippingAddress.recipientLastName,
                        address1 = shippingAddress.line1,
                        address2 = shippingAddress.line2,
                        city = shippingAddress.city,
                        province = shippingAddress.province,
                        country = shippingAddress.country,
                        zip = shippingAddress.zipcode,
                    ),
                )
            ),
        ).data!!.checkoutCreate!!.checkout!!
        return Checkout(
            id = result.id,
            total = result.totalPrice.amount.toDouble(),
        )
    }

    override fun complete(checkoutId: String, payment: ProcessedPayment, billingAddress: Address) {
        client.executeAsAdmin(
            CompleteCheckoutMutation(
                CompleteCheckoutMutation.Variables(
                    checkoutId = checkoutId,
                    payment = TokenizedPaymentInputV3(
                        idempotencyKey = UUID.randomUUID().toString(),
                        billingAddress = MailingAddressInput(
                            firstName = billingAddress.recipientFirstName,
                            lastName = billingAddress.recipientLastName,
                            address1 = billingAddress.line1,
                            address2 = billingAddress.line2,
                            city = billingAddress.city,
                            province = billingAddress.province,
                            country = billingAddress.country,
                            zip = billingAddress.zipcode,
                        ),
                        paymentAmount = MoneyInput(
                            amount = payment.totalPaid.toString(),
                            currencyCode = CurrencyCode.BRL,
                        ),
                        type = PaymentTokenType.STRIPE_VAULT_TOKEN,
                        paymentData = payment.completionToken,
                    ),
                )
            )
        )
    }
}