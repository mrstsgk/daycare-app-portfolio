#!/bin/bash

# 生成されたKotlinファイルから@Schemaアノテーションのみを削除するスクリプト
# Bean Validationアノテーション（@Pattern、@Size、@Min、@Maxなど）は保持

MODEL_DIR="presentation/src/main/kotlin/com/example/daycare/presentation/model"

echo "Removing @Schema annotations and unnecessary imports from generated files..."

# @Schemaアノテーションを削除（Bean Validationアノテーションは保持）
find "$MODEL_DIR" -name "*.kt" -type f -exec sed -i '' '/@Schema(/d' {} \;

# @Schemaのimport文を削除
find "$MODEL_DIR" -name "*.kt" -type f -exec sed -i '' '/import io.swagger.v3.oas.annotations.media.Schema/d' {} \;

# 不要なimport java.util.Objectsを削除
find "$MODEL_DIR" -name "*.kt" -type f -exec sed -i '' '/import java.util.Objects/d' {} \;

# values().first{it -> it.value == value}をentries.first{it.value == value}.keyに置換
find "$MODEL_DIR" -name "*.kt" -type f -exec sed -i '' 's/values()\.first{it -> it\.value == value}/entries.first{it.value == value}/g' {} \;

echo "Schema annotations and unnecessary imports removed successfully! Bean Validation annotations preserved." 