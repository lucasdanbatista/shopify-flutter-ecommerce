package me.lucasbatista.vienna.sdk.entity

import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id

@Entity
data class Address(
    val recipientFirstName: String,

    val recipientLastName: String,

    val addressLine1: String,

    val addressLine2: String,

    val city: String,

    val state: String,

    val country: String,

    val zipcode: String,
) {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    lateinit var id: String
}