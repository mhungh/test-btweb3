# Stage 1: Build WAR file with Maven & JDK 21
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run on Tomcat 10.1 (Jakarta EE 10) with JDK 21
FROM tomcat:10.1-jdk21-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
# Deploy as ROOT.war so Render serves it directly at /
COPY --from=build /app/target/btweb3.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
