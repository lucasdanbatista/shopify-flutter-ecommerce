package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.PaymentIntentCredentials

interface PaymentRepository {
    fun createPaymentIntent(amount: Long): PaymentIntentCredentials
}