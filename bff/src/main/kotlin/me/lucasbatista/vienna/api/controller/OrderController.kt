package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.util.AuthorizationHeaderUtil
import me.lucasbatista.vienna.sdk.dto.OrderDTO
import me.lucasbatista.vienna.sdk.repository.OrderRepository
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestHeader
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/v1/orders")
class OrderController(private val repository: OrderRepository) {
    @GetMapping
    fun getOrders(@RequestHeader authorization: String): List<OrderDTO> {
        return repository.getOrders(
            customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
        )
    }
}