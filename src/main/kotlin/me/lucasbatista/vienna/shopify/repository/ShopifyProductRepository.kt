package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.entity.Product
import me.lucasbatista.vienna.sdk.entity.ProductVariant
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import me.lucasbatista.vienna.shopify.graphql.GetProductByIdQuery
import me.lucasbatista.vienna.shopify.graphql.GetProductsQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import org.springframework.stereotype.Repository
import java.net.URI

@Repository
class ShopifyProductRepository(private val client: ShopifyGraphQLClient) : ProductRepository {
    override fun findAllByCategoryId(id: String): List<Product> {
        val result = client.executeAsAdmin(
            GetProductsQuery(
                GetProductsQuery.Variables("tag:$id"),
            ),
        ).data!!.products.nodes
        return result.map {
            Product(
                id = it.id.split("/").last(),
            )
        }
    }

    override fun findById(id: String): Product {
        val result = client.executeAsAdmin(
            GetProductByIdQuery(
                GetProductByIdQuery.Variables("gid://shopify/Product/$id"),
            ),
        ).data!!.product
        return Product(
            id = result.id.split("/").last(),
            title = result.title,
            description = result.description,
            images = result.images.nodes.map { URI(it.url).toURL() },
            variants = result.variants.nodes.map {
                ProductVariant(
                    id = it.id.split("/").last(),
                    originalPrice = it.compareAtPrice.amount.toDouble(),
                    sellingPrice = it.price.amount.toDouble(),
                )
            },
        )
    }
}