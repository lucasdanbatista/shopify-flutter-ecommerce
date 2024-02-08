package me.lucasbatista.vienna.mock.repository

import me.lucasbatista.vienna.sdk.entity.PaymentIntent
import me.lucasbatista.vienna.sdk.repository.PaymentRepository
import org.springframework.stereotype.Repository

@Repository
class MockedPaymentRepository : PaymentRepository {
    override fun createPaymentIntent(customerEmail: String, amount: Double): PaymentIntent {
        TODO("Not yet implemented")
    }
}
