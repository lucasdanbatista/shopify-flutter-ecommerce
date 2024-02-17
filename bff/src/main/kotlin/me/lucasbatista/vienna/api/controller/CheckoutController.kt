package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.util.AuthorizationHeaderUtil
import me.lucasbatista.vienna.sdk.dto.CheckoutDTO
import me.lucasbatista.vienna.sdk.dto.ShippingRateDTO
import me.lucasbatista.vienna.sdk.entity.Checkout
import me.lucasbatista.vienna.sdk.repository.CheckoutRepository
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/v1/checkout")
class CheckoutController(private val checkoutRepository: CheckoutRepository) {
    @PostMapping
    fun createCheckout(
        @RequestHeader("Authorization") authorization: String,
        @RequestParam cartId: String,
        @RequestParam shippingAddressId: String,
    ): CheckoutDTO {
        val customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization)
        val result = checkoutRepository.create(
            customerAccessToken = customerAccessToken,
            cartId = cartId,
            shippingAddressId = shippingAddressId,
        )
        return mapCheckout(result)
    }

    @PostMapping("/{checkoutId}/shipping-line")
    fun setShippingLine(
        @PathVariable checkoutId: String,
        @RequestParam shippingRateId: String,
    ): CheckoutDTO {
        val result = checkoutRepository.setShippingLine(checkoutId, shippingRateId)
        return mapCheckout(result)
    }

    private fun mapCheckout(it: Checkout): CheckoutDTO {
        return CheckoutDTO(
            id = it.id,
            subtotal = it.subtotal,
            total = it.total,
            selectedShippingRate = if (it.selectedShippingRate != null) {
                ShippingRateDTO(
                    id = it.selectedShippingRate.id,
                    title = it.selectedShippingRate.title,
                    price = it.selectedShippingRate.price,
                )
            } else null,
            availableShippingRates = it.availableShippingRates.map {
                ShippingRateDTO(
                    id = it.id,
                    title = it.title,
                    price = it.price,
                )
            },
        )
    }
}