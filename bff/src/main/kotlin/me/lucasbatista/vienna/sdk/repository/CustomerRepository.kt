package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Customer

interface CustomerRepository {
    fun create(
        firstName: String,
        lastName: String,
        email: String,
        password: String,
    ): Customer

    fun findByAccessToken(accessToken: String): Customer
}