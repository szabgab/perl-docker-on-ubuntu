FROM perldocker/perl-tester:5.42
#RUN apt update                              && \
#    apt -y upgrade                          && \
#    echo done

RUN echo start                                      && \
    cpanm Dist::Zilla::Plugin::Test::UnusedVars     && \
    cpanm Test::MockObject                          && \
    cpanm Dist::Zilla::Plugin::Bugtracker           && \
    cpanm Dist::Zilla::Plugin::InlineFilesMARCEL    && \
    cpanm Test::MockTime                            && \
    cpanm Test::Class                               && \
    cpanm Test::Memory::Cycle                       && \
    cpanm Test::Distribution                        && \
    cpanm Test::Script                              && \
    cpanm Task::Test                                && \
    cpanm Hash::Merge                               && \
    cpanm MooseX::Storage                           && \
    cpanm MooseX::Getopt                            && \
    echo done

# Path::Class::Iterator seem to fail in docker
# cpanm --notest Path::Class::Iterator            && \
# cpanm MooseX::Storage::Format::JSONpm           && \
# cpanm MooseX::Types::Path::Class                && \
# cpanm IO::Capture::Stdout                       && \
# cpanm Text::Table                               && \
# cpanm MIME::Types                               && \
# cpanm Mail::Address                             && \
# cpanm Email::Date::Format                       && \
# cpanm HTTP::CookieJar::LWP                      && \
# cpanm REST::Client                              && \
# cpanm Config::Identity                          && \
# cpanm HTML::TreeBuilder                         && \

RUN adduser --disabled-password --gecos "" ubuntu

COPY bashrc /home/ubuntu/.bashrc
RUN chown ubuntu:ubuntu /home/ubuntu/.bashrc

WORKDIR /opt

