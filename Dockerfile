FROM maven:3.8.3-jdk-11-slim AS build

WORKDIR /project

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src/ /project/src

RUN mvn package

FROM adoptopenjdk/openjdk11:jre-11.0.15_10-alpine

RUN mkdir /app

RUN addgroup -g 1001 -S tecogroup

RUN adduser -S teco -u 1001

COPY --from=build /project/target/demo-0.0.1-SNAPSHOT.jar /app/demo-0.0.1-SNAPSHOT.jar

WORKDIR /app

RUN chown -R teco:tecogroup /app

EXPOSE 8081

CMD java $JAVA_OPTS -jar demo-0.0.1-SNAPSHOT.jar
