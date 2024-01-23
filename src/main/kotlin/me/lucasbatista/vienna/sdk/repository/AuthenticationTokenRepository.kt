package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.AuthenticationToken

interface AuthenticationTokenRepository {
    fun issue(email: String, password: String): AuthenticationToken
}