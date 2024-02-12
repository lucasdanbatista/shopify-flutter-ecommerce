package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Checkout

interface CheckoutRepository {
    fun create(customerAccessToken: String, cartId: String, shippingAddressId: String): Checkout

    fun setShippingLine(checkoutId: String, shippingRateId: String): Checkout
}