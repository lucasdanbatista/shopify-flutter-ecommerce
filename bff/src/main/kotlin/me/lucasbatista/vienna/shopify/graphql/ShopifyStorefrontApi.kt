package me.lucasbatista.vienna.shopify.graphql

import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Component

@Component
class ShopifyStorefrontApi(
    @Value("\${shopify.storefrontGraphql.baseUrl}")
    baseUrl: String,

    @Value("\${shopify.storefrontGraphql.accessToken}")
    accessToken: String,
) : GraphQLClient(
    baseUrl,
    accessToken,
    authorizationHeader = "X-Shopify-Storefront-Access-Token",
)