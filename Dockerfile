FROM adoptopenjdk:16-jdk-hotspot

RUN cd /root/ && curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

RUN apt-get update && apt-get install -y git && git config --global user.name "DOCKER_USER" && git config --global user.email ""

CMD cd /root/ && java -jar /root/BuildTools.jar --rev 1.17 && cp spigot-*.jar /out/