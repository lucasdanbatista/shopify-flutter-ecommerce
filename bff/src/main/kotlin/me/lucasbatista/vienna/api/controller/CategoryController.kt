package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.CategoryDTO
import me.lucasbatista.vienna.api.dto.ProductDTO
import me.lucasbatista.vienna.api.dto.ProductVariantDTO
import me.lucasbatista.vienna.sdk.repository.CategoryRepository
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/v1/categories")
class CategoryController(
    private val categoryRepository: CategoryRepository,
    private val productRepository: ProductRepository,
) {
    @GetMapping
    fun getCategories() = categoryRepository.findAll().map {
        CategoryDTO(
            id = it.id,
            title = it.title,
        )
    }

    @GetMapping("/{id}/products")
    fun getProductsByCategoryId(@PathVariable id: String) = productRepository
        .findAllByCategoryId(id).map { it ->
            ProductDTO(
                id = it.id,
                title = it.title,
                images = it.images,
                variants = it.variants.map {
                    ProductVariantDTO(
                        originalPrice = it.originalPrice,
                        sellingPrice = it.sellingPrice,
                    )
                },
            )
        }
}