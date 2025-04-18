FROM alpine:latest

# <version> | 'latest'
ARG MC_VERSION
ENV JAVA_VERSION=21

RUN apk add --no-cache \
  openjdk${JAVA_VERSION} \
  git \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /minecraft/server/
RUN mkdir -p /minecraft/build-tools/

# Download BuildTools
RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar -O /minecraft/build-tools/BuildTools.jar

# Build
RUN cd /minecraft/build-tools && java -jar BuildTools.jar --rev ${MC_VERSION}

# Install
RUN mv /minecraft/build-tools/spigot-${MC_VERSION}.jar /minecraft/server/spigot.jar
RUN echo "${MC_VERSION}" > /minecraft/server/version.txt
RUN echo "eula=true" > /minecraft/server/eula.txt

WORKDIR /minecraft/server/
CMD [ "/usr/bin/java", "-Xmx8192M", "-Xms4096M", "-jar", "spigot.jar", "--noconsole" ]