package me.lucasbatista.vienna.stripe.dto

data class EventDTO<T>(val data: Data<T>) {
    data class Data<T>(val `object`: T) {
        data class Charge(val id: String)
    }
}