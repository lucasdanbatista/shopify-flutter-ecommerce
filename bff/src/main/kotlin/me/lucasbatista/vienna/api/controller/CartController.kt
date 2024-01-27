package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.CartDTO
import me.lucasbatista.vienna.api.dto.CartLineDTO
import me.lucasbatista.vienna.api.dto.ProductVariantDTO
import me.lucasbatista.vienna.api.util.AuthorizationHeaderUtil
import me.lucasbatista.vienna.sdk.entity.AuthenticationToken
import me.lucasbatista.vienna.sdk.entity.Cart
import me.lucasbatista.vienna.sdk.repository.CartRepository
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/v1/carts")
class CartController(private val repository: CartRepository) {
    @GetMapping("/{id}")
    fun getCartById(@PathVariable id: String): CartDTO {
        val result = repository.findById(id)
        return mapResult(result)
    }

    @PostMapping
    fun createCart(@RequestHeader authorization: String): CartDTO {
        val result = repository.create(
            customerAuthenticationToken = AuthenticationToken(
                accessToken = AuthorizationHeaderUtil.extractToken(authorization),
            ),
        )
        return CartDTO(
            id = result.id,
            lines = listOf(),
        )
    }

    @PostMapping("/{cartId}/lines")
    fun addCartLine(
        @PathVariable cartId: String,
        @RequestParam productVariantId: String,
    ): CartDTO {
        val result = repository.addLine(
            cartId = cartId,
            productVariantId = productVariantId,
        )
        return mapResult(result)
    }

    @PatchMapping("/{cartId}/lines")
    fun updateCartLine(
        @PathVariable cartId: String,
        @RequestBody cartLine: CartLineDTO,
    ): CartDTO {
        val result = repository.updateLine(
            cartId = cartId,
            cartLineId = cartLine.id!!,
            quantity = cartLine.quantity!!,
        )
        return mapResult(result)
    }

    private fun mapResult(result: Cart): CartDTO {
        return CartDTO(
            id = result.id,
            lines = result.lines.map {
                CartLineDTO(
                    id = it.id,
                    quantity = it.quantity,
                    total = it.total,
                    productVariant = ProductVariantDTO(
                        id = it.productVariant.id,
                        productId = it.productVariant.productId,
                        originalPrice = it.productVariant.originalPrice,
                        sellingPrice = it.productVariant.sellingPrice,
                        title = it.productVariant.title,
                        image = it.productVariant.image,
                    ),
                )
            },
            subtotal = result.subtotal,
            total = result.total,
        )
    }
}