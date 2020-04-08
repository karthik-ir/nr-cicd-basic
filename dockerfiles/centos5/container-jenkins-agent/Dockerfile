FROM jenkins/jnlp-slave:alpine

USER root
RUN apk --no-cache add --update git

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
