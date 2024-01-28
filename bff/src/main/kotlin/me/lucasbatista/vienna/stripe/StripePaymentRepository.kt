package me.lucasbatista.vienna.stripe

import com.stripe.Stripe
import com.stripe.model.Customer
import com.stripe.model.PaymentIntent
import com.stripe.param.CustomerSearchParams
import com.stripe.param.PaymentIntentCreateParams
import com.stripe.param.PaymentIntentCreateParams.AutomaticPaymentMethods
import com.stripe.param.PaymentIntentCreateParams.AutomaticPaymentMethods.AllowRedirects.NEVER
import com.stripe.param.PaymentIntentCreateParams.SetupFutureUsage.OFF_SESSION
import me.lucasbatista.vienna.sdk.entity.ProcessedPayment
import me.lucasbatista.vienna.sdk.repository.PaymentRepository
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Repository
import kotlin.math.roundToLong

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

    override fun processPayment(
        customerEmail: String,
        paymentMethodId: String,
        amount: Double,
    ): ProcessedPayment {
        val customer = Customer.search(
            CustomerSearchParams.builder()
                .setQuery("email:\"$customerEmail\"")
                .setLimit(1)
                .build(),
        ).data!!.first()
        val payment = PaymentIntent.create(
            PaymentIntentCreateParams
                .builder()
                .setCustomer(customer.id)
                .setPaymentMethod(paymentMethodId)
                .setSetupFutureUsage(OFF_SESSION)
                .setAutomaticPaymentMethods(
                    AutomaticPaymentMethods
                        .builder()
                        .setEnabled(true)
                        .setAllowRedirects(NEVER)
                        .build(),
                )
                .setAmount(amount.roundToLong() * 100)
                .setCurrency("BRL")
                .setConfirm(true)
                .build()
        )
        return ProcessedPayment(
            completionToken = payment.id,
            totalPaid = payment.amount.toDouble() / 100,
        )
    }
}