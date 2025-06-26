package com.example.daycare.usecase.student.read

import com.example.daycare.domain.student.Student
import com.example.daycare.domain.student.StudentRepository
import org.springframework.stereotype.Service

@Service
class ReadStudentUsecase(private val studentRepository: StudentRepository) {
    fun execute(): List<Student> = studentRepository.findAll()
}