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
 * ユーザー情報の概要
 * @param id ユーザーID
 * @param name ユーザー名
 */
data class UserSummaryModel(

    @field:Valid
    @field:NotNull
    @get:JsonProperty("id") val id: Int,

    @field:Valid
    @field:NotNull
    @get:JsonProperty("name") val name: String
    ) {

}

