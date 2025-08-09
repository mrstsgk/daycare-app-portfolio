package com.example.daycare.infrastructure.user

import com.example.daycare.infrastructure.jooq.tables.User.Companion.USER
import com.example.daycare.infrastructure.jooq.tables.records.UserRecord
import com.example.daycare.usecase.user.UserQueryService
import com.example.daycare.usecase.user.UserSummaryDto
import org.jooq.DSLContext
import org.springframework.stereotype.Repository

@Repository
class UserQueryServiceImpl(private val dsl: DSLContext) : UserQueryService {
    override fun findByLocalId(localId: String): UserSummaryDto? = dsl
        .selectFrom(USER)
        .where(USER.FIREBASE_UID.eq(localId))
        .fetchOne()
        ?.let { record -> convertToUserSummaryDto(record) }

    /**
     * ユーザーのレコードをUserSummaryDtoに変換するヘルパー関数
     */
    private fun convertToUserSummaryDto(record: UserRecord): UserSummaryDto {
        return UserSummaryDto(
            id = record[USER.ID]!!,
            name = record[USER.NAME]!!
        )
    }
}
