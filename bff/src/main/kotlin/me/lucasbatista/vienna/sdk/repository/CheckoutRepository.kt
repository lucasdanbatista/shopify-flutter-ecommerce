package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Address
import me.lucasbatista.vienna.sdk.entity.Cart
import me.lucasbatista.vienna.sdk.entity.Checkout
import me.lucasbatista.vienna.sdk.entity.CheckoutPayment

interface CheckoutRepository {
    fun create(customerEmail: String, cart: Cart, shippingAddress: Address): Checkout

    fun complete(payment: CheckoutPayment)
}