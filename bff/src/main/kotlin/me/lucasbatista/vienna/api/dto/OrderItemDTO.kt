package me.lucasbatista.vienna.api.dto

data class OrderItemDTO(
    var title: String? = null,
    val productVariant: ProductVariantDTO? = null,
    var quantity: Int? = null,
    var total: Double? = null,
)