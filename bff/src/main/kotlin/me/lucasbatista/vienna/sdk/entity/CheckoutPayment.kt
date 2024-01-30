package me.lucasbatista.vienna.sdk.entity

import jakarta.persistence.*

@Entity
data class CheckoutPayment(
    @Id
    @GeneratedValue
    val id: Int? = null,

    @Column(unique = true)
    val checkoutId: String,

    val totalPaid: Double,

    @Column(unique = true)
    val completionToken: String,

    @ManyToOne
    val billingAddress: Address,
)