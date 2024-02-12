package me.lucasbatista.vienna.sdk.entity

data class Checkout(
    val id: String,
    val subtotal: Double,
    val total: Double,
    val availableShippingRates: List<ShippingRate>,
    val selectedShippingRate: ShippingRate? = null,
)