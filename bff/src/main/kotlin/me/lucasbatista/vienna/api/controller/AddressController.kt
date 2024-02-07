package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.AddressDTO
import me.lucasbatista.vienna.api.util.AuthorizationHeaderUtil
import me.lucasbatista.vienna.sdk.entity.Address
import me.lucasbatista.vienna.sdk.repository.AddressRepository
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/v1/addresses")
class AddressController(private val addressRepository: AddressRepository) {
    @PostMapping
    fun createAddress(
        @RequestHeader authorization: String,
        @RequestBody body: AddressDTO,
    ): AddressDTO {
        val result = addressRepository.create(
            customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
            recipientFirstName = body.recipientFirstName!!,
            recipientLastName = body.recipientLastName!!,
            line1 = body.line1!!,
            line2 = body.line2!!,
            city = body.city!!,
            province = body.province!!,
            zipcode = body.zipcode!!,
        )
        return mapAddress(result)
    }

    @PutMapping
    fun updateAddress(
        @RequestHeader authorization: String,
        @RequestBody body: AddressDTO,
    ): AddressDTO {
        val result = addressRepository.update(
            customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
            id = body.id!!,
            recipientFirstName = body.recipientFirstName!!,
            recipientLastName = body.recipientLastName!!,
            line1 = body.line1!!,
            line2 = body.line2!!,
            city = body.city!!,
            province = body.province!!,
            zipcode = body.zipcode!!,
        )
        return mapAddress(result)
    }

    @GetMapping
    fun findAll(@RequestHeader authorization: String): List<AddressDTO> {
        val result = addressRepository.findAll(
            customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
        )
        return result.map(::mapAddress)
    }

    @GetMapping("/{id}")
    fun findById(
        @RequestHeader authorization: String,
        @PathVariable id: String,
    ): AddressDTO {
        val result = addressRepository.findById(
            customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
            id = id,
        )
        return mapAddress(result)
    }

    @DeleteMapping
    fun deleteAddress(
        @RequestHeader authorization: String,
        @RequestBody address: AddressDTO,
    ): Unit = addressRepository.deleteById(
        customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
        id = address.id!!,
    )

    private fun mapAddress(it: Address): AddressDTO {
        return AddressDTO(
            id = it.id,
            recipientFirstName = it.recipientFirstName,
            recipientLastName = it.recipientLastName,
            line1 = it.line1,
            line2 = it.line2,
            city = it.city,
            province = it.province,
            zipcode = it.zipcode,
            country = it.country,
        )
    }
}