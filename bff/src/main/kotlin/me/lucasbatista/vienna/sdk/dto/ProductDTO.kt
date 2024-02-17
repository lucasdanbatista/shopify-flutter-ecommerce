package me.lucasbatista.vienna.sdk.dto

import java.net.URL

data class ProductDTO(
    val id: String? = null,
    val title: String? = null,
    val description: String? = null,
    val images: List<URL>? = null,
    val variants: List<ProductVariantDTO>? = null,
    val options: List<ProductOptionDTO>? = null,
)