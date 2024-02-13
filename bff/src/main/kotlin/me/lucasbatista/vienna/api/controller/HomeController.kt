package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.HomeSectionDTO
import me.lucasbatista.vienna.sdk.repository.HomeRepository
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/v1/home")
class HomeController(private val homeRepository: HomeRepository) {
    @GetMapping("/sections")
    fun getSections(): List<HomeSectionDTO> {
        val result = homeRepository.getSections()
        return result.map { it ->
            HomeSectionDTO(
                title = it.title,
                products = it.products.map { ProductController.mapProduct(it) },
            )
        }
    }
}