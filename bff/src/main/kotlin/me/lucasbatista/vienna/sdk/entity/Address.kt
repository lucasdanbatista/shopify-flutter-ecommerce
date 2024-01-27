package me.lucasbatista.vienna.sdk.entity

data class Address(
    val recipientFirstName: String,
    val recipientLastName: String,
    val line1: String,
    val line2: String,
    val city: String,
    val province: String,
    val country: String,
    val zipcode: String,
)