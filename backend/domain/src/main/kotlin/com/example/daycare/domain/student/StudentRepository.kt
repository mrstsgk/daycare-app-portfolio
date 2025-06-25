package com.example.daycare.domain.student

interface StudentRepository {
    fun findAll(): List<Student>
}