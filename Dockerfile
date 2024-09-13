# Use a imagem base do OpenJDK 17 Slim
FROM openjdk:17-jdk-slim

# Crie um usuário não privilegiado
RUN adduser --no-create-home --disabled-password myuser

# Crie um diretório para a aplicação
WORKDIR /app

# Copie o arquivo JAR para o diretório de trabalho
COPY target/DirtyCode-0.0.1-SNAPSHOT.jar /app/DirtyCode-0.0.1-SNAPSHOT.jar

# Altere a propriedade do diretório e arquivo para o novo usuário
RUN chown myuser:myuser /app/DirtyCode-0.0.1-SNAPSHOT.jar

# Use o usuário não privilegiado
USER myuser

# Defina a variável de ambiente
ENV SPRING_PROFILES_ACTIVE=prod

# Exponha a porta na qual a aplicação estará escutando
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "DirtyCode-0.0.1-SNAPSHOT.jar"]
