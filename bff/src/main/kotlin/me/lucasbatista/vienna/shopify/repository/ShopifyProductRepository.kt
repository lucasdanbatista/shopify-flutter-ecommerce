package me.lucasbatista.vienna.shopify.repository

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.kotlin.readValue
import me.lucasbatista.vienna.api.util.fromBase64
import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.entity.Product
import me.lucasbatista.vienna.sdk.entity.ProductOption
import me.lucasbatista.vienna.sdk.entity.ProductVariant
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import me.lucasbatista.vienna.shopify.graphql.GetProductByIdQuery
import me.lucasbatista.vienna.shopify.graphql.GetProductsByCollectionIdQuery
import me.lucasbatista.vienna.shopify.graphql.GetProductsQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import org.springframework.stereotype.Repository
import java.net.URI
import java.net.URL
import me.lucasbatista.vienna.shopify.graphql.getproductbyidquery.Product as ShopifyProduct

@Repository
class ShopifyProductRepository(
    private val client: ShopifyGraphQLClient,
    private val objectMapper: ObjectMapper,
) : ProductRepository {
    override fun findAllByCategoryId(id: String): List<Product> {
        val query = GetProductsByCollectionIdQuery(
            GetProductsByCollectionIdQuery.Variables(id.fromBase64()),
        )
        val result = client.executeAsAdmin(query).data!!.collection!!.products
        return result.nodes.map(::mapProduct)
    }

    override fun findAllByIds(ids: List<String>): List<Product> {
        val decodedIds = ids.map { URI(it.fromBase64()).path.split("/").last() }
        if (decodedIds.isEmpty()) return listOf()
        var query = "id:"
        for (id in decodedIds) {
            query += id
            if (id != decodedIds.last()) {
                query += " OR "
            }
        }
        val graphqlQuery = GetProductsQuery(GetProductsQuery.Variables(query))
        val result = client.executeAsAdmin(graphqlQuery).data!!.products.nodes
        return result.map(::mapProduct)
    }

    override fun findById(id: String): Product {
        val query = GetProductByIdQuery(GetProductByIdQuery.Variables(id.fromBase64()))
        val result = client.executeAsAdmin(query).data!!.product!!
        return mapProduct(result)
    }

    override fun findProductsByTerm(term: String): List<Product> {
        val query = GetProductsQuery(GetProductsQuery.Variables(term))
        val result = client.executeAsAdmin(query).data!!.products.nodes
        return result.map(::mapProduct)
    }

    private fun mapProduct(result: Any): Product {
        val it = objectMapper.readValue<ShopifyProduct>(objectMapper.writeValueAsBytes(result))
        return Product(
            id = it.id.toBase64(),
            images = it.images.nodes.map { URL(it.url) },
            title = it.title,
            description = it.description,
            variants = it.variants.nodes.map {
                ProductVariant(
                    id = it.id.toBase64(),
                    image = if (it.image != null) URL(it.image.url) else null,
                    originalPrice = it.compareAtPrice!!.amount.toDouble(),
                    sellingPrice = it.price.amount.toDouble(),
                )
            },
            options = it.options.map {
                ProductOption(
                    id = it.id,
                    name = it.name,
                    values = it.values,
                )
            },
        )
    }
}