package me.lucasbatista.vienna.sdk.entity

import java.net.URL

class Cart(
    id: String? = null,
    lines: List<CartLine>? = null,
    subtotal: Double? = null,
    total: Double? = null,
    checkoutUrl: URL? = null,
) {
    lateinit var id: String
    lateinit var lines: List<CartLine>
    var subtotal: Double = 0.0
    var total: Double = 0.0
    lateinit var checkoutUrl: URL

    init {
        id?.let { this.id = id }
        lines?.let { this.lines = lines }
        subtotal?.let { this.subtotal = subtotal }
        total?.let { this.total = total }
        checkoutUrl?.let { this.checkoutUrl = checkoutUrl }
    }
}