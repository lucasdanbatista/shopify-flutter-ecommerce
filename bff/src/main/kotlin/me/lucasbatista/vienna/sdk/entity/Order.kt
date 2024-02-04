package me.lucasbatista.vienna.sdk.entity

class Order(
    id: String? = null,
    orderNumber: Int? = null,
    items: List<OrderItem>? = null,
    status: OrderStatus? = null,
    shippingAddress: Address? = null,
    total: Double? = null,
) {
    lateinit var id: String
    var orderNumber: Int = 0
    lateinit var items: List<OrderItem>
    lateinit var status: OrderStatus
    lateinit var shippingAddress: Address
    var total = 0.0

    init {
        id?.let { this.id = id }
        orderNumber?.let { this.orderNumber = orderNumber }
        items?.let { this.items = items }
        status?.let { this.status = status }
        shippingAddress?.let { this.shippingAddress = shippingAddress }
        total?.let { this.total = total }
    }
}
