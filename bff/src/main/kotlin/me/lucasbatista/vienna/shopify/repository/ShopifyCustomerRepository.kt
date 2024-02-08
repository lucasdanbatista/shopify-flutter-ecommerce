package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.entity.Customer
import me.lucasbatista.vienna.sdk.repository.CustomerRepository
import me.lucasbatista.vienna.shopify.graphql.CreateCustomerMutation
import me.lucasbatista.vienna.shopify.graphql.GetCustomerByAccessTokenQuery
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import me.lucasbatista.vienna.shopify.graphql.inputs.CustomerCreateInput
import org.springframework.stereotype.Repository

@Repository
class ShopifyCustomerRepository(private val client: ShopifyGraphQLClient) : CustomerRepository {
    override fun create(name: String, email: String, password: String) {
        client.executeAsAdmin(
            CreateCustomerMutation(
                CreateCustomerMutation.Variables(
                    CustomerCreateInput(
                        firstName = name.trim().split(" ").first(),
                        lastName = name.trim().split(" ").last(),
                        email = email,
                        password = password,
                    ),
                ),
            ),
        )
    }

    override fun findByAccessToken(accessToken: String): Customer {
        val result = client.executeAsAdmin(
            GetCustomerByAccessTokenQuery(
                GetCustomerByAccessTokenQuery.Variables(accessToken),
            )
        ).data!!.customer!!
        return Customer(
            id = result.id,
            email = result.email,
        )
    }
}