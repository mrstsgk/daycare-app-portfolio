package com.example.daycare.presentation.model

import com.fasterxml.jackson.annotation.JsonProperty
import jakarta.validation.constraints.DecimalMax
import jakarta.validation.constraints.DecimalMin
import jakarta.validation.constraints.Email
import jakarta.validation.constraints.Max
import jakarta.validation.constraints.Min
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Pattern
import jakarta.validation.constraints.Size
import jakarta.validation.Valid

/**
 * 
 * @param name エラーが発生したフィールド名
 * @param message エラーメッセージ
 */
data class ApiErrorModel(

    @field:NotNull
    @get:JsonProperty("name") val name: kotlin.String,

    @field:NotNull
    @get:JsonProperty("message") val message: kotlin.String
    ) {

}

