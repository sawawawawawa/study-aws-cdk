FROM adoptopenjdk/openjdk11


RUN apt-get update -y
RUN apt-get -y install curl
RUN apt-get -y install zip
RUN curl -OL https://downloads.gradle.org/distributions/gradle-8.2.1-bin.zip
RUN unzip gradle-8.2.1-bin.zip -d /usr/lib/gradle
ENV GRADLE_HOME '/usr/lib/gradle/gradle-8.2.1'
ENV PATH $GRADLE_HOME/bin:$PATH

