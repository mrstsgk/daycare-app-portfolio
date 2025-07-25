package com.example.daycare.presentation.apis

import org.springframework.web.context.request.NativeWebRequest

import jakarta.servlet.http.HttpServletResponse
import java.io.IOException

object ApiUtil {
    fun setExampleResponse(req: NativeWebRequest, contentType: String, example: String) {
        try {
            val res = req.getNativeResponse(HttpServletResponse::class.java)
            res?.characterEncoding = "UTF-8"
            res?.addHeader("Content-Type", contentType)
            res?.writer?.print(example)
        } catch (e: IOException) {
            throw RuntimeException(e)
        }
    }
}
