FROM jenkins/jnlp-slave:alpine as jnlp
FROM centos:5

ENV GOVERSION 1.14

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

# Update Repos, as Centos5 is deprecated
COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
COPY libselinux.repo /etc/yum.repos.d/libselinux.repo

RUN yum update; \
    yum install -y make wget

# Go install
RUN wget -q --no-check-certificate https://storage.googleapis.com/golang/go$GOVERSION.linux-amd64.tar.gz; \
    tar -xf go$GOVERSION.linux-amd64.tar.gz; \
    rm go$GOVERSION.linux-amd64.tar.gz; \
    chown -R root:root ./go; \
    mv go /usr/local; \
    export PATH="/usr/local/go/bin:$PATH"

RUN yum clean all



