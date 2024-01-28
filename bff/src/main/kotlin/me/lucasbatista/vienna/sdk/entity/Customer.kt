package me.lucasbatista.vienna.sdk.entity

class Customer(
    id: String? = null,
    email: String? = null,
) {
    lateinit var id: String
    lateinit var email: String

    init {
        id?.let { this.id = id }
        email?.let { this.email = email }
    }
}