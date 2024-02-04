package me.lucasbatista.vienna.shopify.repository

import me.lucasbatista.vienna.sdk.entity.Address
import me.lucasbatista.vienna.sdk.repository.AddressRepository
import me.lucasbatista.vienna.shopify.graphql.CreateAddressMutation
import me.lucasbatista.vienna.shopify.graphql.ShopifyGraphQLClient
import me.lucasbatista.vienna.shopify.graphql.inputs.MailingAddressInput
import org.springframework.stereotype.Repository

@Repository
class ShopifyAddressRepository(private val client: ShopifyGraphQLClient) : AddressRepository {
    override fun findById(id: String): Address {
        TODO("Not yet implemented")
    }

    override fun create(
        customerAccessToken: String,
        recipientFirstName: String,
        recipientLastName: String,
        line1: String,
        line2: String,
        city: String,
        province: String,
        zipcode: String,
    ): Address {
        val result = client.executeAsAdmin(
            CreateAddressMutation(
                CreateAddressMutation.Variables(
                    customerAccessToken = customerAccessToken,
                    address = MailingAddressInput(
                        firstName = recipientFirstName,
                        lastName = recipientLastName,
                        address1 = line1,
                        address2 = line2,
                        city = city,
                        province = province,
                        zip = zipcode,
                        country = "BR",
                    ),
                ),
            ),
        ).data!!.customerAddressCreate!!.customerAddress!!
        return Address(
            id = result.id,
            recipientFirstName = result.firstName!!,
            recipientLastName = result.lastName!!,
            line1 = result.address1!!,
            line2 = result.address2!!,
            city = result.city!!,
            province = result.province!!,
            zipcode = result.zip!!,
            country = result.country!!,
        )
    }
}