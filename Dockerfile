FROM openjdk:21-jdk-slim

LABEL authors="eustache"

EXPOSE 8080

ADD target/devops-integration.jar devops-integration.jar

ENTRYPOINT ["java", "-jar", "/devops-integration.jar"]