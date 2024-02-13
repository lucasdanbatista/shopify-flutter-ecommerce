package me.lucasbatista.vienna.api.dto

data class HomeSectionDTO(
    var title: String? = null,
    var products: List<ProductDTO>? = null,
)