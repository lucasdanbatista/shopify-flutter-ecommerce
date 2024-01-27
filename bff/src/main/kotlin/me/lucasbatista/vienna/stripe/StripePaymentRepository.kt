package me.lucasbatista.vienna.stripe

import com.stripe.Stripe
import com.stripe.model.PaymentIntent
import com.stripe.param.PaymentIntentCreateParams
import me.lucasbatista.vienna.sdk.entity.PaymentIntentCredentials
import me.lucasbatista.vienna.sdk.repository.PaymentRepository
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Repository

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

    override fun createPaymentIntent(amount: Long): PaymentIntentCredentials {
        val secret = PaymentIntent.create(
            PaymentIntentCreateParams
                .builder()
                .setSetupFutureUsage(PaymentIntentCreateParams.SetupFutureUsage.OFF_SESSION)
                .setAmount(amount)
                .setCurrency("brl")
                .build()
        ).clientSecret!!
        return PaymentIntentCredentials(
            clientKey = Stripe.clientId,
            clientSecret = secret,
        )
    }
}