package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.util.fromBase64
import me.lucasbatista.vienna.sdk.dto.ProductDTO
import me.lucasbatista.vienna.sdk.repository.ProductRepository
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/v1/products")
class ProductController(private val repository: ProductRepository) {
    @GetMapping("/{id}")
    fun getProductById(@PathVariable id: String): ProductDTO {
        return repository.findById(id)
    }

    @GetMapping
    fun getProductsByIds(@RequestParam ids: List<String>): List<ProductDTO> {
        return repository.findAllByIds(ids)
    }

    @GetMapping("/search")
    fun getProductsByTerm(@RequestParam term: String): List<ProductDTO> {
        return repository.findProductsByTerm(term.fromBase64())
    }
}