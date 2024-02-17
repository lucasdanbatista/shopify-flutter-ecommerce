package me.lucasbatista.vienna.sdk.entity

class Customer(
    id: String? = null,
    name: String? = null,
    email: String? = null,
    phone: String? = null,
    document: String? = null,
) {
    lateinit var id: String
    lateinit var name: String
    lateinit var email: String
    lateinit var phone: String
    lateinit var document: String

    init {
        id?.let { this.id = id }
        name?.let { this.name = name }
        email?.let { this.email = email }
        phone?.let { this.phone = phone }
        document?.let { this.document = document }
    }
}