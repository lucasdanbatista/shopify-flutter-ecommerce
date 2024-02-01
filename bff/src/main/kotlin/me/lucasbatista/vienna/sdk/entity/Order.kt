package me.lucasbatista.vienna.sdk.entity

data class Order(
    val id: String,
    val orderNumber: Int,
    val items: List<OrderItem>,
    val status: OrderStatus,
)
