package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.dto.HomeBannerDTO
import me.lucasbatista.vienna.sdk.dto.HomeSectionDTO

interface HomeRepository {
    fun getBanners(): List<HomeBannerDTO>

    fun getSections(): List<HomeSectionDTO>
}