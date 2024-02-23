package me.lucasbatista.vienna.sdk.repository

interface CustomerRepository {
    fun create(name: String, email: String, password: String)
}