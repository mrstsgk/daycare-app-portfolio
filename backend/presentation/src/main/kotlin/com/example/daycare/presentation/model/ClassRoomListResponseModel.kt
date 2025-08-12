package com.example.daycare.presentation.model

import com.example.daycare.presentation.model.ClassRoomModel
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
 * クラス情報一覧取得レスポンス
 * @param classRooms クラス情報の配列
 */
data class ClassRoomListResponseModel(

    @field:Valid
    @field:NotNull
    @get:JsonProperty("classRooms") val classRooms: List<ClassRoomModel>
    ) {

}

