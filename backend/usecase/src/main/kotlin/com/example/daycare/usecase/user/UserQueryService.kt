package com.example.daycare.usecase.user

interface UserQueryService {
    /**
     * FirebaseのlocalId（uid）を使用してユーザーを取得
     */
    fun findByLocalId(localId: String): UserSummaryDto?
}