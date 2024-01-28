package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.entity.Address
import me.lucasbatista.vienna.sdk.entity.Cart
import me.lucasbatista.vienna.sdk.entity.Checkout
import me.lucasbatista.vienna.sdk.repository.CheckoutRepository
import me.lucasbatista.vienna.shopify.graphql.CreateCheckoutMutation
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import me.lucasbatista.vienna.shopify.graphql.inputs.CheckoutLineItemInput
import me.lucasbatista.vienna.shopify.graphql.inputs.MailingAddressInput
import org.springframework.stereotype.Repository

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
        ).data!!.checkoutCreate.checkout
        return Checkout(
            id = result.id,
            total = result.totalPrice.amount.toDouble(),
        )
    }
}