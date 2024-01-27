package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.CheckoutDTO
import me.lucasbatista.vienna.api.dto.request.CreatePaymentIntentRequestDTO
import me.lucasbatista.vienna.sdk.entity.Address
import me.lucasbatista.vienna.sdk.repository.CartRepository
import me.lucasbatista.vienna.sdk.repository.CheckoutRepository
import me.lucasbatista.vienna.sdk.repository.PaymentRepository
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/v1/checkouts")
class CheckoutController(
    private val cartRepository: CartRepository,
    private val checkoutRepository: CheckoutRepository,
    private val paymentRepository: PaymentRepository,
) {
    @PostMapping
    fun createCheckout(@RequestParam cartId: String): CheckoutDTO {
        val result = checkoutRepository.create(
            cart = cartRepository.findById(cartId),
            //TODO: remove mocked address
            shippingAddress = Address(
                recipientLastName = "Lucas",
                recipientFirstName = "Batista",
                line1 = "Rua São Joaquim, 518",
                line2 = "Bairro São Vicente",
                city = "Itajaí",
                province = "Santa Catarina",
                zipcode = "88309000",
                country = "BR",
            ),
        )
        return CheckoutDTO(
            id = result.id,
            total = result.total,
        )
    }

    @PostMapping("/payment-intents")
    fun createPaymentIntent(@RequestBody body: CreatePaymentIntentRequestDTO) =
        paymentRepository.createPaymentIntent(100L)
}