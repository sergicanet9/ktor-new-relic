# Stage 1: Cache Gradle dependencies
FROM gradle:8.14.2-jdk21 AS cache
RUN mkdir -p /home/gradle/cache_home
ENV GRADLE_USER_HOME=/home/gradle/cache_home
COPY build.gradle.* gradle.properties /home/gradle/app/
COPY gradle /home/gradle/app/gradle
WORKDIR /home/gradle/app
RUN gradle clean build -i --stacktrace

# Stage 2: Build Application
FROM gradle:8.14.2-jdk21 AS build
COPY --from=cache /home/gradle/cache_home /home/gradle/.gradle
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
# Build the fat JAR, Gradle also supports shadow
# and boot JAR by default.
RUN gradle buildFatJar --no-daemon

# Stage 3: Create the Runtime Image
FROM amazoncorretto:21-alpine3.21-jdk AS runtime
EXPOSE 8080
RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/*.jar /app/ktor-new-relic.jar

RUN mkdir -p /usr/local/newrelic
ADD ./newrelic/newrelic.jar /usr/local/newrelic/newrelic.jar
ADD ./newrelic/newrelic.yml /usr/local/newrelic/newrelic.yml

ENTRYPOINT ["java","-javaagent:/usr/local/newrelic/newrelic.jar","-jar","/app/ktor-new-relic.jar"]
