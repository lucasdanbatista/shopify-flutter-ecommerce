package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Address
import me.lucasbatista.vienna.sdk.entity.Cart
import me.lucasbatista.vienna.sdk.entity.Checkout

interface CheckoutRepository {
    fun create(cart: Cart, shippingAddress: Address): Checkout
}