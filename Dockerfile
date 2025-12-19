FROM ubuntu:25.10
RUN apt update                              && \
    apt -y upgrade                          && \
    apt install -y build-essential          && \
    apt install -y cpanminus                && \
    apt install -y liblocal-lib-perl        && \
    apt install -y libdancer2-perl          && \
    apt install -y libtest-most-perl        && \
    apt install -y libtest2-suite-perl      && \
    apt install -y libdatetime-perl         && \
    apt install -y libtest-pod-perl         && \
    apt install -y libdist-zilla-perl       && \
    apt install -y libmoose-perl            && \
    echo done

RUN echo start                                      && \
    apt install -y perltidier                       && \
    apt install -y perltidy                         && \
    apt install -y libtask-kensho-cli-perl          && \
    apt install -y libtask-kensho-config-perl       && \
    apt install -y libtask-kensho-dates-perl        && \
    apt install -y libtask-kensho-dbdev-perl        && \
    apt install -y libtask-kensho-logging-perl      && \
    apt install -y libtask-kensho-testing-perl      && \
    apt install -y libtask-kensho-oop-perl          && \
    echo done

#    apt install -y libtask-kensho-async-perl        && \
#    apt install -y libtask-kensho-email-perl        && \
#    apt install -y libtask-kensho-excelcsv-perl     && \
#    apt install -y libtask-kensho-exceptions-perl   && \
#    apt install -y libtask-kensho-hackery-perl      && \
#    apt install -y libtask-kensho-moduledev-perl    && \
#    apt install -y libtask-kensho-perl              && \
#    apt install -y libtask-kensho-scalability-perl  && \
#    apt install -y libtask-kensho-toolchain-perl    && \
#    apt install -y libtask-kensho-webcrawling-perl  && \
#    apt install -y libtask-kensho-webdev-perl       && \
#    apt install -y libtask-kensho-xml-perl          && \
#
#    echo done

    #apt install -y libtask-kensho-all-perl     && \
#    apt clean                               && \
#    rm -rf /var/lib/apt/lists/*             && \
#    echo done

COPY bashrc /home/ubuntu/.bashrc

WORKDIR /opt
