package me.lucasbatista.vienna.api.dto

data class ProductOptionDTO(
    val id: String? = null,
    val name: String? = null,
    val values: List<String>? = null,
)