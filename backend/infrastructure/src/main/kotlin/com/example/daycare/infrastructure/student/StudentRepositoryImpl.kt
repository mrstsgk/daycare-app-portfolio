package com.example.daycare.infrastructure.student

import com.example.daycare.domain.student.Student
import com.example.daycare.domain.student.StudentRepository
import com.example.daycare.infrastructure.jooq.tables.records.StudentRecord
import com.example.daycare.infrastructure.jooq.tables.references.STUDENT
import org.jooq.DSLContext
import org.springframework.stereotype.Repository

@Repository
class StudentRepositoryImpl(private val dsl: DSLContext) : StudentRepository {
    override fun findAll(): List<Student> = dsl
        .selectFrom(STUDENT)
        .orderBy(STUDENT.ID.asc())
        .fetch()
        .map { convert(it) }

    private fun convert(record: StudentRecord): Student = Student(
        id = record.id!!.toLong(),
        name = record.name!!,
        age = record.age!!,
        className = record.className!!
    )
}