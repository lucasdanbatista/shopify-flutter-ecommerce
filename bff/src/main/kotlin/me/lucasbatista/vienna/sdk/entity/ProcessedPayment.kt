package me.lucasbatista.vienna.sdk.entity

data class ProcessedPayment(
    val completionToken: String,
    val totalPaid: Double,
)