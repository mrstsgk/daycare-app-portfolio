#!/bin/bash

# 生成されたKotlinファイルに@field:NotNullアノテーションを追加するスクリプト
# required = trueが設定されているフィールドに@field:NotNullを追加

MODEL_DIR="presentation/src/main/kotlin/com/example/daycare/presentation/model"

echo "Adding @field:NotNull annotations to required fields..."

# required = trueが設定されているフィールドに@field:NotNullを追加
find "$MODEL_DIR" -name "*.kt" -type f -exec sed -i '' 's/@get:JsonProperty("\([^"]*\)", required = true)/@field:NotNull\n    @get:JsonProperty("\1")/g' {} \;

echo "NotNull annotations added successfully!" 