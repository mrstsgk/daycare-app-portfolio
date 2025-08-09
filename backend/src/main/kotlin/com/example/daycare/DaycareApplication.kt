package com.example.daycare

import com.example.daycare.usecase.auth.LoginUsecase
import com.example.daycare.usecase.user.UserQueryService
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.ComponentScan
import org.springframework.web.servlet.config.annotation.CorsRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer

@SpringBootApplication
@ComponentScan(
    basePackages = [
        "com.example.daycare",
        "com.example.daycare.presentation",
        "com.example.daycare.usecase",
        "com.example.daycare.infrastructure"
    ]
)
class DaycareApplication {
    @Bean
    fun corsConfigurer(): WebMvcConfigurer {
        return object : WebMvcConfigurer {
            override fun addCorsMappings(registry: CorsRegistry) {
                registry.addMapping("/**")
                    .allowedOrigins("http://localhost:3000", "http://localhost:3001", "http://localhost:3002")
                    .allowedMethods("GET", "POST", "PUT", "DELETE")
            }
        }
    }

    @Bean
    fun loginUsecase(userQueryService: UserQueryService): LoginUsecase {
        return LoginUsecase(userQueryService)
    }
}

fun main(args: Array<String>) {
    @Suppress("SpreadOperator") // Note: 実害ないのでここでは無視
    runApplication<DaycareApplication>(*args)
}
