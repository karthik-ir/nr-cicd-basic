FROM mhelm/docker-centos-slave as jnlp
FROM centos:5
ENV GO_VERSION 1.14
ENV GIT_VERSION 1.8.2.3

# This image extends a basic Centos 5 system by installing some packages
# needed for developmemt.

# Since Centos5 is EOL since April 2017, yum needs to check the "vault"-repositories
# (copied from https://github.com/astj/docker-centos5-vault )
COPY yum.repos.d /etc/yum.repos.d/

# Git install
RUN yum install -y wget gcc make perl tcl gettext curl-devel
RUN wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-$GIT_VERSION.tar.gz && \
    tar -xf git-$GIT_VERSION.tar.gz && \
    rm git-$GIT_VERSION.tar.gz && \
    cd git-$GIT_VERSION && \
    ./configure && \
    make && \
    make install


# Go install
RUN wget -q --no-check-certificate https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz; \
    tar -xf go$GO_VERSION.linux-amd64.tar.gz; \
    rm go$GO_VERSION.linux-amd64.tar.gz; \
    chown -R root:root ./go; \
    mv go /usr/local

ENV PATH "$PATH:/usr/local/go/bin"

# Jenkins node JNLP
RUN yum install -y java-1.7.0-openjdk
COPY --from=jnlp /usr/share/jenkins/slave.jar /usr/share/jenkins/slave.jar
COPY --from=jnlp /usr/local/bin/jenkins-slave /usr/local/bin/jenkins-slave

# Openssh install
RUN yum install -y openssh-server
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd
RUN yum install -y sudo
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
RUN yum clean all
EXPOSE 22
#ENTRYPOINT ["/usr/local/bin/jenkins-slave"]
CMD ["/usr/sbin/sshd", "-D"]