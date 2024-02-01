package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.entity.Order
import me.lucasbatista.vienna.sdk.entity.OrderItem
import me.lucasbatista.vienna.sdk.entity.OrderStatus
import me.lucasbatista.vienna.sdk.entity.ProductVariant
import me.lucasbatista.vienna.sdk.repository.OrderRepository
import me.lucasbatista.vienna.shopify.graphql.GetOrdersQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import me.lucasbatista.vienna.shopify.graphql.enums.OrderFinancialStatus
import me.lucasbatista.vienna.shopify.graphql.enums.OrderFulfillmentStatus
import org.springframework.stereotype.Repository
import java.net.URL

@Repository
class ShopifyOrderRepository(private val client: ShopifyGraphQLClient) : OrderRepository {
    override fun getOrders(customerAccessToken: String): List<Order> {
        val query = GetOrdersQuery(GetOrdersQuery.Variables(customerAccessToken))
        val result = client.executeAsAdmin(query).data!!.customer!!.orders.nodes
        return result.map { it ->
            Order(
                id = it.id.split("/").last(),
                orderNumber = it.orderNumber,
                items = it.lineItems.nodes.map {
                    OrderItem(
                        title = it.title,
                        productVariant = ProductVariant(
                            image = URL(it.variant!!.image!!.url),
                        ),
                    )
                },
                status = when {
                    it.financialStatus == OrderFinancialStatus.VOIDED -> OrderStatus.PAYMENT_REJECTED
                    it.financialStatus == OrderFinancialStatus.PENDING -> OrderStatus.WAITING_PAYMENT
                    it.financialStatus == OrderFinancialStatus.PAID -> OrderStatus.PAID
                    it.fulfillmentStatus == OrderFulfillmentStatus.IN_PROGRESS -> OrderStatus.ON_THE_WAY
                    it.fulfillmentStatus == OrderFulfillmentStatus.FULFILLED -> OrderStatus.DELIVERED
                    it.fulfillmentStatus == OrderFulfillmentStatus.UNFULFILLED -> OrderStatus.CANCELED
                    else -> OrderStatus.UNKNOWN_STATUS
                },
            )
        }
    }
}