import org.jetbrains.kotlin.gradle.tasks.KotlinCompile
import java.util.*

val localProperties = Properties()
localProperties.load(project.rootProject.file("local.properties").inputStream())

plugins {
    id("org.springframework.boot") version "3.2.2"
    id("io.spring.dependency-management") version "1.1.4"
    id("com.expediagroup.graphql") version "7.0.2"
    kotlin("jvm") version "1.9.22"
    kotlin("plugin.spring") version "1.9.22"
    kotlin("plugin.jpa") version "1.9.22"
    kotlin("plugin.noarg") version "1.9.22"
}

group = "me.lucasbatista"
version = "0.0.1-SNAPSHOT"

java {
    sourceCompatibility = JavaVersion.VERSION_17
}

configurations {
    compileOnly {
        extendsFrom(configurations.annotationProcessor.get())
    }
}

repositories {
    mavenCentral()
}

dependencies {
    implementation("com.expediagroup:graphql-kotlin-spring-client:7.0.2")
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.springframework.boot:spring-boot-starter-data-jpa")
    implementation("com.fasterxml.jackson.module:jackson-module-kotlin")
    implementation("org.jetbrains.kotlin:kotlin-reflect")
    developmentOnly("org.springframework.boot:spring-boot-devtools")
    runtimeOnly("com.h2database:h2")
    annotationProcessor("org.springframework.boot:spring-boot-configuration-processor")
    testImplementation("org.springframework.boot:spring-boot-starter-test")
}

tasks.withType<KotlinCompile> {
    kotlinOptions {
        freeCompilerArgs += "-Xjsr305=strict"
        jvmTarget = "17"
    }
}

tasks.withType<Test> {
    useJUnitPlatform()
}

graphql {
    client {
        packageName = "me.lucasbatista.vienna.shopify.storefront.graphql"
        endpoint = "https://95bda6-3.myshopify.com/api/2024-01/graphql.json"
        queryFileDirectory = "src/main/resources/shopify/storefront"
        headers = mapOf(
            "X-Shopify-Storefront-Access-Token" to localProperties.getProperty("shopify.graphql.accessToken.storefront")
        )
    }
}

graphql {
    client {
        packageName = "me.lucasbatista.vienna.shopify.admin.graphql"
        endpoint = "https://95bda6-3.myshopify.com/admin/api/2024-01/graphql.json"
        queryFileDirectory = "src/main/resources/shopify/admin"
        headers = mapOf(
            "X-Shopify-Access-Token" to localProperties.getProperty("shopify.graphql.accessToken.admin")
        )
    }
}

noArg {
    annotation("jakarta.persistence.Entity")
}