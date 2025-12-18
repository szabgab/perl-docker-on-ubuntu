FROM ubuntu:25.10
RUN apt update                         && \
    apt -y upgrade                     && \
    apt install -y build-essential     && \
    apt install -y cpanminus           && \
    apt install -y liblocal-lib-perl   && \
    apt install -y libdancer2-perl     && \
    apt install -y libtest-most-perl   && \
    apt install -y libtest2-suite-perl && \
    apt install -y libdatetime-perl    && \
    apt install -y libtest-pod-perl    && \
    apt install -y libdist-zilla-perl  && \
    apt install -y libmoose-perl       && \
    apt install -y wget                && \
    apt clean                          && \
    rm -rf /var/lib/apt/lists/*        && \
    echo done

COPY bashrc /home/ubuntu/.bashrc

WORKDIR /opt
