package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Address
import me.lucasbatista.vienna.sdk.entity.Cart
import me.lucasbatista.vienna.sdk.entity.Checkout
import me.lucasbatista.vienna.sdk.entity.ProcessedPayment

interface CheckoutRepository {
    fun create(customerEmail: String, cart: Cart, shippingAddress: Address): Checkout

    fun complete(checkoutId: String, payment: ProcessedPayment, billingAddress: Address)
}