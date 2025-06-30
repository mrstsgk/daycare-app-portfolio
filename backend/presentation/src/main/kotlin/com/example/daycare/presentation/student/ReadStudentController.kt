package com.example.daycare.presentation.student

import com.example.daycare.presentation.model.StudentResponseModel
import com.example.daycare.usecase.student.read.ReadStudentUsecase
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.media.ArraySchema
import io.swagger.v3.oas.annotations.media.Content
import io.swagger.v3.oas.annotations.media.Schema
import io.swagger.v3.oas.annotations.responses.ApiResponse
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/students")
@Tag(name = "Student", description = "生徒API")
class ReadStudentController(private val usecase: ReadStudentUsecase) {
    
    @GetMapping
    @Operation(
        summary = "生徒一覧取得",
        description = "全生徒の一覧を取得します"
    )
    @ApiResponse(
        responseCode = "200",
        description = "生徒一覧取得成功",
        content = [
            Content(
                mediaType = "application/json",
                array = ArraySchema(schema = Schema(implementation = StudentResponseModel::class))
            )
        ]
    )
    fun getStudents(): ResponseEntity<List<StudentResponseModel>> {
        val students = usecase.execute()
        val responseModels = students.map { student ->
            StudentResponseModel(
                id = student.id,
                name = student.name,
                age = student.age,
                className = student.className
            )
        }
        return ResponseEntity.ok(responseModels)
    }
}
