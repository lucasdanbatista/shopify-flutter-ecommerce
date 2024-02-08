package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.AuthenticationTokenDTO
import me.lucasbatista.vienna.sdk.repository.AuthenticationTokenRepository
import me.lucasbatista.vienna.sdk.repository.CustomerRepository
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestPart
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/v1/customers")
class CustomerController(
    private val authenticationTokenRepository: AuthenticationTokenRepository,
    private val customerRepository: CustomerRepository,
) {
    @PostMapping("/sign-in")
    fun signIn(
        @RequestPart email: String,
        @RequestPart password: String,
    ): AuthenticationTokenDTO {
        val result = authenticationTokenRepository.issue(
            email = email,
            password = password,
        )
        return AuthenticationTokenDTO(result.accessToken)
    }

    @PostMapping("/sign-up")
    fun signUp(
        @RequestPart name: String,
        @RequestPart email: String,
        @RequestPart password: String,
    ) {
        customerRepository.create(name, email, password)
    }
}