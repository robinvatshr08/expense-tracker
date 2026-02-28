# Stage 1 build JAR
FROM maven:3.9.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests=true

# Stage 2 execute JAR
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY --from=builder /app/target/*.jar /app/expenseapp.jar
EXPOSE 8080
CMD ["java","-jar","expenseapp.jar"]

