package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Category

interface CategoryRepository {
    fun getCategories(): List<Category>
}