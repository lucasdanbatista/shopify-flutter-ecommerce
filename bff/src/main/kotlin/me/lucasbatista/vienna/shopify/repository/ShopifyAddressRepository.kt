package me.lucasbatista.vienna.shopify.repository

import com.fasterxml.jackson.databind.ObjectMapper
import me.lucasbatista.vienna.api.util.fromBase64
import me.lucasbatista.vienna.api.util.toBase64
import me.lucasbatista.vienna.sdk.dto.AddressDTO
import me.lucasbatista.vienna.sdk.entity.Address
import me.lucasbatista.vienna.sdk.repository.AddressRepository
import me.lucasbatista.vienna.shopify.graphql.ShopifyStorefrontApi
import me.lucasbatista.vienna.shopify.storefront.graphql.CreateAddressMutation
import me.lucasbatista.vienna.shopify.storefront.graphql.DeleteAddressMutation
import me.lucasbatista.vienna.shopify.storefront.graphql.GetAddressesQuery
import me.lucasbatista.vienna.shopify.storefront.graphql.UpdateAddressMutation
import me.lucasbatista.vienna.shopify.storefront.graphql.inputs.MailingAddressInput
import org.springframework.stereotype.Repository
import java.net.URI
import me.lucasbatista.vienna.shopify.storefront.graphql.createaddressmutation.MailingAddress as ShopifyAddress

@Repository
class ShopifyAddressRepository(
    private val storefront: ShopifyStorefrontApi,
    private val objectMapper: ObjectMapper,
) : AddressRepository {
    override fun findById(customerAccessToken: String, id: String): Address {
        fun extractId(rawId: String) = URI(rawId.fromBase64()).path
        return findAll(customerAccessToken).first { extractId(it.id) == extractId(id) }
    }

    override fun findAll(customerAccessToken: String): List<Address> {
        val query = GetAddressesQuery(GetAddressesQuery.Variables(customerAccessToken))
        val result = storefront.execute(query).data!!.customer!!.addresses.nodes
        return result.map(::mapAddress)
    }

    override fun create(customerAccessToken: String, address: AddressDTO): Address {
        val result = storefront.execute(
            CreateAddressMutation(
                CreateAddressMutation.Variables(
                    customerAccessToken = customerAccessToken,
                    address = mapAddressInput(address),
                ),
            ),
        ).data!!.customerAddressCreate!!.customerAddress!!
        return mapAddress(result)
    }

    override fun update(customerAccessToken: String, address: AddressDTO): Address {
        val result = storefront.execute(
            UpdateAddressMutation(
                UpdateAddressMutation.Variables(
                    customerAccessToken = customerAccessToken,
                    id = address.id!!.fromBase64(),
                    address = mapAddressInput(address),
                ),
            ),
        ).data!!.customerAddressUpdate!!.customerAddress!!
        return mapAddress(result)
    }

    private fun mapAddressInput(address: AddressDTO): MailingAddressInput {
        return MailingAddressInput(
            firstName = address.recipientName!!.trim().split(" ").first(),
            lastName = address.recipientName!!.trim().split(" ").last(),
            address1 = "${address.street}, ${address.buildingNumber}",
            address2 = address.neighborhood,
            city = address.city,
            province = address.state,
            zip = address.zipcode,
            country = "BR",
        )
    }

    override fun deleteById(customerAccessToken: String, id: String) {
        storefront.execute(
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
            recipientName = "${result.firstName!!} ${result.lastName!!}",
            street = result.address1!!.trim().split(",")[0].trim(),
            buildingNumber = result.address1!!.trim().split(",")[1].trim(),
            neighborhood = result.address2!!.trim(),
            city = result.city!!,
            state = result.province!!,
            zipcode = result.zip!!,
            country = result.country!!,
        ).apply {
            id = result.id.toBase64()
        }
    }
}