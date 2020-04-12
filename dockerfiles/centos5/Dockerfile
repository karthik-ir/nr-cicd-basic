FROM mhelm/docker-centos-slave as jnlp
FROM aneundorf/centos5-build-base

ENV GO_VERSION 1.14

# Install Git
WORKDIR /tmp/src
# wget from www.kernel.org failed with an ssl error. source packages in newer distros are usually xz, which we can't unpack on centos5
RUN wget http://ftp5.gwdg.de/pub/linux/slackware/slackware-12.2/source/d/git/git-1.6.0.3.tar.bz2 && \
    tar -jxvf git-1.6.0.3.tar.bz2 && \
    cd git-1.6.0.3 && \
    ./configure --prefix=/opt/git  && \
    make -j4 && \
    make install

# Go install
RUN wget -q --no-check-certificate https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz; \
    tar -xf go$GO_VERSION.linux-amd64.tar.gz; \
    rm go$GO_VERSION.linux-amd64.tar.gz; \
    chown -R root:root ./go; \
    mv go /usr/local

ENV PATH "$PATH:/opt/git/bin:/usr/local/go/bin"

# Install jenkins agent JNLP
RUN yum install -y java-1.7.0-openjdk
COPY --from=jnlp /usr/share/jenkins/slave.jar /usr/share/jenkins/slave.jar
COPY --from=jnlp /usr/local/bin/jenkins-slave /usr/local/bin/jenkins-slave


RUN yum clean all

ENTRYPOINT ["/usr/local/bin/jenkins-slave"]



