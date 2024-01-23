package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Product

interface ProductRepository {
    fun findAllByCategoryId(id: String): List<Product>
}