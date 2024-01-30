package me.lucasbatista.vienna.api.dto

data class PaymentIntentDTO(
    val clientKey: String,
    val clientSecret: String,
)