# Usa una imagen de JDK como base
FROM eclipse-temurin:17-jdk AS builder

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR generado al contenedor
COPY . .

# Copia el archivo JAR generado al contenedor
RUN ./mvnw clean package -DskipTests

# Copia el arch
FROM eclipse-temurin:17-jre

# Establece el directorio de trabajo
WORKDIR /app

# Establece el directorio de trabajo
COPY --from=builder /app/target/*.jar app.jar

# Expone el puerto que utilizará la aplicación
EXPOSE 8080

# Ejecuta la aplicación
CMD ["java", "-jar", "app.jar"]
