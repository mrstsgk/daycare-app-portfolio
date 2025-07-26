package com.example.daycare.presentation.model

import com.example.daycare.presentation.model.UserInfoModel
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
 * ログインレスポンス
 * @param isSuccess ログイン成功フラグ
 * @param token JWTトークン
 * @param user 
 */
data class LoginResponseModel(

    @get:JsonProperty("isSuccess", required = true) val isSuccess: kotlin.Boolean,

    @get:JsonProperty("token", required = true) val token: kotlin.String,

    @field:Valid
    @get:JsonProperty("user", required = true) val user: UserInfoModel
    ) {

}

