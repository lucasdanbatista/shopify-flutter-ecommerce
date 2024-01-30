package me.lucasbatista.vienna.sdk.entity

data class PaymentIntent(
    val id: String,
    val clientKey: String,
    val clientSecret: String,
)