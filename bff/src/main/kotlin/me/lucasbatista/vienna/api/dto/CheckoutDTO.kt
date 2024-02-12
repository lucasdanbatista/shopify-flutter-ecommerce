package me.lucasbatista.vienna.api.dto

data class CheckoutDTO(
    val id: String? = null,
    val subtotal: Double? = null,
    val total: Double? = null,
    val availableShippingRates: List<ShippingRateDTO>? = null,
    val selectedShippingRate: ShippingRateDTO? = null,
)
