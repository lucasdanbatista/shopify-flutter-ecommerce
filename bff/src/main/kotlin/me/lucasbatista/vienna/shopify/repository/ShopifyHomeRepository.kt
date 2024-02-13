package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.entity.HomeSection
import me.lucasbatista.vienna.sdk.repository.HomeRepository
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import me.lucasbatista.vienna.shopify.graphql.GetMetaObjectsByTypeQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import org.springframework.stereotype.Repository

@Repository
class ShopifyHomeRepository(
    private val client: ShopifyGraphQLClient,
    private val productRepository: ProductRepository,
) : HomeRepository {
    override fun getSections(): List<HomeSection> {
        val query = GetMetaObjectsByTypeQuery(GetMetaObjectsByTypeQuery.Variables("home_section"))
        val result = client.executeAsAdmin(query).data!!.metaobjects.nodes
        return result.map { it ->
            val ids = it.fields
                .first { it.key == "products" }.value!!
                .split(",")
                .map {
                    it.replace("[0-9]", "")
                        .replace("[", "")
                        .replace("]", "")
                        .replace("\"", "")
                        .toBase64()
                }
            HomeSection(
                title = it.fields.first { it.key == "title" }.value!!,
                products = productRepository.findAllByIds(ids),
            )
        }
    }
}