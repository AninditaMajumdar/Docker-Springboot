FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn -Dmaven.test.failure.ignore=true

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=MAVEN_BUILD build/target/springboot2-jpa-crud-example-0.0.1-SNAPSHOT.jar /app/
ENTRYPOINT ["java", "-jar", "springboot2-jpa-crud-example-0.0.1-SNAPSHOT.jar"]

