package me.lucasbatista.vienna.shopify.repository

import com.fasterxml.jackson.databind.ObjectMapper
import me.lucasbatista.vienna.api.util.fromBase64
import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.entity.Cart
import me.lucasbatista.vienna.sdk.entity.CartLine
import me.lucasbatista.vienna.sdk.repository.CartRepository
import me.lucasbatista.vienna.shopify.graphql.*
import me.lucasbatista.vienna.shopify.graphql.addcartlinemutation.ProductVariant
import org.springframework.stereotype.Repository
import java.net.URL

@Repository
class ShopifyCartRepository(
    private val client: ShopifyGraphQLClient,
    private val objectMapper: ObjectMapper,
) : CartRepository {
    override fun findById(id: String): Cart {
        val query = GetCartByIdQuery(GetCartByIdQuery.Variables(id.fromBase64()))
        val result = client.executeAsAdmin(query).data!!.cart!!
        return mapCart(result)
    }

    override fun create(customerAccessToken: String?): Cart {
        val query = CreateCartMutation(CreateCartMutation.Variables(customerAccessToken))
        val result = client.executeAsAdmin(query).data!!.cartCreate!!.cart!!
        return Cart(result.id.toBase64())
    }

    override fun addLine(cartId: String, productVariantId: String): Cart {
        val result = client.executeAsAdmin(
            AddCartLineMutation(
                AddCartLineMutation.Variables(
                    cartId = cartId.fromBase64(),
                    merchadiseId = productVariantId.fromBase64(),
                ),
            ),
        ).data!!.cartLinesAdd!!.cart!!
        return mapCart(result)
    }

    override fun updateLine(cartId: String, cartLineId: String, quantity: Int): Cart {
        val result = client.executeAsAdmin(
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

    private fun mapCart(data: Any): Cart {
        val result = objectMapper.readValue(
            objectMapper.writeValueAsBytes(data),
            me.lucasbatista.vienna.shopify.graphql.addcartlinemutation.Cart::class.java,
        )
        return Cart(
            id = result.id.toBase64(),
            lines = result.lines.nodes.map {
                val merchandise = it.merchandise as ProductVariant
                CartLine(
                    id = it.id.toBase64(),
                    quantity = it.quantity,
                    total = it.cost.totalAmount.amount.toDouble(),
                    productVariant = me.lucasbatista.vienna.sdk.entity.ProductVariant(
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