package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.dto.*
import me.lucasbatista.vienna.sdk.repository.OrderRepository
import me.lucasbatista.vienna.shopify.graphql.ShopifyStorefrontApi
import me.lucasbatista.vienna.shopify.storefront.graphql.GetOrdersQuery
import me.lucasbatista.vienna.shopify.storefront.graphql.enums.OrderFinancialStatus
import me.lucasbatista.vienna.shopify.storefront.graphql.enums.OrderFulfillmentStatus
import org.springframework.cache.annotation.CacheConfig
import org.springframework.cache.annotation.Cacheable
import org.springframework.stereotype.Repository
import java.net.URL

@Repository
@CacheConfig(cacheNames = ["orders"])
class ShopifyOrderRepository(private val storefront: ShopifyStorefrontApi) : OrderRepository {
    @Cacheable
    override fun getOrders(customerAccessToken: String): List<OrderDTO> {
        val query = GetOrdersQuery(GetOrdersQuery.Variables(customerAccessToken))
        val result = storefront.execute(query).data!!.customer!!.orders.nodes
        return result.map {
            OrderDTO(
                id = it.id.toBase64(),
                orderNumber = it.orderNumber,
                items = it.lineItems.nodes.map { item ->
                    OrderItemDTO(
                        title = item.title,
                        productVariant = ProductVariantDTO(
                            image = URL(item.variant!!.image!!.url),
                        ),
                        quantity = item.quantity,
                        total = item.originalTotalPrice.amount.toDouble(),
                    )
                },
                status = when {
                    it.fulfillmentStatus == OrderFulfillmentStatus.UNFULFILLED -> OrderStatus.PROCESSING
                    it.financialStatus == OrderFinancialStatus.PAID -> OrderStatus.PAID
                    else -> OrderStatus.UNKNOWN_STATUS
                },
                total = it.totalPrice.amount.toDouble(),
                shippingAddress = if (it.shippingAddress != null) AddressDTO(
                    recipientFirstName = it.shippingAddress!!.firstName ?: "",
                    recipientLastName = it.shippingAddress!!.lastName ?: "",
                    addressLine1 = it.shippingAddress!!.address1!!.trim(),
                    addressLine2 = it.shippingAddress!!.address2?.trim(),
                    zipcode = it.shippingAddress!!.zip!!,
                    city = it.shippingAddress!!.city!!,
                    state = it.shippingAddress!!.province!!,
                    country = it.shippingAddress!!.country!!,
                ) else null,
            )
        }
    }
}