package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.CustomerDTO
import me.lucasbatista.vienna.api.dto.request.SignUpRequestDTO
import me.lucasbatista.vienna.sdk.repository.CustomerRepository
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/v1/customers")
class CustomerController(private val repository: CustomerRepository) {
    @PostMapping("/sign-up")
    fun signUp(@RequestBody body: SignUpRequestDTO): CustomerDTO {
        val result = repository.create(
            firstName = body.firstName,
            lastName = body.lastName,
            email = body.email,
            password = body.password,
        )
        return CustomerDTO.Builder()
            .withId(result.id)
            .build()
    }
}