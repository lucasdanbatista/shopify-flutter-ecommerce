package me.lucasbatista.vienna.shopify.graphql

import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Component

@Component
class ShopifyAdminApi(
    @Value("\${shopify.adminGraphql.baseUrl}")
    baseUrl: String,

    @Value("\${shopify.adminGraphql.accessToken}")
    accessToken: String,
) : GraphQLClient(
    baseUrl,
    accessToken,
    authorizationHeader = "X-Shopify-Access-Token",
)