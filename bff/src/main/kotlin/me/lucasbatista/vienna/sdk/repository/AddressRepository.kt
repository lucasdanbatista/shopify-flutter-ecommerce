package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Address

interface AddressRepository {
    fun findById(id: String): Address
}