package me.lucasbatista.vienna.mock.repository

import me.lucasbatista.vienna.sdk.entity.Address
import me.lucasbatista.vienna.sdk.repository.AddressRepository
import org.springframework.stereotype.Repository

@Repository
class MockedAddressRepository : AddressRepository {
    override fun findById(id: String) = Address(
        recipientLastName = "Lucas",
        recipientFirstName = "Batista",
        line1 = "Rua São Joaquim, 518",
        line2 = "Bairro São Vicente",
        city = "Itajaí",
        province = "Santa Catarina",
        zipcode = "88309000",
        country = "BR",
    )
}