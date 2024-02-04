package me.lucasbatista.vienna.api.dto

data class AddressDTO(
    var id: String? = null,
    var recipientFirstName: String? = null,
    var recipientLastName: String? = null,
    var line1: String? = null,
    var line2: String? = null,
    var city: String? = null,
    var province: String? = null,
    var country: String? = null,
    var zipcode: String? = null,
)