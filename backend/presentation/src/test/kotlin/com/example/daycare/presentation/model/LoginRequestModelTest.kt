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
                it("有効なlocalIdでインスタンスを生成できること") {
                    val validLocalId = "abcd1234efgh5678ijkl9012mnop3456"
                    val model = LoginRequestModel(validLocalId)

                    model.localId shouldBe validLocalId
                }

                it("最小長（10文字）のlocalIdでインスタンスを生成できること") {
                    val minLengthLocalId = "1234567890" // 10文字
                    val model = LoginRequestModel(minLengthLocalId)

                    model.localId shouldBe minLengthLocalId
                }

                it("最大長（255文字）のlocalIdでインスタンスを生成できること") {
                    val maxLengthLocalId = "a".repeat(255)
                    val model = LoginRequestModel(maxLengthLocalId)

                    model.localId shouldBe maxLengthLocalId
                }

                it("有効なlocalIdでインスタンスを生成できること") {
                    val localId = "firebase_localid_example_123"
                    val model = LoginRequestModel(localId)

                    model.localId shouldBe localId
                }

            }

            describe("localIdの基本的なプロパティ検証") {
                it("短いlocalIdでモデルが生成されること") {
                    val shortLocalId = "123456789" // 9文字
                    val model = LoginRequestModel(shortLocalId)

                    model.localId shouldBe shortLocalId
                }

                it("長いlocalIdでモデルが生成されること") {
                    val longLocalId = "a".repeat(256)
                    val model = LoginRequestModel(longLocalId)

                    model.localId shouldBe longLocalId
                }

                it("空文字列のlocalIdでモデルが生成されること") {
                    val emptyLocalId = ""
                    val model = LoginRequestModel(emptyLocalId)

                    model.localId shouldBe emptyLocalId
                }

                it("ブランク文字列のlocalIdでモデルが生成されること") {
                    val blankLocalId = "   " // 3つのスペース
                    val model = LoginRequestModel(blankLocalId)

                    model.localId shouldBe blankLocalId
                    model.localId.isBlank() shouldBe true
                }

                it("10文字のlocalIdでモデルが生成されること") {
                    val minLengthLocalId = "1234567890" // 10文字
                    val model = LoginRequestModel(minLengthLocalId)

                    model.localId shouldBe minLengthLocalId
                }

                it("255文字のlocalIdでモデルが生成されること") {
                    val maxLengthLocalId = "a".repeat(255)
                    val model = LoginRequestModel(maxLengthLocalId)

                    model.localId shouldBe maxLengthLocalId
                }

                it("Firebase形式のlocalIdでモデルが生成されること") {
                    val firebaseLocalId = "firebase_uid_example_123456789"
                    val model = LoginRequestModel(firebaseLocalId)

                    model.localId shouldBe firebaseLocalId
                    model.localId.length shouldBe 30
                }
            }

            describe("バリデーションエラーが期待されるケース") {
                it("最小長未満（9文字）のlocalIdは制約に違反すること") {
                    val shortLocalId = "123456789" // 9文字
                    val model = LoginRequestModel(shortLocalId)

                    model.localId shouldBe shortLocalId
                    
                    // Bean Validationを使用して制約違反を検証
                    val violations = validator.validate(model)
                    violations.size shouldNotBe 0
                    violations.any { it.propertyPath.toString() == "localId" } shouldBe true
                }

                it("最大長超過（256文字）のlocalIdは制約に違反すること") {
                    val longLocalId = "a".repeat(256) // 256文字
                    val model = LoginRequestModel(longLocalId)

                    model.localId shouldBe longLocalId
                    
                    // Bean Validationを使用して制約違反を検証
                    val violations = validator.validate(model)
                    violations.size shouldNotBe 0
                    violations.any { it.propertyPath.toString() == "localId" } shouldBe true
                }

                it("空文字列のlocalIdは制約に違反すること") {
                    val emptyLocalId = ""
                    val model = LoginRequestModel(emptyLocalId)

                    model.localId shouldBe emptyLocalId
                    
                    // Bean Validationを使用して制約違反を検証
                    val violations = validator.validate(model)
                    violations.size shouldNotBe 0
                    violations.any { it.propertyPath.toString() == "localId" } shouldBe true
                }

                it("有効な範囲のlocalIdはバリデーションエラーが発生しないこと") {
                    val validLocalId = "1234567890" // 10文字（最小長）
                    val model = LoginRequestModel(validLocalId)

                    val violations = validator.validate(model)
                    violations.size shouldBe 0
                }
            }
        }
    }
}
