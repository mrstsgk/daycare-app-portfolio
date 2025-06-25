package com.example.daycare.usecase

import com.example.daycare.domain.Student
import com.example.daycare.domain.StudentRepository
import org.springframework.stereotype.Service

@Service
class GetStudentsUseCase(private val studentRepository: StudentRepository) {
    fun execute(): List<Student> = studentRepository.findAll()
} 