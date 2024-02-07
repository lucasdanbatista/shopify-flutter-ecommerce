package me.lucasbatista.vienna.shopify.repository

import com.fasterxml.jackson.databind.ObjectMapper
import me.lucasbatista.vienna.sdk.entity.*
import me.lucasbatista.vienna.sdk.repository.OrderRepository
import me.lucasbatista.vienna.shopify.graphql.GetOrderDetailsQuery
import me.lucasbatista.vienna.shopify.graphql.GetOrdersQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import me.lucasbatista.vienna.shopify.graphql.enums.OrderFinancialStatus
import me.lucasbatista.vienna.shopify.graphql.enums.OrderFulfillmentStatus
import org.springframework.stereotype.Repository
import java.net.URL
import me.lucasbatista.vienna.shopify.graphql.getordersquery.Order as ShopifyOrder

@Repository
class ShopifyOrderRepository(
    private val client: ShopifyGraphQLClient,
    private val objectMapper: ObjectMapper,
) : OrderRepository {
    override fun getOrders(customerAccessToken: String): List<Order> {
        val query = GetOrdersQuery(GetOrdersQuery.Variables(customerAccessToken))
        val result = client.executeAsAdmin(query).data!!.customer!!.orders.nodes
        return result.map(::mapOrder)
    }

    override fun getOrderBydId(customerAccessToken: String, id: String): Order {
        val query = GetOrderDetailsQuery(
            GetOrderDetailsQuery.Variables(
                customerAccessToken = customerAccessToken,
                query = "id:$id",
            ),
        )
        val result = client.executeAsAdmin(query).data!!.customer!!.orders.nodes.first()
        return mapOrder(result).apply {
            shippingAddress = result.shippingAddress!!.let {
                Address(
                    city = it.city!!,
                    zipcode = it.zip!!,
                    line1 = it.address1!!,
                    line2 = it.address2!!,
                    recipientFirstName = it.firstName!!,
                    recipientLastName = it.lastName!!,
                    province = it.province!!,
                    country = it.country!!,
                ).apply {
                    this.id = it.id
                }
            }
        }
    }

    private fun mapOrder(result: Any): Order {
        val data = objectMapper.convertValue(result, ShopifyOrder::class.java)
        return Order(
            id = data.id.split("/").last(),
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