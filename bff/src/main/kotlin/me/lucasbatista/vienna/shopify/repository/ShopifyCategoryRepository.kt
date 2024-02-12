package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.entity.Category
import me.lucasbatista.vienna.sdk.repository.CategoryRepository
import me.lucasbatista.vienna.shopify.graphql.GetCategoriesQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import org.springframework.stereotype.Repository
import java.net.URL

@Repository
class ShopifyCategoryRepository(private val client: ShopifyGraphQLClient) :
    CategoryRepository {
    override fun findAll() = client
        .executeAsAdmin(GetCategoriesQuery())
        .data!!.collections.nodes.map {
            Category(
                id = it.id.toBase64(),
                title = it.title,
                image = if (it.image != null) URL(it.image.url) else null,
            )
        }
}