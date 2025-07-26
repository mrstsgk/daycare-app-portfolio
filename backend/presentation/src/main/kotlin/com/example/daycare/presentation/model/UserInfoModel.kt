package com.example.daycare.presentation.model

import com.fasterxml.jackson.annotation.JsonCreator
import com.fasterxml.jackson.annotation.JsonProperty
import com.fasterxml.jackson.annotation.JsonValue
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
 * ユーザー情報
 * @param id ユーザーID
 * @param name ユーザー名
 * @param userType ユーザータイプ
 */
data class UserInfoModel(

    @get:JsonProperty("id", required = true) val id: kotlin.Long,

    @get:JsonProperty("name", required = true) val name: kotlin.String,

    @get:JsonProperty("userType", required = true) val userType: UserInfoModel.UserType
    ) {

    /**
    * ユーザータイプ
    * Values: employee,guardian
    */
    enum class UserType(@get:JsonValue val value: kotlin.String) {

        employee("employee"),
        guardian("guardian");

        companion object {
            @JvmStatic
            @JsonCreator
            fun forValue(value: kotlin.String): UserType {
                return entries.first{it.value == value}
            }
        }
    }

}

