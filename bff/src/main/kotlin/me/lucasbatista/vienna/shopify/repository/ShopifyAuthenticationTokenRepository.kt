package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.entity.AuthenticationToken
import me.lucasbatista.vienna.sdk.repository.AuthenticationTokenRepository
import me.lucasbatista.vienna.shopify.graphql.ShopifyStorefrontApi
import me.lucasbatista.vienna.shopify.storefront.graphql.CreateCustomerAccessTokenMutation
import me.lucasbatista.vienna.shopify.storefront.graphql.inputs.CustomerAccessTokenCreateInput
import org.springframework.stereotype.Repository

@Repository
class ShopifyAuthenticationTokenRepository(private val storefront: ShopifyStorefrontApi) :
    AuthenticationTokenRepository {
    override fun issue(email: String, password: String): AuthenticationToken {
        val result = storefront.execute(
            CreateCustomerAccessTokenMutation(
                CreateCustomerAccessTokenMutation.Variables(
                    CustomerAccessTokenCreateInput(
                        email = email,
                        password = password,
                    ),
                ),
            ),
        ).data!!.customerAccessTokenCreate!!.customerAccessToken!!
        return AuthenticationToken(result.accessToken)
    }
}