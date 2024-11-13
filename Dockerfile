# Usa una imagen de Maven con OpenJDK 17 (o usa la versión slim)
FROM eclipse-temurin:17-jdk AS builder

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo pom.xml y los archivos necesarios para compilar la aplicación
COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
COPY src ./src

# Copia el archivo JAR generado al contenedor
RUN ./mvnw clean package -DskipTests

# Etapa de ejecución: usa una imagen más ligera con solo el JRE
FROM eclipse-temurin:17-jre

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR desde la etapa de compilación
COPY --from=builder /app/target/HolaMundoDocker-0.0.1-SNAPSHOT.jar /app/HolaMundoDocker.jar

# Expone el puerto 8080 para que la aplicación sea accesible desde fuera del contenedor
EXPOSE 8080

# Ejecuta la aplicación Spring Boot
CMD ["java", "-jar", "/app/HolaMundoDocker.jar"]
