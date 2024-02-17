package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.sdk.dto.HomeBannerDTO
import me.lucasbatista.vienna.sdk.dto.HomeSectionDTO
import me.lucasbatista.vienna.sdk.repository.HomeRepository
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/v1/home")
class HomeController(private val homeRepository: HomeRepository) {
    @GetMapping("/banners")
    fun getBanners(): List<HomeBannerDTO> {
        val result = homeRepository.getBanners()
        return result.map {
            HomeBannerDTO(
                title = it.title,
                image = it.image,
                productIds = it.productIds,
            )
        }
    }

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