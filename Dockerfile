FROM ubuntu:20.04

VOLUME /app
WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends git make gcc g++ bison flex libplot-dev vim libreadline-dev libfl-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN GIT_SSL_NO_VERIFY=1 git clone https://github.com/9cvele3/qcl.git && \
    cd qcl/src/qc && make &&\
    cd .. && make && make install && \
    mkdir -p /qcl && cp -r lib /qcl   

CMD bash
