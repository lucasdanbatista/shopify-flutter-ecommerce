package me.lucasbatista.vienna.sdk.dto

data class AddressDTO(
    var id: String? = null,
    var recipientFirstName: String? = null,
    var recipientLastName: String? = null,
    var addressLine1: String? = null,
    var addressLine2: String? = null,
    var zipcode: String? = null,
    var city: String? = null,
    var state: String? = null,
    var country: String? = null,
)