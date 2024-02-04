package me.lucasbatista.vienna.mock.repository

import me.lucasbatista.vienna.sdk.entity.Address
import org.springframework.stereotype.Repository

@Repository
class MockedAddressRepository {
    fun findById(id: String) = Address(
        recipientFirstName = "Lucas",
        recipientLastName = "Batista",
        line1 = "Rua São Joaquim, 518",
        line2 = "Bairro São Vicente",
        city = "Itajaí",
        province = "Santa Catarina",
        zipcode = "88309000",
        country = "BR",
    )
}