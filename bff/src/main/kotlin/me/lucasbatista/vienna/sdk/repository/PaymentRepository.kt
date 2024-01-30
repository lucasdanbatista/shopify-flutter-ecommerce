package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.PaymentIntent

interface PaymentRepository {
    fun createPaymentIntent(customerEmail: String, amount: Double): PaymentIntent
}