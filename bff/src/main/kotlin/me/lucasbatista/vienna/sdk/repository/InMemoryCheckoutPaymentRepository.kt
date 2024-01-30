package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.CheckoutPayment
import org.springframework.data.repository.CrudRepository

interface InMemoryCheckoutPaymentRepository : CrudRepository<CheckoutPayment, Int> {
    fun findByCompletionToken(id: String): CheckoutPayment
}