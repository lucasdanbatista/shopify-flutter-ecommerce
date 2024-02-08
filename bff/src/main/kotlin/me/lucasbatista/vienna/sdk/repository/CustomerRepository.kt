package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Customer

interface CustomerRepository {
    fun create(name: String, email: String, password: String)

    fun findByAccessToken(accessToken: String): Customer
}