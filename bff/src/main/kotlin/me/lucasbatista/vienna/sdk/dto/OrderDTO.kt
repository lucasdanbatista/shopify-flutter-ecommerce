package me.lucasbatista.vienna.sdk.dto

data class OrderDTO(
    var id: String? = null,
    var orderNumber: Int? = null,
    var items: List<OrderItemDTO>? = null,
    var status: OrderStatus? = null,
    var shippingAddress: AddressDTO? = null,
    var total: Double? = null,
)
