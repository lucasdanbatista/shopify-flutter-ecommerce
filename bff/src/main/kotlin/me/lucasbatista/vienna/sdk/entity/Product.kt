package me.lucasbatista.vienna.sdk.entity

import java.net.URL

class Product(
    id: String? = null,
    title: String? = null,
    description: String? = null,
    images: List<URL>? = null,
    variants: List<ProductVariant>? = null,
    options: List<ProductOption>? = null,
) {
    lateinit var id: String
    lateinit var title: String
    lateinit var description: String
    lateinit var images: List<URL>
    lateinit var variants: List<ProductVariant>
    lateinit var options: List<ProductOption>

    init {
        id?.let { this.id = it }
        description?.let { this.description = description }
        title?.let { this.title = it }
        images?.let { this.images = it }
        variants?.let { this.variants = variants }
        options?.let { this.options = options }
    }
}