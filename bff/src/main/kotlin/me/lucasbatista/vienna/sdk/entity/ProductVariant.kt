package me.lucasbatista.vienna.sdk.entity

import java.net.URL

class ProductVariant(
    id: String? = null,
    originalPrice: Double? = null,
    sellingPrice: Double? = null,
    image: URL? = null,
) {
    lateinit var id: String
    var originalPrice: Double = 0.0
    var sellingPrice: Double = 0.0
    lateinit var image: URL

    init {
        id?.let { this.id = id }
        originalPrice?.let { this.originalPrice = it }
        sellingPrice?.let { this.sellingPrice = it }
        image?.let { this.image = image }
    }
}