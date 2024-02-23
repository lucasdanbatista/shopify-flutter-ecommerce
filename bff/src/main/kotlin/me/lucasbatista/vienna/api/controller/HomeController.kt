package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.util.toResponseEntity
import me.lucasbatista.vienna.sdk.dto.HomeBannerDTO
import me.lucasbatista.vienna.sdk.dto.HomeSectionDTO
import me.lucasbatista.vienna.sdk.repository.HomeRepository
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/v1/home")
class HomeController(private val homeRepository: HomeRepository) {
    @GetMapping("/banners")
    fun getBanners(): ResponseEntity<List<HomeBannerDTO>> {
        return homeRepository.getBanners().toResponseEntity()
    }

    @GetMapping("/sections")
    fun getSections(): ResponseEntity<List<HomeSectionDTO>> {
        return homeRepository.getSections().toResponseEntity()
    }
}