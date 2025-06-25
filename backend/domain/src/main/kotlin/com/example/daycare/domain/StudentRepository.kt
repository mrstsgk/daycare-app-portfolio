package com.example.daycare.domain

interface StudentRepository {
    fun findAll(): List<Student>
} 