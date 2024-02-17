package me.lucasbatista.vienna.shopify.graphql

import com.expediagroup.graphql.client.spring.GraphQLWebClient
import com.expediagroup.graphql.client.types.GraphQLClientRequest
import kotlinx.coroutines.runBlocking

abstract class GraphQLClient(
    baseUrl: String,
    private val accessToken: String,
    private val authorizationHeader: String,
) {
    private val baseClient = GraphQLWebClient(baseUrl)

    fun <T : Any> execute(request: GraphQLClientRequest<T>) = runBlocking {
        baseClient.execute(request) {
            header(authorizationHeader, accessToken)
        }
    }
}