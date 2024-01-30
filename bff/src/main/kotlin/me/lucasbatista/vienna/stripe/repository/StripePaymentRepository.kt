package me.lucasbatista.vienna.stripe.repository

import com.stripe.Stripe
import com.stripe.param.PaymentIntentCreateParams
import me.lucasbatista.vienna.sdk.entity.PaymentIntent
import me.lucasbatista.vienna.sdk.repository.PaymentRepository
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Repository
import com.stripe.model.PaymentIntent as StripePaymentIntent

@Repository
class StripePaymentRepository(
    @Value("\${stripe.clientId}")
    clientId: String,

    @Value("\${stripe.apiKey}")
    apiKey: String,
) : PaymentRepository {
    init {
        Stripe.clientId = clientId
        Stripe.apiKey = apiKey
    }

    override fun createPaymentIntent(customerEmail: String, amount: Double): PaymentIntent {
        val payment = StripePaymentIntent.create(
            PaymentIntentCreateParams
                .builder()
                .setAmount(amount.toString().replace(".", "").toLong() * 10)
                .setCurrency("BRL")
                .build()
        )
        return PaymentIntent(
            id = payment.id,
            clientKey = Stripe.clientId,
            clientSecret = payment.clientSecret,
        )
    }
}