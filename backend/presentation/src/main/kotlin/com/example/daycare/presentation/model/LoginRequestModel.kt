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
 * Firebase認証ログインリクエスト
 * @param localId FirebaseのlocalId（uid）
 */
data class LoginRequestModel(

    @get:Size(min=10,max=255)
    @field:NotNull
    @get:JsonProperty("localId") val localId: kotlin.String
    ) {

}

