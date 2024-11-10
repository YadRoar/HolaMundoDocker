# Usa una imagen de JDK como base
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR generado al contenedor
COPY target/HolaMundoDocker-0.0.1-SNAPSHOT.jar app.jar

# Expone el puerto que utilizará la aplicación
EXPOSE 8080

# Ejecuta la aplicación
CMD ["java", "-jar", "app.jar"]
