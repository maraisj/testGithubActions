FROM openjdk:8-jre-alpine

EXPOSE 8081

COPY /home/runner/work/testGithubActions/testGithubActions/target/demo-0.0.1-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
