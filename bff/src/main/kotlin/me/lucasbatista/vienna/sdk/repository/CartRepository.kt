package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.AuthenticationToken
import me.lucasbatista.vienna.sdk.entity.Cart

interface CartRepository {
    fun findById(id: String): Cart

    fun create(customerAuthenticationToken: AuthenticationToken): Cart

    fun addLine(cartId: String, productVariantId: String): Cart

    fun updateLine(cartId: String, cartLineId: String, quantity: Int): Cart
}