package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.dto.OrderDTO

interface OrderRepository {
    fun getOrders(customerAccessToken: String): List<OrderDTO>
}