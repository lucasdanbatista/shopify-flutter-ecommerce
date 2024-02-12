package me.lucasbatista.vienna.api.util

import java.util.*

fun String.toBase64() = String(Base64.getEncoder().encode(toByteArray()))

fun String.fromBase64() = String(Base64.getDecoder().decode(this))
