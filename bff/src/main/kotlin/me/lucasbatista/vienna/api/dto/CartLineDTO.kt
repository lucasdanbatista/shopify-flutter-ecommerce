package me.lucasbatista.vienna.api.dto

data class CartLineDTO(
    val id: String? = null,
    val productVariant: ProductVariantDTO? = null,
    val quantity: Int? = null,
    val total: Double? = null,
)