package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.util.AuthorizationHeaderUtil
import me.lucasbatista.vienna.sdk.dto.AddressDTO
import me.lucasbatista.vienna.sdk.entity.Address
import me.lucasbatista.vienna.sdk.repository.AddressRepository
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/v1/addresses")
class AddressController(private val addressRepository: AddressRepository) {
    @PostMapping
    fun createAddress(
        @RequestHeader authorization: String,
        @RequestBody address: AddressDTO,
    ): AddressDTO {
        val result = addressRepository.create(
            customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
            address = address,
        )
        return mapAddress(result)
    }

    @PutMapping
    fun updateAddress(
        @RequestHeader authorization: String,
        @RequestBody address: AddressDTO,
    ): AddressDTO {
        val result = addressRepository.update(
            customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
            address = address,
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

    @DeleteMapping("/{id}")
    fun deleteAddress(
        @RequestHeader authorization: String,
        @PathVariable id: String,
    ): Unit = addressRepository.deleteById(
        customerAccessToken = AuthorizationHeaderUtil.extractToken(authorization),
        id = id,
    )

    private fun mapAddress(it: Address): AddressDTO {
        return AddressDTO(
            id = it.id,
            recipientName = it.recipientName,
            street = it.street,
            neighborhood = it.neighborhood,
            buildingNumber = it.buildingNumber,
            complement = it.complement,
            city = it.city,
            state = it.state,
            zipcode = it.zipcode,
            country = it.country,
        )
    }
}