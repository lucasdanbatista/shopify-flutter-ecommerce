package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Order

interface OrderRepository {
    fun getOrders(customerAccessToken: String): List<Order>

    fun getOrderBydId(customerAccessToken: String, id: String): Order
}