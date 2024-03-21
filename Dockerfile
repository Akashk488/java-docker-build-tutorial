#FROM adoptopenjdk/openjdk11:alpine-slim
FROM openjdk:17-alpine
ADD java-docker-build-tutorial/target/java-docker-build-1.0.0-SNAPSHOT.jar java-docker-build-1.0.0-SNAPSHOT.jar

RUN apk update && apk --no-cache add curl \
    && apk add busybox-extras \
    && apk add --no-cache tzdata \
    && apk add ttf-dejavu
    
ENV TZ Asia/Singapore
EXPOSE 8123 
ENTRYPOINT ["java","-Dspring.profiles.active=qa,docker","-jar","/java-docker-build-1.0.0-SNAPSHOT.jar"]
