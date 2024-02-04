package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.AddressDTO
import me.lucasbatista.vienna.api.dto.OrderDTO
import me.lucasbatista.vienna.api.dto.OrderItemDTO
import me.lucasbatista.vienna.api.dto.ProductVariantDTO
import me.lucasbatista.vienna.api.util.AuthorizationHeaderUtil
import me.lucasbatista.vienna.sdk.entity.Order
import me.lucasbatista.vienna.sdk.repository.OrderRepository
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/v1/orders")
class OrderController(private val repository: OrderRepository) {
    @GetMapping
    fun getOrders(@RequestHeader authorization: String): List<OrderDTO> {
        val result = repository.getOrders(
            customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
        )
        return result.map(::mapOrder)
    }

    @GetMapping("/{id}")
    fun getOrderById(
        @RequestHeader authorization: String,
        @PathVariable id: String,
    ): OrderDTO {
        val result = repository.getOrderBydId(
            customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
            id = id,
        )
        return mapOrder(result).apply {
            shippingAddress = result.shippingAddress.let {
                AddressDTO(
                    recipientFirstName = it.recipientFirstName,
                    recipientLastName = it.recipientLastName,
                    line1 = it.line1,
                    line2 = it.line2,
                    city = it.city,
                    province = it.province,
                    zipcode = it.zipcode,
                )
            }
        }
    }

    private fun mapOrder(it: Order): OrderDTO {
        return OrderDTO(
            id = it.id,
            orderNumber = it.orderNumber,
            items = it.items.map {
                OrderItemDTO(
                    title = it.title,
                    productVariant = ProductVariantDTO(
                        image = it.productVariant.image,
                    ),
                    quantity = it.quantity,
                    total = it.total,
                )
            },
            status = it.status,
            total = it.total,
        )
    }
}