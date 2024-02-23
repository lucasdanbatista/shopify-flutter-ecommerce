package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.util.AuthorizationHeaderUtil
import me.lucasbatista.vienna.sdk.dto.CartDTO
import me.lucasbatista.vienna.sdk.dto.CartLineDTO
import me.lucasbatista.vienna.sdk.repository.CartRepository
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/v1/carts")
class CartController(private val cartRepository: CartRepository) {
    @GetMapping("/{id}")
    fun getCartById(@PathVariable id: String): CartDTO {
        return cartRepository.findById(id)
    }

    @PostMapping
    fun createCart(@RequestHeader authorization: String?): CartDTO {
        val result = cartRepository.create(
            customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
        )
        return CartDTO(
            id = result.id,
            lines = listOf(),
            subtotal = 0.0,
            total = 0.0,
        )
    }

    @PostMapping("/{cartId}/lines")
    fun addCartLine(
        @PathVariable cartId: String,
        @RequestParam productVariantId: String,
    ): CartDTO {
        return cartRepository.addLine(
            cartId = cartId,
            productVariantId = productVariantId,
        )
    }

    @PatchMapping("/{cartId}/lines")
    fun updateCartLine(
        @PathVariable cartId: String,
        @RequestBody cartLine: CartLineDTO,
    ): CartDTO {
        return cartRepository.updateLine(
            cartId = cartId,
            cartLineId = cartLine.id!!,
            quantity = cartLine.quantity!!,
        )
    }
}