package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.dto.CartDTO

interface CartRepository {
    fun findById(id: String): CartDTO

    fun create(customerAccessToken: String? = null): CartDTO

    fun addLine(cartId: String, productVariantId: String): CartDTO

    fun updateLine(cartId: String, cartLineId: String, quantity: Int): CartDTO
}