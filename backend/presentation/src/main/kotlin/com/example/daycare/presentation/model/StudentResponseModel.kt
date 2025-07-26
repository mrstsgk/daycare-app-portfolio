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
 * 生徒レスポンスモデル
 * @param id 生徒ID
 * @param name 生徒名
 * @param age 年齢
 * @param className クラス名
 */
data class StudentResponseModel(

    @get:JsonProperty("id", required = true) val id: kotlin.Long,

    @get:Size(max=50)
    @get:JsonProperty("name", required = true) val name: kotlin.String,

    @get:Min(0)
    @get:Max(20)
    @get:JsonProperty("age", required = true) val age: kotlin.Int,

    @get:Size(max=50)
    @get:JsonProperty("className", required = true) val className: kotlin.String
    ) {

}

