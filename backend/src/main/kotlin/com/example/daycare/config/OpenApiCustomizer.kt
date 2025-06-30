package com.example.daycare.config

import io.swagger.v3.oas.models.OpenAPI
import io.swagger.v3.oas.models.info.Info
import io.swagger.v3.oas.models.servers.Server
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class OpenApiCustomizer {

    @Bean
    fun customOpenAPI(): OpenAPI {
        return OpenAPI()
            .info(
                Info()
                    .title("Daycare Management API")
                    .description("保育園管理システムのAPI仕様書")
                    .version("1.0.0")
            )
            .addServersItem(
                Server()
                    .url("http://localhost:8080")
                    .description("開発環境")
            )
    }
}
