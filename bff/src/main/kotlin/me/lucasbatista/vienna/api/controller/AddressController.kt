package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.AddressDTO
import me.lucasbatista.vienna.api.util.AuthorizationHeaderUtil
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
        return AddressDTO(
            id = result.id,
            recipientFirstName = result.recipientFirstName,
            recipientLastName = result.recipientLastName,
            line1 = result.line1,
            line2 = result.line2,
            city = result.city,
            province = result.province,
            zipcode = result.zipcode,
            country = result.country,
        )
    }
}