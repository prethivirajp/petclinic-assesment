FROM openjdk:17-jdk-slim
VOLUME /tmp
ADD target/spring-petclinic-3.2.0-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
