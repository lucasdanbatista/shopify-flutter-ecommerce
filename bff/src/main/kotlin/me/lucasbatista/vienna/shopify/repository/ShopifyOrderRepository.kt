package me.lucasbatista.vienna.shopify.repository

import com.fasterxml.jackson.databind.ObjectMapper
import me.lucasbatista.vienna.api.util.fromBase64
import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.entity.*
import me.lucasbatista.vienna.sdk.repository.OrderRepository
import me.lucasbatista.vienna.shopify.graphql.ShopifyStorefrontApi
import me.lucasbatista.vienna.shopify.storefront.graphql.GetOrderDetailsQuery
import me.lucasbatista.vienna.shopify.storefront.graphql.GetOrdersQuery
import me.lucasbatista.vienna.shopify.storefront.graphql.enums.OrderFinancialStatus
import me.lucasbatista.vienna.shopify.storefront.graphql.enums.OrderFulfillmentStatus
import org.springframework.stereotype.Repository
import java.net.URI
import java.net.URL
import me.lucasbatista.vienna.shopify.storefront.graphql.getordersquery.Order as ShopifyOrder

@Repository
class ShopifyOrderRepository(
    private val storefront: ShopifyStorefrontApi,
    private val objectMapper: ObjectMapper,
) : OrderRepository {
    override fun getOrders(customerAccessToken: String): List<Order> {
        val query = GetOrdersQuery(GetOrdersQuery.Variables(customerAccessToken))
        val result = storefront.execute(query).data!!.customer!!.orders.nodes
        return result.map(::mapOrder)
    }

    override fun getOrderBydId(customerAccessToken: String, id: String): Order {
        val query = GetOrderDetailsQuery(
            GetOrderDetailsQuery.Variables(
                customerAccessToken = customerAccessToken,
                query = "id:${URI(id.fromBase64()).path.split("/").last()}",
            ),
        )
        val result = storefront.execute(query).data!!.customer!!.orders.nodes.first()
        return mapOrder(result).apply {
            shippingAddress = result.shippingAddress!!.let {
                Address(
                    city = it.city!!,
                    zipcode = it.zip!!,
                    street = it.address1!!.trim().split(",")[0],
                    buildingNumber = it.address1!!.trim().split(",")[1],
                    neighborhood = it.address2?.trim() ?: "",
                    recipientName = "${it.firstName!!} ${it.lastName!!}",
                    state = it.province!!,
                    country = it.country!!,
                ).apply {
                    this.id = it.id.toBase64()
                }
            }
        }
    }

    private fun mapOrder(result: Any): Order {
        val data = objectMapper.convertValue(result, ShopifyOrder::class.java)
        return Order(
            id = data.id.toBase64(),
            orderNumber = data.orderNumber,
            items = data.lineItems.nodes.map {
                OrderItem(
                    title = it.title,
                    productVariant = ProductVariant(
                        image = URL(it.variant!!.image!!.url),
                    ),
                    quantity = it.quantity,
                    total = it.originalTotalPrice.amount.toDouble(),
                )
            },
            status = when {
                data.fulfillmentStatus == OrderFulfillmentStatus.UNFULFILLED -> OrderStatus.PROCESSING
                data.financialStatus == OrderFinancialStatus.PAID -> OrderStatus.PAID
                else -> OrderStatus.UNKNOWN_STATUS
            },
            total = data.totalPrice.amount.toDouble(),
        )
    }
}