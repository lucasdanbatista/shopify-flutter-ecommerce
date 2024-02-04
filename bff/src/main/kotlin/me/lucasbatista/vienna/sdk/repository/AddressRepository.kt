package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Address
import org.springframework.data.repository.CrudRepository

interface AddressRepository {
    fun findById(id: String): Address
}

interface InMemoryAddressRepository : CrudRepository<Address, String>