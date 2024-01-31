package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.Product

interface ProductRepository {
    fun findAllByCategoryId(id: String): List<Product>

    fun findAllByIds(ids: List<String>): List<Product>

    fun findById(id: String): Product
}