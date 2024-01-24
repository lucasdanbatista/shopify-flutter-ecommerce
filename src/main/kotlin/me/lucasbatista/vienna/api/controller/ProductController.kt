package me.lucasbatista.vienna.api.controller

import ProductVariantDTO
import me.lucasbatista.vienna.api.dto.ProductDTO
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/v1/products")
class ProductController(private val repository: ProductRepository) {
    @GetMapping("/{id}")
    fun getProductById(@PathVariable id: String): ProductDTO {
        val result = repository.findById(id)
        return ProductDTO(
            id = result.id,
            title = result.title,
            description = result.description,
            images = result.images,
            variants = result.variants.map {
                ProductVariantDTO(
                    id = it.id,
                    originalPrice = it.originalPrice,
                    sellingPrice = it.sellingPrice,
                )
            },
        )
    }
}