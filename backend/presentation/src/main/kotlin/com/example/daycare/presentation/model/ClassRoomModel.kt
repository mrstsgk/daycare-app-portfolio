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
 * クラス情報
 * @param id クラスID
 * @param name クラス名
 * @param capacity 定員
 */
data class ClassRoomModel(

    @field:NotNull
    @get:JsonProperty("id") val id: kotlin.Int,

    @field:NotNull
    @get:JsonProperty("name") val name: kotlin.String,

    @field:NotNull
    @get:JsonProperty("capacity") val capacity: kotlin.Int
    ) {

}

