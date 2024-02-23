package me.lucasbatista.vienna.shopify.repository

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.kotlin.readValue
import me.lucasbatista.vienna.api.util.fromBase64
import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.dto.ProductDTO
import me.lucasbatista.vienna.sdk.dto.ProductOptionDTO
import me.lucasbatista.vienna.sdk.dto.ProductVariantDTO
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import me.lucasbatista.vienna.shopify.graphql.ShopifyStorefrontApi
import me.lucasbatista.vienna.shopify.storefront.graphql.GetProductByIdQuery
import me.lucasbatista.vienna.shopify.storefront.graphql.GetProductsByCollectionIdQuery
import me.lucasbatista.vienna.shopify.storefront.graphql.GetProductsQuery
import org.springframework.stereotype.Repository
import java.net.URI
import java.net.URL
import me.lucasbatista.vienna.shopify.storefront.graphql.getproductbyidquery.Product as ShopifyProduct

@Repository
class ShopifyProductRepository(
    private val storefront: ShopifyStorefrontApi,
    private val objectMapper: ObjectMapper,
) : ProductRepository {
    override fun findAllByCategoryId(id: String): List<ProductDTO> {
        val query = GetProductsByCollectionIdQuery(
            GetProductsByCollectionIdQuery.Variables(id.fromBase64()),
        )
        val result = storefront.execute(query).data!!.collection!!.products
        return result.nodes.map(::mapProduct)
    }

    override fun findAllByIds(ids: List<String>): List<ProductDTO> {
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
        val result = storefront.execute(graphqlQuery).data!!.products.nodes
        return result.map(::mapProduct)
    }

    override fun findById(id: String): ProductDTO {
        val query = GetProductByIdQuery(GetProductByIdQuery.Variables(id.fromBase64()))
        val result = storefront.execute(query).data!!.product!!
        return mapProduct(result)
    }

    override fun findProductsByTerm(term: String): List<ProductDTO> {
        val query = GetProductsQuery(GetProductsQuery.Variables(term))
        val result = storefront.execute(query).data!!.products.nodes
        return result.map(::mapProduct)
    }

    private fun mapProduct(result: Any): ProductDTO {
        val it = objectMapper.readValue<ShopifyProduct>(objectMapper.writeValueAsBytes(result))
        return ProductDTO(
            id = it.id.toBase64(),
            images = it.images.nodes.map { URL(it.url) },
            title = it.title,
            description = it.description,
            variants = it.variants.nodes.map {
                ProductVariantDTO(
                    id = it.id.toBase64(),
                    image = if (it.image != null) URL(it.image!!.url) else null,
                    originalPrice = it.compareAtPrice!!.amount.toDouble(),
                    sellingPrice = it.price.amount.toDouble(),
                )
            },
            options = it.options.map {
                ProductOptionDTO(
                    id = it.id,
                    name = it.name,
                    values = it.values,
                )
            },
        )
    }
}