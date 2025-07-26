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
 * エラーレスポンス
 * @param isSuccess 成功フラグ（常にfalse）
 * @param message エラーメッセージ
 * @param errorCode エラーコード
 */
data class ErrorResponse(

    @get:JsonProperty("isSuccess", required = true) val isSuccess: kotlin.Boolean,

    @get:JsonProperty("message", required = true) val message: kotlin.String,

    @get:JsonProperty("errorCode") val errorCode: kotlin.String? = null
    ) {

}

