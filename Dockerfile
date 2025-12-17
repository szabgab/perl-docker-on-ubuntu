FROM ubuntu:25.10
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y libdancer2-perl && \
    apt-get install -y wget && \
    wget https://cpanmin.us/ && \
#    perl index.html App::cpanminus && \
##    cpanm Dancer2 && \
    rm index.html

WORKDIR /root
