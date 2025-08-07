package com.example.daycare.presentation.model

import com.fasterxml.jackson.annotation.JsonProperty
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size

/**
 * Firebase認証ログインリクエスト
 * @param idToken FirebaseのIDトークン
 */
data class LoginRequestModel(

    @get:Size(min = 10, max = 255)
    @field:NotNull
    @get:JsonProperty("idToken") val idToken: kotlin.String
) {

}

