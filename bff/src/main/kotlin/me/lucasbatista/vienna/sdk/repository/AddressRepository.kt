package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.dto.AddressDTO
import me.lucasbatista.vienna.sdk.entity.Address

interface AddressRepository {
    fun findById(customerAccessToken: String, id: String): Address

    fun findAll(customerAccessToken: String): List<Address>

    fun deleteById(customerAccessToken: String, id: String)

    fun create(customerAccessToken: String, address: AddressDTO): Address

    fun update(customerAccessToken: String, address: AddressDTO): Address
}
