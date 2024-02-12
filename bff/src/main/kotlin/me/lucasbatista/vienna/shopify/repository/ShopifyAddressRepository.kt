package me.lucasbatista.vienna.shopify.repository

import com.fasterxml.jackson.databind.ObjectMapper
import me.lucasbatista.vienna.api.util.fromBase64
import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.entity.Address
import me.lucasbatista.vienna.sdk.repository.AddressRepository
import me.lucasbatista.vienna.shopify.graphql.*
import me.lucasbatista.vienna.shopify.graphql.inputs.MailingAddressInput
import org.springframework.stereotype.Repository
import java.net.URI
import me.lucasbatista.vienna.shopify.graphql.createaddressmutation.MailingAddress as ShopifyAddress

@Repository
class ShopifyAddressRepository(
    private val client: ShopifyGraphQLClient,
    private val objectMapper: ObjectMapper,
) : AddressRepository {
    override fun findById(customerAccessToken: String, id: String): Address {
        fun extractId(rawId: String) = URI(rawId.fromBase64()).path
        return findAll(customerAccessToken).first { extractId(it.id) == extractId(id) }
    }

    override fun findAll(customerAccessToken: String): List<Address> {
        val query = GetAddressesQuery(GetAddressesQuery.Variables(customerAccessToken))
        val result = client.executeAsAdmin(query).data!!.customer!!.addresses.nodes
        return result.map(::mapAddress)
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
        return mapAddress(result)
    }

    override fun update(
        customerAccessToken: String,
        id: String,
        recipientFirstName: String,
        recipientLastName: String,
        line1: String,
        line2: String,
        city: String,
        province: String,
        zipcode: String,
    ): Address {
        val result = client.executeAsAdmin(
            UpdateAddressMutation(
                UpdateAddressMutation.Variables(
                    customerAccessToken = customerAccessToken,
                    id = id.fromBase64(),
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
        ).data!!.customerAddressUpdate!!.customerAddress!!
        return mapAddress(result)
    }

    override fun deleteById(customerAccessToken: String, id: String) {
        client.executeAsAdmin(
            DeleteAddressMutation(
                DeleteAddressMutation.Variables(
                    customerAccessToken,
                    id.fromBase64(),
                ),
            ),
        )
    }

    private fun mapAddress(data: Any): Address {
        val result = objectMapper.convertValue(data, ShopifyAddress::class.java)
        return Address(
            recipientFirstName = result.firstName!!,
            recipientLastName = result.lastName!!,
            line1 = result.address1!!,
            line2 = result.address2!!,
            city = result.city!!,
            province = result.province!!,
            zipcode = result.zip!!,
            country = result.country!!,
        ).apply {
            id = result.id.toBase64()
        }
    }
}