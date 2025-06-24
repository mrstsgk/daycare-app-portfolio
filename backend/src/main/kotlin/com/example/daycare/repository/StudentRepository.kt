package com.example.daycare.repository

import com.example.daycare.domain.Student
import org.jooq.DSLContext
import org.springframework.stereotype.Repository

@Repository
class StudentRepository(private val dsl: DSLContext) {
    fun findAll(): List<Student> =
        dsl.fetch("SELECT id, name, age, class_name FROM students")
            .map {
                Student(
                    it.get("id", Int::class.java)!!,
                    it.get("name", String::class.java)!!,
                    it.get("age", Int::class.java)!!,
                    it.get("class_name", String::class.java)!!
                )
            }
} 