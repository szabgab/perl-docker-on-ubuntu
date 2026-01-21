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

RUN echo start                                      && \
    apt install -y libtask-kensho-async-perl        && \
    apt install -y libtask-kensho-email-perl        && \
    apt install -y libtask-kensho-excelcsv-perl     && \
    apt install -y libtask-kensho-exceptions-perl   && \
    apt install -y libtask-kensho-moduledev-perl    && \
    apt install -y libtask-kensho-toolchain-perl    && \
    echo done

RUN echo start                                      && \
    apt install -y libtask-kensho-scalability-perl  && \
    apt install -y libtask-kensho-xml-perl          && \
    apt install -y libtask-kensho-webcrawling-perl  && \
    echo done

# Modules for CPAN::digger
RUN echo start                                      && \
    apt install -y libdata-structure-util-perl      && \
    apt install -y libdatetime-format-iso8601-perl  && \
    apt install -y libmetacpan-client-perl          && \
    apt install -y libmock-quick-perl               && \
    apt install -y libtest-version-perl             && \
    echo PAUSE::Permissions is missing, adding some of its dependencies && \
    apt install -y libmime-charset-perl             && \
    apt install -y libtest-trap-perl                && \
    apt install -y libmoox-options-perl             && \
    echo done

# Dist::Zilla plugins
RUN echo start                                                        && \
    apt install -y libdist-zilla-plugin-autometaresources-perl        && \
    apt install -y libdist-zilla-plugin-bootstrap-lib-perl            && \
    apt install -y libdist-zilla-plugin-bugtracker-perl               && \
    apt install -y libdist-zilla-plugin-changelogfromgit-perl         && \
    apt install -y libdist-zilla-plugin-checkbin-perl                 && \
    apt install -y libdist-zilla-plugin-checkextratests-perl          && \
    apt install -y libdist-zilla-plugin-config-git-perl               && \
    apt install -y libdist-zilla-plugin-emailnotify-perl              && \
    apt install -y libdist-zilla-plugin-git-perl                      && \
    apt install -y libdist-zilla-plugin-githubmeta-perl               && \
    apt install -y libdist-zilla-plugin-installguide-perl             && \
    apt install -y libdist-zilla-plugin-localemsgfmt-perl             && \
    apt install -y libdist-zilla-plugin-makemaker-awesome-perl        && \
    apt install -y libdist-zilla-plugin-makemaker-fallback-perl       && \
    apt install -y libdist-zilla-plugin-metaprovides-package-perl     && \
    apt install -y libdist-zilla-plugin-metaprovides-perl             && \
    apt install -y libdist-zilla-plugin-minimumperlfast-perl          && \
    apt install -y libdist-zilla-plugin-modulebuildtiny-fallback-perl && \
    apt install -y libdist-zilla-plugin-modulebuildtiny-perl          && \
    apt install -y libdist-zilla-plugin-mojibaketests-perl            && \
    apt install -y libdist-zilla-plugin-ourpkgversion-perl            && \
    apt install -y libdist-zilla-plugin-podspellingtests-perl         && \
    apt install -y libdist-zilla-plugin-podweaver-perl                && \
    apt install -y libdist-zilla-plugin-prepender-perl                && \
    apt install -y libdist-zilla-plugin-readmefrompod-perl            && \
    apt install -y libdist-zilla-plugin-repository-perl               && \
    apt install -y libdist-zilla-plugin-requiresexternal-perl         && \
    apt install -y libdist-zilla-plugin-run-perl                      && \
    apt install -y libdist-zilla-plugin-signature-perl                && \
    apt install -y libdist-zilla-plugin-templatefiles-perl            && \
    apt install -y libdist-zilla-plugin-test-compile-perl             && \
    apt install -y libdist-zilla-plugin-test-eol-perl                 && \
    apt install -y libdist-zilla-plugin-test-kwalitee-perl            && \
    apt install -y libdist-zilla-plugin-test-notabs-perl              && \
    apt install -y libdist-zilla-plugin-test-perl-critic-perl         && \
    apt install -y libdist-zilla-plugin-test-podspelling-perl         && \
    apt install -y libdist-zilla-plugin-test-reportprereqs-perl       && \
    apt install -y libdist-zilla-plugin-twitter-perl                  && \
    apt install -y libdist-zilla-plugins-cjm-perl                     && \
    echo done

RUN echo start                                                        && \
    apt install -y libcommonmark-perl                                 && \
    apt install -y sudo                                               && \
    echo done

   #apt install -y libdigest-sha3-perl              && \
#    apt install -y libtask-kensho-webdev-perl       && \
#    apt install -y libtask-kensho-hackery-perl      && \
#    apt install -y libtask-kensho-perl              && \
#
#    echo done

    #apt install -y libtask-kensho-all-perl     && \
#    apt clean                               && \
#    rm -rf /var/lib/apt/lists/*             && \
#    echo done

USER ubuntu
RUN echo start                                      && \
    cpanm Dist::Zilla::PluginBundle::RJBS           && \
    echo done

USER root


COPY bashrc /home/ubuntu/.bashrc
RUN chown ubuntu:ubuntu /home/ubuntu/.bashrc

WORKDIR /opt
