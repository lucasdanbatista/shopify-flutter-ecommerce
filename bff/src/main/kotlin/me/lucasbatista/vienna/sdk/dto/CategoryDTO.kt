package me.lucasbatista.vienna.sdk.dto

import java.net.URL

data class CategoryDTO(
    var id: String? = null,
    var title: String? = null,
    var image: URL? = null,
)
