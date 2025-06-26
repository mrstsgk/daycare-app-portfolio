FROM amazoncorretto:21 as builder
WORKDIR /app
COPY . .
# JOOQのgenerateJooqタスクを除外してビルド（生成済みファイルを使用）
RUN ./gradlew build -x generateJooq --no-daemon
RUN ls -lh build/libs/

FROM amazoncorretto:21
WORKDIR /app
COPY --from=builder /app/build/libs/daycare-0.0.1-SNAPSHOT.jar /app/app.jar
RUN ls -lh /app/
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]