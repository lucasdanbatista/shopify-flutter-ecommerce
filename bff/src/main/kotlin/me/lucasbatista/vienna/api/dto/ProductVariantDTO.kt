package me.lucasbatista.vienna.api.dto

import java.net.URL

data class ProductVariantDTO(
    val id: String? = null,
    val originalPrice: Double? = null,
    val sellingPrice: Double? = null,
    val title: String? = null,
    val image: URL? = null,
)