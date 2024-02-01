package me.lucasbatista.vienna.sdk.entity

import java.net.URL

data class Category(
    val id: String,
    val title: String,
    val image: URL? = null,
)