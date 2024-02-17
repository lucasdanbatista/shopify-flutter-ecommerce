package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.entity.Category
import me.lucasbatista.vienna.sdk.repository.CategoryRepository
import me.lucasbatista.vienna.shopify.storefront.graphql.GetCategoriesQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyStorefrontApi
import org.springframework.stereotype.Repository
import java.net.URL

@Repository
class ShopifyCategoryRepository(private val storefront: ShopifyStorefrontApi) :
    CategoryRepository {
    override fun findAll() = storefront
        .execute(GetCategoriesQuery())
        .data!!.collections.nodes.map {
            Category(
                id = it.id.toBase64(),
                title = it.title,
                image = if (it.image != null) URL(it.image!!.url) else null,
            )
        }
}