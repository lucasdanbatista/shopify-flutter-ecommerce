package me.lucasbatista.vienna.api.util

import org.springframework.http.CacheControl
import org.springframework.http.ResponseEntity
import kotlin.time.Duration.Companion.hours
import kotlin.time.toJavaDuration

fun <T : Any> T.toResponseEntity(): ResponseEntity<T> = ResponseEntity
    .ok()
    .cacheControl(CacheControl.maxAge(1.hours.toJavaDuration()))
    .body(this)