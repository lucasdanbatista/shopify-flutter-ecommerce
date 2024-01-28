package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.ProcessedPayment

interface PaymentRepository {
    fun processPayment(
        customerEmail: String,
        paymentMethodId: String,
        amount: Double,
    ): ProcessedPayment
}