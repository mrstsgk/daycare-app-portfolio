package com.example.daycare.presentation.model

import com.example.daycare.presentation.model.ApiErrorModel
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
 * @param error 
 */
data class UnauthorizedErrorResponseModel(

    @field:Valid
    @get:JsonProperty("error") val error: kotlin.collections.List<ApiErrorModel>? = null
    ) {

}

