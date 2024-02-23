package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.dto.AuthenticationTokenDTO

interface AuthenticationTokenRepository {
    fun issue(email: String, password: String): AuthenticationTokenDTO
}