package me.lucasbatista.vienna.shopify.graphql

import com.expediagroup.graphql.client.spring.GraphQLWebClient
import com.expediagroup.graphql.client.types.GraphQLClientRequest
import kotlinx.coroutines.runBlocking
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Component

@Component
class ShopifyGraphQLClient(
    @Value("\${shopify.graphql.baseUrl}")
    baseUrl: String,

    @Value("\${shopify.graphql.adminToken}")
    private val adminToken: String,
) {
    private val baseClient = GraphQLWebClient(baseUrl)

    fun <T : Any> executeAsAdmin(request: GraphQLClientRequest<T>) = runBlocking {
        baseClient.execute(request) {
            header("X-Shopify-Storefront-Access-Token", adminToken)
        }
    }
}