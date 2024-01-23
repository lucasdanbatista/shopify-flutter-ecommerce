package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.entity.AuthenticationToken
import me.lucasbatista.vienna.sdk.repository.AuthenticationTokenRepository
import me.lucasbatista.vienna.shopify.graphql.CreateCustomerAccessTokenMutation
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import me.lucasbatista.vienna.shopify.graphql.inputs.CustomerAccessTokenCreateInput
import org.springframework.stereotype.Repository

@Repository
class ShopifyAuthenticationRepository(private val client: ShopifyGraphQLClient) :
    AuthenticationTokenRepository {
    override fun issue(email: String, password: String): AuthenticationToken {
        val result = client.executeAsAdmin(
            CreateCustomerAccessTokenMutation(
                CreateCustomerAccessTokenMutation.Variables(
                    CustomerAccessTokenCreateInput(
                        email = email,
                        password = password,
                    ),
                ),
            ),
        )
        return AuthenticationToken(
            accessToken = result.data!!.customerAccessTokenCreate.customerAccessToken.accessToken,
        )
    }
}