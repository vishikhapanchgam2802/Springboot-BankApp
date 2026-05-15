#---------Stage 1------------
FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /src

COPY . /src

RUN mvn clean install -DskipTests=true

#---------Stage 2------------
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY --from=builder /src/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]