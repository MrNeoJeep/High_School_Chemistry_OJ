FROM java:8

EXPOSE 8000


ADD xzs-3.9.0.jar app.jar
RUN bash -c 'touch /app.jar'

ENTRYPOINT ["java","-jar","/app.jar","--spring.profiles.active=prod"]
