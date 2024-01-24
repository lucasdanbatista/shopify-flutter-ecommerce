package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.AuthenticationTokenDTO
import me.lucasbatista.vienna.api.dto.CustomerDTO
import me.lucasbatista.vienna.api.dto.request.SignUpRequestDTO
import me.lucasbatista.vienna.sdk.repository.AuthenticationTokenRepository
import me.lucasbatista.vienna.sdk.repository.CustomerRepository
import org.springframework.web.bind.annotation.*

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
    fun signUp(@RequestBody body: SignUpRequestDTO): CustomerDTO {
        val result = customerRepository.create(
            firstName = body.firstName,
            lastName = body.lastName,
            email = body.email,
            password = body.password,
        )
        return CustomerDTO(result.id)
    }
}