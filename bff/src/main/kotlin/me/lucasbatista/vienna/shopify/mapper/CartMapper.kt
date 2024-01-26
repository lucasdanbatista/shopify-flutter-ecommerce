package me.lucasbatista.vienna.shopify.mapper

import com.fasterxml.jackson.databind.ObjectMapper
import me.lucasbatista.vienna.sdk.entity.Cart
import me.lucasbatista.vienna.sdk.entity.CartLine
import me.lucasbatista.vienna.sdk.entity.ProductVariant
import org.springframework.stereotype.Component
import java.net.URL
import me.lucasbatista.vienna.shopify.graphql.addcartlinemutation.Cart as Result

@Component
class CartMapper(private val objectMapper: ObjectMapper) {
    fun fromGraphQLResult(data: Any): Cart {
        val result = objectMapper.readValue(
            objectMapper.writeValueAsBytes(data),
            Result::class.java,
        )
        return Cart(
            id = result.id.split("/").last(),
            lines = result.lines.nodes.map {
                it.merchandise as me.lucasbatista.vienna.shopify.graphql.addcartlinemutation.ProductVariant
                CartLine(
                    id = it.id.split("/").last(),
                    quantity = it.quantity,
                    total = it.cost.totalAmount.amount.toDouble(),
                    productVariant = ProductVariant(
                        id = it.merchandise.id.split("/").last(),
                        originalPrice = it.merchandise.compareAtPrice.amount.toDouble(),
                        sellingPrice = it.merchandise.price.amount.toDouble(),
                        title = it.merchandise.product.title,
                        image = URL(it.merchandise.image.url),
                    ),
                )
            },
            subtotal = result.cost.subtotalAmount.amount.toDouble(),
            total = result.cost.totalAmount.amount.toDouble(),
        )
    }
}