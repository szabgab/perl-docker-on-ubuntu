FROM perldocker/perl-tester:5.42
#RUN apt update                              && \
#    apt -y upgrade                          && \
#    echo done

RUN echo start                                      && \
    cpanm --verbose Dist::Zilla::Plugin::Test::UnusedVars     && \
    cpanm --verbose Test::MockObject                          && \
    cpanm --verbose Dist::Zilla::Plugin::Bugtracker           && \
    cpanm --verbose Dist::Zilla::Plugin::InlineFilesMARCEL    && \
    cpanm --verbose Test::MockTime                            && \
    cpanm --verbose Test::Class                               && \
    cpanm --verbose Test::Memory::Cycle                       && \
    cpanm --verbose Test::Distribution                        && \
    cpanm --verbose Test::Script                              && \
    cpanm --verbose Hash::Merge                               && \
    cpanm --verbose MooseX::Storage                           && \
    cpanm --verbose MooseX::Getopt                            && \
    cpanm --verbose IO::Capture::Stdout                       && \
    echo done

#    cpanm --verbose Task::Test                                && \

# Path::Class::Iterator seem to fail in docker
# cpanm --verbose --notest Path::Class::Iterator            && \
# cpanm --verbose MooseX::Storage::Format::JSONpm           && \
# cpanm --verbose MooseX::Types::Path::Class                && \
# cpanm --verbose Text::Table                               && \
# cpanm --verbose MIME::Types                               && \
# cpanm --verbose Mail::Address                             && \
# cpanm --verbose Email::Date::Format                       && \
# cpanm --verbose HTTP::CookieJar::LWP                      && \
# cpanm --verbose REST::Client                              && \
# cpanm --verbose Config::Identity                          && \
# cpanm --verbose HTML::TreeBuilder                         && \

RUN adduser --disabled-password --gecos "" ubuntu

COPY bashrc /home/ubuntu/.bashrc
RUN chown ubuntu:ubuntu /home/ubuntu/.bashrc

WORKDIR /opt

