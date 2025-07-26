#!/bin/bash

# 生成されたKotlinファイルから@Schemaアノテーションのみを削除するスクリプト
# Bean Validationアノテーション（@Pattern、@Size、@Min、@Maxなど）は保持

MODEL_DIR="presentation/src/main/kotlin/com/example/daycare/presentation/model"

echo "Removing @Schema annotations from generated files (keeping Bean Validation annotations)..."

# @Schemaアノテーションを削除（Bean Validationアノテーションは保持）
find "$MODEL_DIR" -name "*.kt" -type f -exec sed -i '' '/@Schema(/d' {} \;

# @Schemaのimport文を削除
find "$MODEL_DIR" -name "*.kt" -type f -exec sed -i '' '/import io.swagger.v3.oas.annotations.media.Schema/d' {} \;

echo "Schema annotations removed successfully! Bean Validation annotations preserved." 