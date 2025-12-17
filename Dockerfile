FROM ubuntu:25.10
RUN apt update                         && \
    apt -y upgrade                     && \
    apt install -y build-essential     && \
    apt install -y libdancer2-perl     && \
    apt install -y libtest-most-perl   && \
    apt install -y libtest2-suite-perl && \
    apt install -y wget                && \
    apt clean                          && \
    rm -rf /var/lib/apt/lists/*        && \
    wget https://cpanmin.us/           && \
#    perl index.html App::cpanminus && \
##    cpanm Dancer2 && \
    rm index.html

WORKDIR /root
