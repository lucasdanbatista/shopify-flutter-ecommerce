package me.lucasbatista.vienna.api.dto

data class CustomerDTO(
    var id: String? = null,
) {
    class Builder {
        private val it = CustomerDTO()

        fun withId(id: String): Builder {
            it.id = id
            return this
        }

        fun build() = it
    }
}