package me.lucasbatista.vienna.api.configuration

import org.springframework.cache.annotation.EnableCaching
import org.springframework.cache.concurrent.ConcurrentMapCacheManager
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
@EnableCaching
class CacheConfiguration {
    @Bean
    fun getCacheManager() = ConcurrentMapCacheManager(
        "categories",
        "products",
        "orders",
        "cart",
        "home",
    )
}