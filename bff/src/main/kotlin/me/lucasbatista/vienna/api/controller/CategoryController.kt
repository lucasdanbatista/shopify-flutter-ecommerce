package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.util.toResponseEntity
import me.lucasbatista.vienna.sdk.dto.CategoryDTO
import me.lucasbatista.vienna.sdk.dto.ProductDTO
import me.lucasbatista.vienna.sdk.repository.CategoryRepository
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import org.springframework.http.ResponseEntity
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
    fun getCategories(): ResponseEntity<List<CategoryDTO>> {
        return categoryRepository.findAll().map {
            CategoryDTO(
                id = it.id,
                title = it.title,
                image = it.image,
            )
        }.toResponseEntity()
    }

    @GetMapping("/{id}/products")
    fun getProductsByCategoryId(@PathVariable id: String): ResponseEntity<List<ProductDTO>> {
        return productRepository
            .findAllByCategoryId(id).map {
                ProductDTO(
                    id = it.id,
                    title = it.title,
                    images = it.images,
                    variants = it.variants,
                )
            }.toResponseEntity()
    }
}