package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.dto.ProductDTO

interface ProductRepository {
    fun findAllByCategoryId(id: String): List<ProductDTO>

    fun findAllByIds(ids: List<String>): List<ProductDTO>

    fun findById(id: String): ProductDTO

    fun findProductsByTerm(term: String): List<ProductDTO>
}