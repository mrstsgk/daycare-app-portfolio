package com.example.daycare.infrastructure

import com.example.daycare.domain.Student
import com.example.daycare.domain.StudentRepository
import org.jooq.DSLContext
import org.jooq.Record
import org.jooq.impl.DSL
import org.springframework.stereotype.Repository

@Repository
class StudentRepositoryImpl(private val dsl: DSLContext) : StudentRepository {
    override fun findAll(): List<Student> =
        dsl.selectFrom(DSL.table("students"))
            .fetch { record: Record ->
                Student(
                    id = record.getValue("id", Long::class.java) ?: 0L,
                    name = record.getValue("name", String::class.java) ?: "",
                    age = record.getValue("age", Int::class.java) ?: 0,
                    className = record.getValue("class_name", String::class.java) ?: ""
                )
            }
}