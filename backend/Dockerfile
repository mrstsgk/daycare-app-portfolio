FROM amazoncorretto:21 as builder
WORKDIR /app
COPY . .

# Note: JOOQファイルは事前にローカルで生成済み（build/generated-src/に存在）
# OpenAPI生成のみをスキップしてビルド時間を短縮
# パラレル実行とビルドキャッシュで高速化
RUN ./gradlew assemble -x generateJooq -x openApiGenerate --parallel --build-cache --no-daemon

FROM amazoncorretto:21
WORKDIR /app
COPY --from=builder /app/build/libs/daycare-0.0.1-SNAPSHOT.jar /app/app.jar
RUN ls -lh /app/
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
