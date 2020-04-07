FROM jenkins/jnlp-slave:alpine as jnlp

FROM golang:1.14-alpine

RUN apk -U add openjdk8-jre git make gcc libc-dev

COPY --from=jnlp /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-agent
COPY --from=jnlp /usr/share/jenkins/agent.jar /usr/share/jenkins/agent.jar

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
