package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Address

interface AddressRepository {
    fun findById(customerAccessToken: String, id: String): Address

    fun findAll(customerAccessToken: String): List<Address>

    fun deleteById(customerAccessToken: String, id: String)

    fun create(
        customerAccessToken: String,
        recipientFirstName: String,
        recipientLastName: String,
        line1: String,
        line2: String,
        city: String,
        province: String,
        zipcode: String,
    ): Address

    fun update(
        customerAccessToken: String,
        id: String,
        recipientFirstName: String,
        recipientLastName: String,
        line1: String,
        line2: String,
        city: String,
        province: String,
        zipcode: String,
    ): Address
}
