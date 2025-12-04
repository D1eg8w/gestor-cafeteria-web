FROM tomcat:9.0-jdk11

# Instalar fuentes de Microsoft (incluye Arial)
RUN apt-get update && \
    apt-get install -y fontconfig fonts-liberation ttf-mscorefonts-installer && \
    fc-cache -f -v && \
    rm -rf /var/lib/apt/lists/*

# Eliminar aplicaciones por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar tu WAR como ROOT
COPY GestorCafeteriaWeb-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Exponer puerto
EXPOSE 8080

# Iniciar Tomcat
CMD ["catalina.sh", "run"]
