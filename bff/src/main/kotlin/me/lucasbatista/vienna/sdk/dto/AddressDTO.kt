package me.lucasbatista.vienna.sdk.dto

data class AddressDTO(
    var id: String? = null,
    var recipientName: String? = null,
    var street: String? = null,
    var buildingNumber: String? = null,
    var complement: String? = null,
    var neighborhood: String? = null,
    var city: String? = null,
    var state: String? = null,
    var country: String? = null,
    var zipcode: String? = null,
)