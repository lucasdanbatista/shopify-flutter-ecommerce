package me.lucasbatista.vienna.sdk.entity

class Cart(
    id: String? = null,
    lines: List<CartLine>? = null,
    subtotal: Double? = null,
    total: Double? = null,
) {
    lateinit var id: String
    lateinit var lines: List<CartLine>
    var subtotal: Double = 0.0
    var total: Double = 0.0

    init {
        id?.let { this.id = id }
        lines?.let { this.lines = lines }
        subtotal?.let { this.subtotal = subtotal }
        total?.let { this.total = total }
    }
}