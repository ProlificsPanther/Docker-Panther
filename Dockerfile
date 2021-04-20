# Setup base OS
FROM ubuntu

# Name of Creator
LABEL Author="Panther Support"
LABEL Corporation="Prolifics Inc."

# Setup JDK
RUN mkdir -p /Apps/ProlificsContainer
WORKDIR /Apps/ProlificsContainer

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix license/certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;
ENV SMJAVALIBRARY=/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/libjvm.so

# Setup JAVA_HOME -- useful for Docker command line
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
ENV SMJAVALIBRARY=/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/libjvm.so

# Copy and install Lynx
RUN apt-get update    && \
    apt-get install -y --no-install-recommends  \
    lynx && \
    rm -rf /var/lib/apt/lists/*

CMD ["lynx", "-h"]

# Unpack Panther(client & web)
RUN mkdir -p /Apps/ProlificsContainer/prlstdwb553.07
COPY prlstdwb553.07 /Apps/ProlificsContainer/prlstdwb553.07

# Unpack Panther and creating space for logs
RUN mkdir -p /Apps/ProlificsContainer/TestMigration
COPY migration /Apps/ProlificsContainer/TestMigration
RUN mkdir -p /Apps/ProlificsContainer/TestMigration/UI
COPY UI /Apps/ProlificsContainer/TestMigration/UI
RUN mkdir -p /Apps/ProlificsContainer/TestMigration/error
RUN mkdir -p /Apps/ProlificsContainer/TestMigration/web

# Setup and install Apache Tomcat
RUN mkdir -p /Apps/ProlificsContainer/Tomcat
ENV CATALINA_HOME=/Apps/ProlificsContainer/Tomcat
COPY apache-tomcat-8.5.33 /Apps/ProlificsContainer/Tomcat

# Configure Panther Servlet
RUN useradd -ms /bin/bash proweb
ENV HOME=/home/proweb
RUN mkdir -p ${HOME}/ini
COPY PantherDemo.war ${CATALINA_HOME}/webapps
COPY PantherDemo.ini ${HOME}/ini
RUN chmod -R 0777 /home

# Setup environment for Panther Web
ENV SMBASE=/Apps/ProlificsContainer/prlstdwb553.07
ENV PATH=$SMBASE/util:$SMBASE/config:${CATALINA_HOME}/bin:$SMBASE/servlet:$PATH
ENV SMPATH=$SMBASE/util:$SMBASE/config
ENV SMFLIBS=$SMBASE/util/mgmt.lib
ENV LM_LICENSE_FILE=$SMBASE/licenses/license.dat
ENV LD_LIBRARY_PATH=$SMBASE/lib:/usr/lib64:/lib64

# Start the Panther Web app and keep the container running
COPY ./docker-entrypoint.sh /

# Resolve possible permission issues
RUN chmod -R 0777 /Apps/ProlificsContainer

# Setup the landing point in container
WORKDIR /Apps/ProlificsContainer/TestMigration

# Expose port
EXPOSE 8080

# Setup  user
USER proweb
ENV SMUSER=proweb

ENTRYPOINT ["/docker-entrypoint.sh"]

#Copyright © 2021 Prolifics Inc. All Rights Reserved.
