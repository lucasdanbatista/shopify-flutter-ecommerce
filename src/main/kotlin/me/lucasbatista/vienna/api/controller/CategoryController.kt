package me.lucasbatista.vienna.api.controller

import me.lucasbatista.vienna.api.dto.CategoryDTO
import me.lucasbatista.vienna.sdk.repository.CategoryRepository
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/v1/categories")
class CategoryController(private val repository: CategoryRepository) {
    @GetMapping
    fun getCategories(): List<CategoryDTO> {
        val result = repository.getCategories()
        return result.map { CategoryDTO(it.title) }
    }
}