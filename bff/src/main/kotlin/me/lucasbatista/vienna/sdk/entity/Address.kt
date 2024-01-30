package me.lucasbatista.vienna.sdk.entity

import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.Id

@Entity
data class Address(
    @Id
    @GeneratedValue
    val id: Int? = null,

    val recipientFirstName: String,

    val recipientLastName: String,

    val line1: String,

    val line2: String,

    val city: String,

    val province: String,

    val country: String,

    val zipcode: String,
)