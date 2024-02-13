package me.lucasbatista.vienna.sdk.repository

import me.lucasbatista.vienna.sdk.entity.HomeSection

interface HomeRepository {
    fun getSections(): List<HomeSection>
}