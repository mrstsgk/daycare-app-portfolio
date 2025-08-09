package com.example.daycare.presentation.model

import com.example.daycare.presentation.model.UserSummaryModel
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
 * Firebase認証ログインレスポンス
 * @param success ログイン成功フラグ
 * @param message メッセージ
 * @param user 
 */
data class LoginResponseModel(

    @field:NotNull
    @get:JsonProperty("success") val success: kotlin.Boolean,

    @field:NotNull
    @get:JsonProperty("message") val message: kotlin.String,

    @field:Valid
    @get:JsonProperty("user") val user: UserSummaryModel? = null
    ) {

}

