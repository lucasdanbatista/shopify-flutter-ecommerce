package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.OrderDTO
import me.lucasbatista.vienna.api.dto.OrderItemDTO
import me.lucasbatista.vienna.api.dto.ProductVariantDTO
import me.lucasbatista.vienna.api.util.AuthorizationHeaderUtil
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
        val result = repository.getOrders(
            customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
        )
        return result.map { it ->
            OrderDTO(
                id = it.id,
                orderNumber = it.orderNumber,
                items = it.items.map {
                    OrderItemDTO(
                        title = it.title,
                        productVariant = ProductVariantDTO(
                            image = it.productVariant.image,
                        ),
                    )
                },
                status = it.status,
            )
        }
    }
}