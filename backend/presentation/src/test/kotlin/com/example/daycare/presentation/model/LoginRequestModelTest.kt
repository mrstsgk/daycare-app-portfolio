package com.example.daycare.presentation.model

import io.kotest.core.spec.style.DescribeSpec
import io.kotest.matchers.shouldBe
import io.kotest.matchers.shouldNotBe
import jakarta.validation.Validation
import jakarta.validation.Validator

class LoginRequestModelTest : DescribeSpec() {
    
    private val validatorFactory = Validation.buildDefaultValidatorFactory()
    private val validator: Validator = validatorFactory.validator

    init {
        describe("Firebase認証ログインリクエストモデル") {

            describe("有効なデータ") {
                it("有効なIDトークンでインスタンスを生成できること") {
                    val validToken =
                        "eyJhbGciOiJSUzI1NiIsImtpZCI6IjE2Ng.eyJ1c2VyX2lkIjoiMTIzIiwiaWF0IjoxNjMwMDAwMDAwfQ.signature123abc"
                    val model = LoginRequestModel(validToken)

                    model.idToken shouldBe validToken
                }

                it("最小長（10文字）のIDトークンでインスタンスを生成できること") {
                    val minLengthToken = "1234567890" // 10文字
                    val model = LoginRequestModel(minLengthToken)

                    model.idToken shouldBe minLengthToken
                }

                it("最大長（255文字）のIDトークンでインスタンスを生成できること") {
                    val maxLengthToken = "a".repeat(255)
                    val model = LoginRequestModel(maxLengthToken)

                    model.idToken shouldBe maxLengthToken
                }

                it("有効なJWT形式のIDトークンでインスタンスを生成できること") {
                    val jwtToken =
                        "eyJhbGciOiJSUzI1NiIsImtpZCI6IjE2Ng.eyJ1c2VyX2lkIjoiMTIzIiwiaWF0IjoxNjMwMDAwMDAwfQ.signature123abc"
                    val model = LoginRequestModel(jwtToken)

                    model.idToken shouldBe jwtToken
                }

            }

            describe("IDトークンの基本的なプロパティ検証") {
                it("短いIDトークンでモデルが生成されること") {
                    val shortToken = "123456789" // 9文字
                    val model = LoginRequestModel(shortToken)

                    model.idToken shouldBe shortToken
                }

                it("長いIDトークンでモデルが生成されること") {
                    val longToken = "a".repeat(256)
                    val model = LoginRequestModel(longToken)

                    model.idToken shouldBe longToken
                }

                it("空文字列のIDトークンでモデルが生成されること") {
                    val emptyToken = ""
                    val model = LoginRequestModel(emptyToken)

                    model.idToken shouldBe emptyToken
                }

                it("ブランク文字列のIDトークンでモデルが生成されること") {
                    val blankToken = "   " // 3つのスペース
                    val model = LoginRequestModel(blankToken)

                    model.idToken shouldBe blankToken
                    model.idToken.isBlank() shouldBe true
                }

                it("10文字のIDトークンでモデルが生成されること") {
                    val minLengthToken = "1234567890" // 10文字
                    val model = LoginRequestModel(minLengthToken)

                    model.idToken shouldBe minLengthToken
                }

                it("255文字のIDトークンでモデルが生成されること") {
                    val maxLengthToken = "a".repeat(255)
                    val model = LoginRequestModel(maxLengthToken)

                    model.idToken shouldBe maxLengthToken
                }

                it("JWT形式のIDトークンでモデルが生成されること") {
                    val jwtToken =
                        "eyJhbGciOiJSUzI1NiIsImtpZCI6IjE2Ng.eyJ1c2VyX2lkIjoiMTIzIiwiaWF0IjoxNjMwMDAwMDAwfQ.signature123abc"
                    val model = LoginRequestModel(jwtToken)

                    model.idToken shouldBe jwtToken
                    model.idToken.contains(".") shouldBe true
                }
            }

            describe("バリデーションエラーが期待されるケース") {
                it("最小長未満（9文字）のIDトークンは制約に違反すること") {
                    val shortToken = "123456789" // 9文字
                    val model = LoginRequestModel(shortToken)

                    model.idToken shouldBe shortToken
                    
                    // Bean Validationを使用して制約違反を検証
                    val violations = validator.validate(model)
                    violations.size shouldNotBe 0
                    violations.any { it.propertyPath.toString() == "idToken" } shouldBe true
                }

                it("最大長超過（256文字）のIDトークンは制約に違反すること") {
                    val longToken = "a".repeat(256) // 256文字
                    val model = LoginRequestModel(longToken)

                    model.idToken shouldBe longToken
                    
                    // Bean Validationを使用して制約違反を検証
                    val violations = validator.validate(model)
                    violations.size shouldNotBe 0
                    violations.any { it.propertyPath.toString() == "idToken" } shouldBe true
                }

                it("空文字列のIDトークンは制約に違反すること") {
                    val emptyToken = ""
                    val model = LoginRequestModel(emptyToken)

                    model.idToken shouldBe emptyToken
                    
                    // Bean Validationを使用して制約違反を検証
                    val violations = validator.validate(model)
                    violations.size shouldNotBe 0
                    violations.any { it.propertyPath.toString() == "idToken" } shouldBe true
                }

                it("有効な範囲のIDトークンはバリデーションエラーが発生しないこと") {
                    val validToken = "1234567890" // 10文字（最小長）
                    val model = LoginRequestModel(validToken)

                    val violations = validator.validate(model)
                    violations.size shouldBe 0
                }
            }
        }
    }
}
