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
 * ログインリクエスト
 * @param loginId ログインID（ユーザーのコード）- 英数文字のみ入力可能
 * @param password パスワード（10文字以上50文字以下） 以下の文字種を最低1文字ずつ含む必要があります： - 英大文字（A-Z） - 英小文字（a-z） - 数字（0-9） - 記号（!@#$%^&*など） 
 */
data class LoginRequestModel(

    @get:Pattern(regexp="^[A-Za-z0-9]+$")
    @get:Size(min=1,max=50)
    @field:NotNull
    @get:JsonProperty("loginId") val loginId: kotlin.String,

    @get:Pattern(regexp="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]$")
    @get:Size(min=10,max=50)
    @field:NotNull
    @get:JsonProperty("password") val password: kotlin.String
    ) {

}

