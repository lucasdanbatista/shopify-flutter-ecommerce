package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.CartDTO
import me.lucasbatista.vienna.api.dto.CartLineDTO
import me.lucasbatista.vienna.api.dto.ProductVariantDTO
import me.lucasbatista.vienna.api.util.AuthorizationHeaderUtil
import me.lucasbatista.vienna.sdk.entity.AuthenticationToken
import me.lucasbatista.vienna.sdk.entity.Cart
import me.lucasbatista.vienna.sdk.repository.*
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/v1/carts")
class CartController(
    private val cartRepository: CartRepository,
    private val checkoutRepository: CheckoutRepository,
    private val paymentRepository: PaymentRepository,
    private val addressRepository: AddressRepository,
    private val customerRepository: CustomerRepository,
) {
    @GetMapping("/{id}")
    fun getCartById(@PathVariable id: String): CartDTO {
        val result = cartRepository.findById(id)
        return mapResult(result)
    }

    @PostMapping
    fun createCart(@RequestHeader authorization: String): CartDTO {
        val result = cartRepository.create(
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
        val result = cartRepository.addLine(
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
        val result = cartRepository.updateLine(
            cartId = cartId,
            cartLineId = cartLine.id!!,
            quantity = cartLine.quantity!!,
        )
        return mapResult(result)
    }

    @PostMapping("/{cartId}/checkout")
    fun checkout(
        @RequestHeader("Authorization") authorization: String,
        @PathVariable cartId: String,
        @RequestParam shippingAddressId: String,
        @RequestParam paymentMethodId: String,
    ) {
        val customer = customerRepository.findByAccessToken(
            accessToken = AuthorizationHeaderUtil.extractToken(authorization),
        )
        val shippingAddress = addressRepository.findById(shippingAddressId)
        val checkout = checkoutRepository.create(
            customerEmail = customer.email,
            cart = cartRepository.findById(cartId),
            shippingAddress = shippingAddress,
        )
        val payment = paymentRepository.processPayment(
            customerEmail = customer.email,
            paymentMethodId = paymentMethodId,
            amount = checkout.total,
        )
        checkoutRepository.complete(checkout.id, payment, shippingAddress)
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