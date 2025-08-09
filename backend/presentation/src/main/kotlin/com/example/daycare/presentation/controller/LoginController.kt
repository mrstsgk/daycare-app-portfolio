package com.example.daycare.presentation.controller

import com.example.daycare.presentation.model.LoginRequestModel
import com.example.daycare.presentation.model.LoginResponseModel
import com.example.daycare.presentation.model.UserSummaryModel
import com.example.daycare.usecase.auth.LoginResult
import com.example.daycare.usecase.auth.LoginUsecase
import jakarta.validation.Valid
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api")
class LoginController(private val loginUsecase: LoginUsecase) {
    /**
     * ログインAPI
     */
    @PostMapping("/login")
    fun login(@Valid @RequestBody request: LoginRequestModel): ResponseEntity<LoginResponseModel> {
        return when (val result = loginUsecase.execute(request.localId)) {
            is LoginResult.Success -> {
                val response = LoginResponseModel(
                    success = true,
                    message = "ログインが成功しました",
                    user = UserSummaryModel(
                        id = result.user.id,
                        name = result.user.name
                    )
                )
                ResponseEntity.ok(response)
            }

            is LoginResult.UserNotFound -> {
                val response = LoginResponseModel(
                    success = false,
                    message = "ユーザーの認証に失敗しました",
                    user = null,
                )
                ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response)
            }
        }
    }
}
