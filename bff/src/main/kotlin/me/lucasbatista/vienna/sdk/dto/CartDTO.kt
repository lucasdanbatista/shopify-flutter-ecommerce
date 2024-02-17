package me.lucasbatista.vienna.sdk.dto

import java.net.URL

data class CartDTO(
    val id: String? = null,
    val lines: List<CartLineDTO>? = null,
    val subtotal: Double? = null,
    val total: Double? = null,
    val checkoutUrl: URL? = null,
)