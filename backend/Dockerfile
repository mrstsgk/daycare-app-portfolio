# syntax=docker/dockerfile:1.7
FROM amazoncorretto:21 as builder
WORKDIR /app

# ソースコードをコピー
COPY . .

# buildタスクを使用（assembleより安全）、テストは明示的にスキップ
# JVM起動最適化とビルドキャッシュで高速化
RUN --mount=type=cache,target=/root/.gradle/caches \
    --mount=type=cache,target=/root/.gradle/wrapper \
    GRADLE_OPTS="-Dorg.gradle.jvmargs=-Xmx2g -XX:+UseParallelGC -XX:MaxMetaspaceSize=512m" \
    ./gradlew build \
    -x test -x check \
    -x generateJooq -x :infrastructure:generateJooq \
    -x openApiGenerate \
    --parallel --build-cache --configuration-cache --no-daemon --quiet

FROM amazoncorretto:21
WORKDIR /app
COPY --from=builder /app/build/libs/daycare-0.0.1-SNAPSHOT.jar /app/app.jar
RUN ls -lh /app/
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
