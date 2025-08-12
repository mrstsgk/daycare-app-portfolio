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

    @field:NotNull
    @get:JsonProperty("id") val id: Long,

    @get:Size(max=50)
    @field:NotNull
    @get:JsonProperty("name") val name: String,

    @get:Min(0)
    @get:Max(20)
    @field:NotNull
    @get:JsonProperty("age") val age: Int,

    @get:Size(max=50)
    @field:NotNull
    @get:JsonProperty("className") val className: String
    ) {

}

