package me.lucasbatista.vienna.api

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.autoconfigure.domain.EntityScan
import org.springframework.boot.runApplication
import org.springframework.context.annotation.ComponentScan
import org.springframework.data.jpa.repository.config.EnableJpaRepositories

@SpringBootApplication
@ComponentScan(basePackages = ["me.lucasbatista"])
@EntityScan(basePackages = ["me.lucasbatista"])
@EnableJpaRepositories(basePackages = ["me.lucasbatista"])
class Application

fun main(args: Array<String>) {
    runApplication<Application>(*args)
}
