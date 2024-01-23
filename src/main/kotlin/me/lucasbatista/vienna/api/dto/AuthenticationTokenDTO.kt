package me.lucasbatista.vienna.api.dto

data class AuthenticationTokenDTO(
    var accessToken: String? = null,
) {
    class Builder {
        private val it = AuthenticationTokenDTO()

        fun withAccessToken(accessToken: String): Builder {
            it.accessToken = accessToken
            return this
        }

        fun build() = it
    }
}
