package me.lucasbatista.vienna.shopify.repository

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.kotlin.readValue
import me.lucasbatista.vienna.sdk.entity.Product
import me.lucasbatista.vienna.sdk.entity.ProductVariant
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import me.lucasbatista.vienna.shopify.graphql.GetProductByIdQuery
import me.lucasbatista.vienna.shopify.graphql.GetProductsByCollectionIdQuery
import me.lucasbatista.vienna.shopify.graphql.GetProductsQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import org.springframework.stereotype.Repository
import java.net.URL
import me.lucasbatista.vienna.shopify.graphql.getproductsquery.Product as ShopifyProduct

@Repository
class ShopifyProductRepository(
    private val client: ShopifyGraphQLClient,
    private val objectMapper: ObjectMapper,
) : ProductRepository {
    override fun findAllByCategoryId(id: String): List<Product> {
        val result = client.executeAsAdmin(
            GetProductsByCollectionIdQuery(
                GetProductsByCollectionIdQuery.Variables("gid://shopify/Collection/$id"),
            ),
        ).data!!.collection!!.products
        return result.nodes.map(::mapProduct)
    }

    override fun findAllByIds(ids: List<String>): List<Product> {
        if (ids.isEmpty()) return listOf()
        var query = "id:"
        for (id in ids) {
            query += id
            if (id != ids.last()) {
                query += " OR "
            }
        }
        val result = client.executeAsAdmin(
            GetProductsQuery(
                GetProductsQuery.Variables(query),
            ),
        ).data!!.products.nodes
        return result.map(::mapProduct)
    }

    override fun findById(id: String): Product {
        val result = client.executeAsAdmin(
            GetProductByIdQuery(
                GetProductByIdQuery.Variables("gid://shopify/Product/$id"),
            ),
        ).data!!.product!!
        return mapProduct(result)
    }

    private fun mapProduct(result: Any): Product {
        val it = objectMapper.readValue<ShopifyProduct>(objectMapper.writeValueAsBytes(result))
        return Product(
            id = it.id.split("/").last(),
            images = it.images.nodes.map { URL(it.url) },
            title = it.title,
            description = it.description,
            variants = it.variants.nodes.map {
                ProductVariant(
                    id = it.id.split("/").last(),
                    originalPrice = it.compareAtPrice!!.amount.toDouble(),
                    sellingPrice = it.price.amount.toDouble(),
                )
            },
        )
    }
}