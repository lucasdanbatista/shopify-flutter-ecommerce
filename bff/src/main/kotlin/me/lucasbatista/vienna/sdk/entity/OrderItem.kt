package me.lucasbatista.vienna.sdk.entity

class OrderItem(
    title: String? = null,
    productVariant: ProductVariant? = null,
    total: Double? = null,
    quantity: Int? = null,
) {
    lateinit var title: String
    lateinit var productVariant: ProductVariant
    var quantity = 0
    var total = 0.0

    init {
        title?.let { this.title = title }
        productVariant?.let { this.productVariant = productVariant }
        quantity?.let { this.quantity = quantity }
        total?.let { this.total = total }
    }
}