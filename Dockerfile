FROM tomcat:9.0-jdk11

# Instalar fuentes completas de Microsoft y otras
RUN apt-get update && \
    echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections && \
    apt-get install -y --no-install-recommends \
    fontconfig \
    fonts-liberation \
    fonts-dejavu \
    fonts-freefont-ttf \
    ttf-mscorefonts-installer \
    cabextract && \
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
