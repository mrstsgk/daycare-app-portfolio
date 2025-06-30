package com.example.daycare.presentation.model

import java.util.Objects
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
import io.swagger.v3.oas.annotations.media.Schema

/**
 * 生徒レスポンスモデル
 * @param id 生徒ID
 * @param name 生徒名
 * @param age 年齢
 * @param className クラス名
 */
data class StudentResponseModel(

    @Schema(example = "1", required = true, description = "生徒ID")
    @get:JsonProperty("id", required = true) val id: kotlin.Long,

    @get:Size(max=50)
    @Schema(example = "田中太郎", required = true, description = "生徒名")
    @get:JsonProperty("name", required = true) val name: kotlin.String,

    @get:Min(0)
    @get:Max(20)
    @Schema(example = "5", required = true, description = "年齢")
    @get:JsonProperty("age", required = true) val age: kotlin.Int,

    @get:Size(max=50)
    @Schema(example = "ひまわり組", required = true, description = "クラス名")
    @get:JsonProperty("className", required = true) val className: kotlin.String
    ) {

}

