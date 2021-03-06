FROM jenkins:2.46.2-alpine
MAINTAINER william.crowell@openlogic.com 

# Switch to root in order to have right permissions
# to get things done
USER root

# Prep Jenkins logging and cache directories
RUN mkdir /var/log/jenkins \
  && mkdir /var/cache/jenkins \
  && chown -R ${user}:${user} /var/log/jenkins \
  && chown -R ${user}:${user} /var/cache/jenkins

# Set Java and Jenkins Options
ENV JAVA_OPTS="-Xmx8192m -Djava.awt.headless=true -Dmail.smtp.starttls.enable=true -Duser.timezone=America/NewYork"
ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log  --webroot=/var/cache/jenkins/war"

# Install default plugins
COPY config/plugins.sh /usr/local/bin/plugins.sh
RUN chmod +x /usr/local/bin/plugins.sh
COPY config/plugins.txt /tmp/plugins.txt
RUN /usr/local/bin/plugins.sh /tmp/plugins.txt

# Jenkins log directory is a volume, so logs
# can be persisted and survive image upgrades
VOLUME /var/log/jenkins

# Switch to the jenkins user
USER ${user}
