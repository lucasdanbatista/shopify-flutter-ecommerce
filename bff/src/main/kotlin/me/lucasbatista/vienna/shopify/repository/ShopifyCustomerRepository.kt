package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.repository.CustomerRepository
import me.lucasbatista.vienna.shopify.graphql.ShopifyStorefrontApi
import me.lucasbatista.vienna.shopify.storefront.graphql.CreateCustomerMutation
import me.lucasbatista.vienna.shopify.storefront.graphql.inputs.CustomerCreateInput
import org.springframework.stereotype.Repository

@Repository
class ShopifyCustomerRepository(private val storefront: ShopifyStorefrontApi) :
    CustomerRepository {
    override fun create(name: String, email: String, password: String) {
        storefront.execute(
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
}