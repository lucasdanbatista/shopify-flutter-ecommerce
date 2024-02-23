package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.dto.CategoryDTO

interface CategoryRepository {
    fun findAll(): List<CategoryDTO>
}