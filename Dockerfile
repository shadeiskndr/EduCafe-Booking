# Use the official Eclipse Temurin image as the base image
FROM eclipse-temurin:21-jdk

# Set environment variables
ENV PATH_GF_HOME=/opt/glassfish7
ENV AS_ADMIN_USER=admin
ENV AS_ADMIN_PASSWORD=admin
ENV AS_ADMIN_PASSWORDFILE=/password.txt
ENV PATH_GF_PASSWORD_FILE_FOR_CHANGE=/password-change.txt
ENV GLASSFISH_VERSION=7.0.9
ENV PATH_GF_BIN=${PATH_GF_HOME}/bin
ENV PATH_GF_SERVER_LOG="${PATH_GF_HOME}/glassfish/domains/domain1/logs/server.log"
ENV PATH="${PATH_GF_BIN}:${PATH}"

# Expose necessary ports
EXPOSE 4848 9009 8080 8181 7676 8686 3700 3820 3920 6666

# Copy the entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Install necessary packages and GlassFish
RUN apt-get update && apt-get install -y unzip curl \
    && curl -fL "https://repo1.maven.org/maven2/org/glassfish/main/distributions/glassfish/${GLASSFISH_VERSION}/glassfish-${GLASSFISH_VERSION}.zip" -o glassfish.zip \
    && mkdir -p "${PATH_GF_HOME}" \
    && unzip -q glassfish.zip -d "${PATH_GF_HOME}/.." \
    && rm glassfish.zip \
    && groupadd -g 1000 glassfish \
    && useradd -r -l -u 1000 -g 1000 -d "${PATH_GF_HOME}" -s /bin/bash glassfish \
    && echo "AS_ADMIN_PASSWORD=${AS_ADMIN_PASSWORD}" > "${AS_ADMIN_PASSWORDFILE}" \
    && echo "AS_ADMIN_PASSWORD=" > "${PATH_GF_PASSWORD_FILE_FOR_CHANGE}" \
    && echo "AS_ADMIN_NEWPASSWORD=${AS_ADMIN_PASSWORD}" >> "${PATH_GF_PASSWORD_FILE_FOR_CHANGE}" \
    && echo "" >> "${PATH_GF_PASSWORD_FILE_FOR_CHANGE}" \
    && unset AS_ADMIN_PASSWORD \
    && AS_START_TIMEOUT=120000 asadmin start-domain \
    && curl -o /dev/null http://localhost:4848 \
    && asadmin --passwordfile ${PATH_GF_PASSWORD_FILE_FOR_CHANGE} change-admin-password \
    && asadmin stop-domain --kill \
    && AS_START_TIMEOUT=120000 asadmin start-domain \
    && curl -o /dev/null http://localhost:4848 \
    && asadmin set-log-attributes org.glassfish.main.jul.handler.GlassFishLogHandler.enabled=false \
    && asadmin set-log-attributes org.glassfish.main.jul.handler.SimpleLogHandler.level=FINEST \
    && asadmin enable-secure-admin \
    && asadmin stop-domain --kill \
    && rm -f ${PATH_GF_SERVER_LOG} ${PATH_GF_PASSWORD_FILE_FOR_CHANGE} \
    && chown -R glassfish:glassfish "${PATH_GF_HOME}" \
    && chmod +x /usr/local/bin/docker-entrypoint.sh \
    && echo "Installation was successful."

# Switch to the glassfish user
USER glassfish

# Set the working directory
WORKDIR ${PATH_GF_HOME}

# Define the entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]

# Copy the application files
COPY Assignment-war/dist/Assignment-war.war ${PATH_GF_HOME}/glassfish/domains/domain1/autodeploy/
COPY Assignment-ejb/dist/Assignment-ejb.jar ${PATH_GF_HOME}/glassfish/domains/domain1/lib/

# Start the GlassFish server
CMD ["asadmin", "start-domain", "-v"]
