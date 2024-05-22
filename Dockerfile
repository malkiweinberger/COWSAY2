# step 1:
ARG JENKINS_IMAGE=docker.io/jenkins/jenkins
ARG JENKINS_TAG=lts
FROM "${JENKINS_IMAGE}:${JENKINS_TAG}"
# step 2:
USER root
RUN curl -sL https://netfree.link/dl/unix-ca.sh | sh
RUN curl -fsSL https://get.docker.com | sh
# # step 3:
# RUN groupadd docker
# RUN usermod -aG docker jenkins
# # step 4:
# ARG HOST_DOCKER_GID
# RUN groupmod -g "$HOST_DOCKER_GID" docker
# # step 5:
ENV KEYSTORE=/opt/java/openjdk/lib/security/cacerts
RUN curl -sL https://netfree.link/netfree-ca.crt |  keytool -importcert -trustcacerts -alias netfree-ca-$(date "+%m%d%H%M%S")  -keystore $KEYSTORE -storepass changeit -noprompt

# keytool -importcert -trustcacerts -alias netfree-ca -file ca-certificates.crt -keystore "/opt/java/openjdk/lib/security/cacerts" -storepass changeit -noprompt
USER jenkins