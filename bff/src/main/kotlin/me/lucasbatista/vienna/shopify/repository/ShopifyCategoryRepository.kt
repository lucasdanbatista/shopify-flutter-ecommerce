package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.dto.CategoryDTO
import me.lucasbatista.vienna.sdk.repository.CategoryRepository
import me.lucasbatista.vienna.shopify.graphql.ShopifyStorefrontApi
import me.lucasbatista.vienna.shopify.storefront.graphql.GetCategoriesQuery
import org.springframework.cache.annotation.CacheConfig
import org.springframework.cache.annotation.Cacheable
import org.springframework.stereotype.Repository
import java.net.URL

@Repository
@CacheConfig(cacheNames = ["categories"])
class ShopifyCategoryRepository(private val storefront: ShopifyStorefrontApi) : CategoryRepository {
    @Cacheable
    override fun findAll() = storefront
        .execute(GetCategoriesQuery())
        .data!!.collections.nodes.map {
            CategoryDTO(
                id = it.id.toBase64(),
                title = it.title,
                image = if (it.image != null) URL(it.image!!.url) else null,
            )
        }
}