package me.lucasbatista.vienna.shopify.repository

import com.fasterxml.jackson.databind.ObjectMapper
import me.lucasbatista.vienna.api.util.fromBase64
import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.dto.CartDTO
import me.lucasbatista.vienna.sdk.dto.CartLineDTO
import me.lucasbatista.vienna.sdk.dto.ProductVariantDTO
import me.lucasbatista.vienna.sdk.repository.CartRepository
import me.lucasbatista.vienna.shopify.graphql.ShopifyStorefrontApi
import me.lucasbatista.vienna.shopify.storefront.graphql.AddCartLineMutation
import me.lucasbatista.vienna.shopify.storefront.graphql.CreateCartMutation
import me.lucasbatista.vienna.shopify.storefront.graphql.GetCartByIdQuery
import me.lucasbatista.vienna.shopify.storefront.graphql.UpdateCartLineMutation
import org.springframework.cache.annotation.CacheConfig
import org.springframework.cache.annotation.Cacheable
import org.springframework.stereotype.Repository
import java.net.URL
import me.lucasbatista.vienna.shopify.storefront.graphql.addcartlinemutation.Cart as ShopifyCart
import me.lucasbatista.vienna.shopify.storefront.graphql.addcartlinemutation.ProductVariant as ShopifyProductVariant

@Repository
@CacheConfig(cacheNames = ["cart"])
class ShopifyCartRepository(
    private val storefront: ShopifyStorefrontApi,
    private val objectMapper: ObjectMapper,
) : CartRepository {
    @Cacheable
    override fun findById(id: String): CartDTO {
        val query = GetCartByIdQuery(GetCartByIdQuery.Variables(id.fromBase64()))
        val result = storefront.execute(query).data!!.cart!!
        return mapCart(result)
    }

    override fun create(customerAccessToken: String?): CartDTO {
        val query = CreateCartMutation(CreateCartMutation.Variables(customerAccessToken))
        val result = storefront.execute(query).data!!.cartCreate!!.cart!!
        return CartDTO(result.id.toBase64())
    }

    override fun addLine(cartId: String, productVariantId: String): CartDTO {
        val result = storefront.execute(
            AddCartLineMutation(
                AddCartLineMutation.Variables(
                    cartId = cartId.fromBase64(),
                    merchadiseId = productVariantId.fromBase64(),
                ),
            ),
        ).data!!.cartLinesAdd!!.cart!!
        return mapCart(result)
    }

    override fun updateLine(cartId: String, cartLineId: String, quantity: Int): CartDTO {
        val result = storefront.execute(
            UpdateCartLineMutation(
                UpdateCartLineMutation.Variables(
                    cartId = cartId.fromBase64(),
                    lineId = cartLineId.fromBase64(),
                    quantity = quantity,
                ),
            ),
        ).data!!.cartLinesUpdate!!.cart!!
        return mapCart(result)
    }

    private fun mapCart(data: Any): CartDTO {
        val result = objectMapper.readValue(
            objectMapper.writeValueAsBytes(data),
            ShopifyCart::class.java,
        )
        return CartDTO(
            id = result.id.toBase64(),
            checkoutUrl = URL(result.checkoutUrl),
            lines = result.lines.nodes.map {
                val merchandise = it.merchandise as ShopifyProductVariant
                CartLineDTO(
                    id = it.id.toBase64(),
                    quantity = it.quantity,
                    total = it.cost.totalAmount.amount.toDouble(),
                    productVariant = ProductVariantDTO(
                        id = merchandise.id.toBase64(),
                        productId = merchandise.product.id.toBase64(),
                        originalPrice = merchandise.compareAtPrice!!.amount.toDouble(),
                        sellingPrice = merchandise.price.amount.toDouble(),
                        title = merchandise.product.title,
                        image = URL(merchandise.image!!.url),
                    ),
                )
            },
            subtotal = result.cost.subtotalAmount.amount.toDouble(),
            total = result.cost.totalAmount.amount.toDouble(),
        )
    }
}