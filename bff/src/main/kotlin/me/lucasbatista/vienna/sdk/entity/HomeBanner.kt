package me.lucasbatista.vienna.sdk.entity

import java.net.URL

data class HomeBanner(
    val title: String,
    val image: URL,
    val productIds: List<String>,
)
