package com.example.daycare.presentation

import com.example.daycare.domain.Student
import com.example.daycare.usecase.GetStudentsUseCase
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/students")
@Tag(name = "Student", description = "生徒API")
class StudentController(private val getStudentsUseCase: GetStudentsUseCase) {
    @GetMapping
    @Operation(summary = "生徒一覧取得")
    fun getStudents(): List<Student> = getStudentsUseCase.execute()
} 