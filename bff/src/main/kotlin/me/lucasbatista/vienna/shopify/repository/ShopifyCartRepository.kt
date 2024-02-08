package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.entity.Cart
import me.lucasbatista.vienna.sdk.repository.CartRepository
import me.lucasbatista.vienna.shopify.graphql.*
import me.lucasbatista.vienna.shopify.mapper.CartMapper
import org.springframework.stereotype.Repository

@Repository
class ShopifyCartRepository(
    private val client: ShopifyGraphQLClient,
    private val mapper: CartMapper,
) : CartRepository {
    override fun findById(id: String): Cart {
        val result = client.executeAsAdmin(
            GetCartByIdQuery(
                GetCartByIdQuery.Variables("gid://shopify/Cart/$id"),
            ),
        ).data!!.cart!!
        return mapper.fromGraphQLResult(result)
    }

    override fun create(customerAccessToken: String?): Cart {
        val query = CreateCartMutation(CreateCartMutation.Variables(customerAccessToken))
        val result = client.executeAsAdmin(query).data!!.cartCreate!!.cart!!
        return Cart(result.id.split("/").last())
    }

    override fun addLine(cartId: String, productVariantId: String): Cart {
        val result = client.executeAsAdmin(
            AddCartLineMutation(
                AddCartLineMutation.Variables(
                    cartId = "gid://shopify/Cart/$cartId",
                    merchadiseId = "gid://shopify/ProductVariant/$productVariantId",
                ),
            ),
        ).data!!.cartLinesAdd!!.cart!!
        return mapper.fromGraphQLResult(result)
    }

    override fun updateLine(cartId: String, cartLineId: String, quantity: Int): Cart {
        val result = client.executeAsAdmin(
            UpdateCartLineMutation(
                UpdateCartLineMutation.Variables(
                    cartId = "gid://shopify/Cart/$cartId",
                    lineId = "gid://shopify/CartLine/$cartLineId",
                    quantity = quantity,
                ),
            ),
        ).data!!.cartLinesUpdate!!.cart!!
        return mapper.fromGraphQLResult(result)
    }
}