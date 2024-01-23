package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.entity.Product
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import me.lucasbatista.vienna.shopify.graphql.GetProductsQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import org.springframework.stereotype.Repository

@Repository
class ShopifyProductRepository(private val client: ShopifyGraphQLClient) : ProductRepository {
    override fun findAllByCategoryId(id: String) =
        client.executeAsAdmin(GetProductsQuery(GetProductsQuery.Variables("tag:$id")))
            .data!!.products.nodes.map { Product(it.id) }
}