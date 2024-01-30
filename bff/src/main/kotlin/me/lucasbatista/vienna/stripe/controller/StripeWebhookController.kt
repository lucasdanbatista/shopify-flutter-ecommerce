package me.lucasbatista.vienna.stripe.controller

import com.stripe.model.Charge
import me.lucasbatista.vienna.sdk.repository.CheckoutRepository
import me.lucasbatista.vienna.sdk.repository.InMemoryCheckoutPaymentRepository
import me.lucasbatista.vienna.stripe.dto.EventDTO
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import me.lucasbatista.vienna.stripe.dto.EventDTO.Data.Charge as ChargeData

@RestController
@RequestMapping("/v1/payment-gateways/stripe/webhooks")
class StripeWebhookController(
    private val checkoutRepository: CheckoutRepository,
    private val inMemoryCheckoutPaymentRepository: InMemoryCheckoutPaymentRepository,
) {
    @PostMapping("/charge-succeeded")
    fun chargeSucceeded(@RequestBody event: EventDTO<ChargeData>) {
        val charge = Charge.retrieve(event.data.`object`.id)
        val payment = inMemoryCheckoutPaymentRepository.findByCompletionToken(charge.paymentIntent)
        checkoutRepository.complete(payment)
    }
}