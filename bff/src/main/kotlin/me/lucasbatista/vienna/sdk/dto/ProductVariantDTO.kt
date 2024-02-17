package me.lucasbatista.vienna.sdk.dto

import java.net.URL

data class ProductVariantDTO(
    val id: String? = null,
    val productId: String? = null,
    val originalPrice: Double? = null,
    val sellingPrice: Double? = null,
    val title: String? = null,
    val image: URL? = null,
)