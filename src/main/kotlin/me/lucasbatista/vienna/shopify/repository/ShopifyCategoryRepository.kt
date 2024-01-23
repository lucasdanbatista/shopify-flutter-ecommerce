package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.entity.Category
import me.lucasbatista.vienna.sdk.repository.CategoryRepository
import me.lucasbatista.vienna.shopify.graphql.GetCategoriesQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import org.springframework.stereotype.Repository

@Repository
class ShopifyCategoryRepository(private val client: ShopifyGraphQLClient) : CategoryRepository {
    override fun findAll() = client.executeAsAdmin(GetCategoriesQuery())
        .data!!.productTags.edges.map { Category(it.node) }
}