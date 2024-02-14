package me.lucasbatista.vienna.api.dto

import java.net.URL

data class HomeBannerDTO(
    var title: String? = null,
    var image: URL? = null,
    var productIds: List<String>? = null,
)