package me.lucasbatista.vienna.sdk.entity

class ProductVariant(
    id: String? = null,
    originalPrice: Double? = null,
    sellingPrice: Double? = null,
) {
    lateinit var id: String
    var originalPrice: Double = 0.0
    var sellingPrice: Double = 0.0

    init {
        id?.let { this.id = id }
        originalPrice?.let { this.originalPrice = it }
        sellingPrice?.let { this.sellingPrice = it }
    }
}