package me.lucasbatista.vienna.sdk.entity

import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id

@Entity
data class Address(
    val recipientName: String,

    val street: String,

    val neighborhood: String,

    val buildingNumber: String,

    val complement: String? = null,

    val city: String,

    val state: String,

    val country: String,

    val zipcode: String,
) {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    lateinit var id: String
}