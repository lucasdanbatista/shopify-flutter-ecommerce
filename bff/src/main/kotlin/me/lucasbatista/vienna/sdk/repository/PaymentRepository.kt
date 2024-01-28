package me.lucasbatista.vienna.sdk.repository

interface PaymentRepository {
    fun processPayment(customerEmail: String, paymentMethodId: String, amount: Double)
}