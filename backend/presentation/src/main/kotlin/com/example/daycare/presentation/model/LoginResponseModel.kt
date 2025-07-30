package com.example.daycare.presentation.model

import com.fasterxml.jackson.annotation.JsonCreator
import com.fasterxml.jackson.annotation.JsonProperty
import com.fasterxml.jackson.annotation.JsonValue
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
 * @param userId ユーザーID
 * @param userName ユーザー名
 * @param userType ユーザータイプ
 */
data class LoginResponseModel(

    @field:NotNull
    @get:JsonProperty("isSuccess") val isSuccess: kotlin.Boolean,

    @field:NotNull
    @get:JsonProperty("token") val token: kotlin.String,

    @field:NotNull
    @get:JsonProperty("userId") val userId: kotlin.Long,

    @field:NotNull
    @get:JsonProperty("userName") val userName: kotlin.String,

    @field:NotNull
    @get:JsonProperty("userType") val userType: LoginResponseModel.UserType
    ) {

    /**
    * ユーザータイプ
    * Values: _0,_1
    */
    enum class UserType(@get:JsonValue val value: kotlin.Int) {

        _0(0),
        _1(1);

        companion object {
            @JvmStatic
            @JsonCreator
            fun forValue(value: kotlin.Int): UserType {
                return entries.first{it.value == value}
            }
        }
    }

}

