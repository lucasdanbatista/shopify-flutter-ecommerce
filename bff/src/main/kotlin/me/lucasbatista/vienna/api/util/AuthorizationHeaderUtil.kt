package me.lucasbatista.vienna.api.util

object AuthorizationHeaderUtil {
    fun extractToken(authorization: String?) = authorization?.replace("Bearer", "")?.trim() ?: ""
}