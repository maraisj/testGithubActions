FROM openjdk:8
EXPOSE 8081
ADD target/demo-0.0.1-SNAPSHOT.jar springboot-images-new.jar
ENTRYPOINT ["java","-jar","/demo-0.0.1-SNAPSHOT.jar"]
