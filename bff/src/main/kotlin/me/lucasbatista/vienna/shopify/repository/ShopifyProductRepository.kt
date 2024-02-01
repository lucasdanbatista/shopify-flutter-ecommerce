package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.entity.Product
import me.lucasbatista.vienna.sdk.entity.ProductVariant
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import me.lucasbatista.vienna.shopify.graphql.GetProductByIdQuery
import me.lucasbatista.vienna.shopify.graphql.GetProductsQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import org.springframework.stereotype.Repository
import java.net.URI
import java.net.URL

@Repository
class ShopifyProductRepository(private val client: ShopifyGraphQLClient) : ProductRepository {
    override fun findAllByCategoryId(id: String) = findAllByQuery("collection:$id")

    override fun findAllByIds(ids: List<String>): List<Product> {
        if (ids.isEmpty()) return listOf()
        var query = "id:"
        for (id in ids) {
            query += id
            if (id != ids.last()) {
                query += " OR "
            }
        }
        return findAllByQuery(query.trim())
    }

    override fun findById(id: String): Product {
        val result = client.executeAsAdmin(
            GetProductByIdQuery(
                GetProductByIdQuery.Variables("gid://shopify/Product/$id"),
            ),
        ).data!!.product!!
        return Product(
            id = result.id.split("/").last(),
            title = result.title,
            description = result.description,
            images = result.images.nodes.map { URI(it.url).toURL() },
            variants = result.variants.nodes.map {
                ProductVariant(
                    id = it.id.split("/").last(),
                    originalPrice = it.compareAtPrice!!.amount.toDouble(),
                    sellingPrice = it.price.amount.toDouble(),
                )
            },
        )
    }

    private fun findAllByQuery(query: String): List<Product> {
        val result = client.executeAsAdmin(
            GetProductsQuery(
                GetProductsQuery.Variables(query),
            ),
        ).data!!.products.nodes
        return result.map { it ->
            Product(
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
}