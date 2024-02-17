package me.lucasbatista.vienna.shopify.repository

import com.fasterxml.jackson.databind.ObjectMapper
import me.lucasbatista.vienna.api.util.fromBase64
import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.entity.Checkout
import me.lucasbatista.vienna.sdk.entity.ShippingRate
import me.lucasbatista.vienna.sdk.repository.AddressRepository
import me.lucasbatista.vienna.sdk.repository.CartRepository
import me.lucasbatista.vienna.sdk.repository.CheckoutRepository
import me.lucasbatista.vienna.sdk.repository.CustomerRepository
import me.lucasbatista.vienna.shopify.graphql.ShopifyStorefrontApi
import me.lucasbatista.vienna.shopify.storefront.graphql.CreateCheckoutMutation
import me.lucasbatista.vienna.shopify.storefront.graphql.UpdateCheckoutShippingLineMutation
import me.lucasbatista.vienna.shopify.storefront.graphql.inputs.CheckoutLineItemInput
import me.lucasbatista.vienna.shopify.storefront.graphql.inputs.MailingAddressInput
import org.springframework.stereotype.Repository
import me.lucasbatista.vienna.shopify.storefront.graphql.createcheckoutmutation.Checkout as ShopifyCheckout

@Repository
class ShopifyCheckoutRepository(
    private val storefront: ShopifyStorefrontApi,
    private val addressRepository: AddressRepository,
    private val cartRepository: CartRepository,
    private val customerRepository: CustomerRepository,
    private val objectMapper: ObjectMapper,
) : CheckoutRepository {
    override fun create(
        customerAccessToken: String,
        cartId: String,
        shippingAddressId: String,
    ): Checkout {
        val cart = cartRepository.findById(cartId)
        val customer = customerRepository.findByAccessToken(customerAccessToken)
        val shippingAddress = addressRepository.findById(customerAccessToken, shippingAddressId)
        val result = storefront.execute(
            CreateCheckoutMutation(
                CreateCheckoutMutation.Variables(
                    customerEmail = customer.email,
                    cartLines = cart.lines.map {
                        CheckoutLineItemInput(
                            variantId = it.productVariant.id.fromBase64(),
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
                ),
            ),
        ).data!!.checkoutCreate!!.checkout!!
        return mapCheckout(result)
    }

    override fun setShippingLine(checkoutId: String, shippingRateId: String): Checkout {
        val query = UpdateCheckoutShippingLineMutation(
            UpdateCheckoutShippingLineMutation.Variables(
                checkoutId = checkoutId.fromBase64(),
                shippingRateHandle = shippingRateId,
            ),
        )
        val result = storefront.execute(query).data!!.checkoutShippingLineUpdate!!.checkout!!
        return mapCheckout(result)
    }

    private fun mapCheckout(data: Any): Checkout {
        val result = objectMapper.convertValue(data, ShopifyCheckout::class.java)
        return Checkout(
            id = result.id.toBase64(),
            subtotal = result.subtotalPrice.amount.toDouble(),
            total = result.totalPrice.amount.toDouble(),
            selectedShippingRate = if (result.shippingLine != null) {
                ShippingRate(
                    id = result.shippingLine!!.handle,
                    title = result.shippingLine!!.title,
                    price = result.shippingLine!!.price.amount.toDouble(),
                )
            } else null,
            availableShippingRates = result.availableShippingRates?.shippingRates?.map {
                ShippingRate(
                    id = it.handle,
                    title = it.title,
                    price = it.price.amount.toDouble(),
                )
            } ?: listOf(),
        )
    }
}