import java.util.*

val localProperties = Properties()
localProperties.load(project.file("local.properties").inputStream())

plugins {
    id("com.expediagroup.graphql") version "7.0.2"
    kotlin("jvm") version "1.9.22"
}

repositories {
    mavenCentral()
}

dependencies {
    implementation("com.expediagroup:graphql-kotlin-spring-client:7.0.2")
}

graphql {
    client {
        packageName = "me.lucasbatista.vienna.shopify.storefront.graphql"
        endpoint = "https://95bda6-3.myshopify.com/api/2024-01/graphql.json"
        headers = mapOf(
            "X-Shopify-Storefront-Access-Token" to localProperties.getProperty("shopify.graphql.accessToken.storefront")
        )
    }
}