FROM jenkins/jnlp-slave:alpine as jnlp

FROM golang:alpine

RUN apk update
RUN apk add make gcc libc-dev

COPY --from=jnlp /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-agent
COPY --from=jnlp /usr/share/jenkins/agent.jar /usr/share/jenkins/agent.jar

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]