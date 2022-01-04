#not being used becaus of spring maven plugin
FROM openjdk:17-alpine as build
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
RUN mkdir -p ~/target/dependency && (cd ~/target/dependency; jar -xf /app.jar)

FROM openjdk:17-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG DEPENDENCY=/home/spring/target/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.example.k8stest.K8stestApplication"]