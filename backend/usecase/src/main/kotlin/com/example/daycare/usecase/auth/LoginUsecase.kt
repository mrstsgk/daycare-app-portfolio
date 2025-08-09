package com.example.daycare.usecase.auth

import com.example.daycare.usecase.user.UserQueryService
import com.example.daycare.usecase.user.UserSummaryDto

class LoginUsecase(private val userQueryService: UserQueryService) {
    /**
     *  localIdからログインするユーザーのサマリー情報を取得する
     */
    fun execute(localId: String): LoginResult {
        if (localId.isBlank()) return LoginResult.UserNotFound

        val user = userQueryService.findByLocalId(localId)
        return if (user != null) LoginResult.Success(user) else LoginResult.UserNotFound
    }
}

sealed class LoginResult {
    data class Success(val user: UserSummaryDto) : LoginResult()
    object UserNotFound : LoginResult()
}
