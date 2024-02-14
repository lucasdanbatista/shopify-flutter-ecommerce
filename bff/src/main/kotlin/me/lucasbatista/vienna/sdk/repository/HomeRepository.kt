package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.HomeBanner
import me.lucasbatista.vienna.sdk.entity.HomeSection

interface HomeRepository {
    fun getBanners(): List<HomeBanner>

    fun getSections(): List<HomeSection>
}