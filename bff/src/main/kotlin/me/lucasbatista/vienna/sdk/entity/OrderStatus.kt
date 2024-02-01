package me.lucasbatista.vienna.sdk.entity

enum class OrderStatus {
    PAYMENT_REJECTED,
    WAITING_PAYMENT,
    PAID,
    ON_THE_WAY,
    CANCELED,
    DELIVERED,
    UNKNOWN_STATUS,
}