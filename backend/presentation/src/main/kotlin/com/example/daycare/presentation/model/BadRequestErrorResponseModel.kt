package com.example.daycare.presentation.model

import com.example.daycare.presentation.model.ApiErrorModel
import com.example.daycare.presentation.model.List
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
 * リクエストが不正な場合のエラーレスポンス
 * @param error 
 */
data class BadRequestErrorResponseModel(

    @field:Valid
    @get:JsonProperty("error") val error: List<ApiErrorModel>? = null
    ) {

}

