package com.example.daycare.presentation.model

import io.kotest.core.spec.style.DescribeSpec
import io.kotest.matchers.shouldBe
import io.kotest.matchers.shouldNotBe
import jakarta.validation.Validation
import jakarta.validation.Validator

class LoginRequestModelTest : DescribeSpec({

    val validator: Validator = Validation.buildDefaultValidatorFactory().validator

    describe("ログインリクエストモデル") {

        describe("有効なデータ") {
            it("有効なログインIDとパスワードでインスタンスを生成できること") {
                val model = LoginRequestModel(
                    loginId = "testUser123",
                    password = "ValidPass123!"
                )

                model.loginId shouldBe "testUser123"
                model.password shouldBe "ValidPass123!"
            }

            it("有効なデータでバリデーションが通ること") {
                val model = LoginRequestModel(
                    loginId = "user123",
                    password = "SecurePass1!"
                )

                val violations = validator.validate(model)
                violations.size shouldBe 0
            }
        }

        describe("ログインIDのバリデーション") {
            it("ログインIDが空文字の場合バリデーションエラーになること") {
                val model = LoginRequestModel(
                    loginId = "",
                    password = "ValidPass123!"
                )

                val violations = validator.validate(model)
                violations.size shouldNotBe 0
            }

            it("ログインIDに特殊文字が含まれる場合バリデーションエラーになること") {
                val model = LoginRequestModel(
                    loginId = "user@123",
                    password = "ValidPass123!"
                )

                val violations = validator.validate(model)
                violations.size shouldNotBe 0
            }

            it("ログインIDが最大文字数を超える場合バリデーションエラーになること") {
                val model = LoginRequestModel(
                    loginId = "a".repeat(51),
                    password = "ValidPass123!"
                )

                val violations = validator.validate(model)
                violations.size shouldNotBe 0
            }

            it("英数字のログインIDでバリデーションが通ること") {
                val model = LoginRequestModel(
                    loginId = "User123",
                    password = "ValidPass123!"
                )

                val violations = validator.validate(model)
                violations.size shouldBe 0
            }
        }

        describe("パスワードのバリデーション") {
            it("パスワードが短すぎる場合バリデーションエラーになること") {
                val model = LoginRequestModel(
                    loginId = "user123",
                    password = "Short1!"
                )

                val violations = validator.validate(model)
                violations.size shouldNotBe 0
            }

            it("パスワードに大文字が含まれない場合バリデーションエラーになること") {
                val model = LoginRequestModel(
                    loginId = "user123",
                    password = "lowercase123!"
                )

                val violations = validator.validate(model)
                violations.size shouldNotBe 0
            }

            it("パスワードに小文字が含まれない場合バリデーションエラーになること") {
                val model = LoginRequestModel(
                    loginId = "user123",
                    password = "UPPERCASE123!"
                )

                val violations = validator.validate(model)
                violations.size shouldNotBe 0
            }

            it("パスワードに数字が含まれない場合バリデーションエラーになること") {
                val model = LoginRequestModel(
                    loginId = "user123",
                    password = "NoDigitsHere!"
                )

                val violations = validator.validate(model)
                violations.size shouldNotBe 0
            }

            it("パスワードに特殊文字が含まれない場合バリデーションエラーになること") {
                val model = LoginRequestModel(
                    loginId = "user123",
                    password = "NoSpecialChar123"
                )

                val violations = validator.validate(model)
                violations.size shouldNotBe 0
            }

            it("パスワードが最大文字数を超える場合バリデーションエラーになること") {
                val model = LoginRequestModel(
                    loginId = "user123",
                    password = "VeryLongPassword123!".repeat(3)
                )

                val violations = validator.validate(model)
                violations.size shouldNotBe 0
            }

            it("複雑な有効パスワードでバリデーションが通ること") {
                val model = LoginRequestModel(
                    loginId = "user123",
                    password = "Complex123!@#"
                )

                val violations = validator.validate(model)
                violations.size shouldBe 0
            }
        }
    }
})