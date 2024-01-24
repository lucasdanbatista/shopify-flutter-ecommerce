package me.lucasbatista.vienna.api.dto.request

data class SignUpRequestDTO(
    val firstName: String,
    val lastName: String,
    val email: String,
    val password: String,
)