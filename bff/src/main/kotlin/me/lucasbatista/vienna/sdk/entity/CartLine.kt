package me.lucasbatista.vienna.sdk.entity

data class CartLine(
    val id: String,
    val productVariant: ProductVariant,
    val quantity: Int,
    val total: Double,
)