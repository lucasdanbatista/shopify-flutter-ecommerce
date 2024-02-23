package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.dto.HomeBannerDTO
import me.lucasbatista.vienna.sdk.dto.HomeSectionDTO
import me.lucasbatista.vienna.sdk.repository.HomeRepository
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import me.lucasbatista.vienna.shopify.admin.graphql.GetFileQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyAdminApi
import me.lucasbatista.vienna.shopify.graphql.ShopifyStorefrontApi
import me.lucasbatista.vienna.shopify.storefront.graphql.GetMetaObjectsByTypeQuery
import org.springframework.cache.annotation.CacheConfig
import org.springframework.cache.annotation.Cacheable
import org.springframework.stereotype.Repository
import java.net.URI
import java.net.URL

@Repository
@CacheConfig(cacheNames = ["home"])
class ShopifyHomeRepository(
    private val storefront: ShopifyStorefrontApi,
    private val admin: ShopifyAdminApi,
    private val productRepository: ProductRepository,
) : HomeRepository {
    @Cacheable
    override fun getBanners(): List<HomeBannerDTO> {
        val query = GetMetaObjectsByTypeQuery(GetMetaObjectsByTypeQuery.Variables("home_banner"))
        val result = storefront.execute(query).data!!.metaobjects.nodes
        return result.map { it ->
            val ids = it.fields
                .first { it.key == "products" }.value!!
                .split(",")
                .map(::parseProductIds)
            HomeBannerDTO(
                title = it.fields.first { it.key == "title" }.value!!,
                image = URL(
                    admin.execute(
                        GetFileQuery(
                            GetFileQuery.Variables(
                                "id:${
                                    URI(it.fields.first { it.key == "image" }.value!!)
                                        .path
                                        .split("/")
                                        .last()
                                }",
                            ),
                        ),
                    ).data!!.files.nodes.first().preview!!.image!!.url,
                ),
                productIds = ids,
                position = it.fields.first { it.key == "position" }.value!!.toInt(),
            )
        }.sortedBy { it.position }
    }

    @Cacheable
    override fun getSections(): List<HomeSectionDTO> {
        val query = GetMetaObjectsByTypeQuery(GetMetaObjectsByTypeQuery.Variables("home_section"))
        val result = storefront.execute(query).data!!.metaobjects.nodes
        return result.map { it ->
            val ids = it.fields
                .first { it.key == "products" }.value!!
                .split(",")
                .map(::parseProductIds)
            HomeSectionDTO(
                title = it.fields.first { it.key == "title" }.value!!,
                products = productRepository.findAllByIds(ids),
            )
        }
    }

    private fun parseProductIds(it: String) = it.replace("[0-9]", "")
        .replace("[", "")
        .replace("]", "")
        .replace("\"", "")
        .toBase64()
}