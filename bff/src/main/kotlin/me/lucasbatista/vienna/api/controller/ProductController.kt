package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.ProductDTO
import me.lucasbatista.vienna.api.dto.ProductOptionDTO
import me.lucasbatista.vienna.api.dto.ProductVariantDTO
import me.lucasbatista.vienna.sdk.entity.Product
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/v1/products")
class ProductController(private val repository: ProductRepository) {
    @GetMapping("/{id}")
    fun getProductById(@PathVariable id: String) = mapProduct(repository.findById(id))

    @GetMapping
    fun getProductsByIds(@RequestParam ids: List<String>) =
        repository.findAllByIds(ids).map(::mapProduct)

    private fun mapProduct(it: Product) = ProductDTO(
        id = it.id,
        title = it.title,
        description = it.description,
        images = it.images,
        variants = it.variants.map {
            ProductVariantDTO(
                id = it.id,
                image = it.image,
                originalPrice = it.originalPrice,
                sellingPrice = it.sellingPrice,
            )
        },
        options = it.options.map {
            ProductOptionDTO(
                id = it.id,
                name = it.name,
                values = it.values,
            )
        }
    )
}