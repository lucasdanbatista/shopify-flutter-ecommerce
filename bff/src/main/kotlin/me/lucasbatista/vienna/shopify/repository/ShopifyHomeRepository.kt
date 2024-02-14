package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.entity.HomeBanner
import me.lucasbatista.vienna.sdk.entity.HomeSection
import me.lucasbatista.vienna.sdk.repository.HomeRepository
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import me.lucasbatista.vienna.shopify.graphql.GetMetaObjectsByTypeQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import org.springframework.stereotype.Repository
import java.net.URL

@Repository
class ShopifyHomeRepository(
    private val client: ShopifyGraphQLClient,
    private val productRepository: ProductRepository,
) : HomeRepository {
    override fun getBanners(): List<HomeBanner> {
        val query = GetMetaObjectsByTypeQuery(GetMetaObjectsByTypeQuery.Variables("home_banner"))
        val result = client.executeAsAdmin(query).data!!.metaobjects.nodes
        return result.map { it ->
            val ids = it.fields
                .first { it.key == "products" }.value!!
                .split(",")
                .map(::parseProductIds)
            HomeBanner(
                title = it.fields.first { it.key == "title" }.value!!,
                image = URL(it.fields.first { it.key == "image_url" }.value!!),
                productIds = ids,
                position = it.fields.first { it.key == "position" }.value!!.toInt(),
            )
        }.sortedBy { it.position }
    }

    override fun getSections(): List<HomeSection> {
        val query = GetMetaObjectsByTypeQuery(GetMetaObjectsByTypeQuery.Variables("home_section"))
        val result = client.executeAsAdmin(query).data!!.metaobjects.nodes
        return result.map { it ->
            val ids = it.fields
                .first { it.key == "products" }.value!!
                .split(",")
                .map(::parseProductIds)
            HomeSection(
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