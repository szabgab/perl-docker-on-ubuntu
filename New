FROM perldocker/perl-tester:5.42
RUN apt update                              && \
    apt -y upgrade                          && \
    echo done

RUN echo start                                      && \
    cpanm --notest Path::Class::Iterator            && \
    cpanm Dist::Zilla::Plugin::InlineFilesMARCEL    && \
    cpanm Test::MockTime                            && \
    cpanm Hash::Merge                               && \
    cpanm MooseX::Storage                           && \
    cpanm MooseX::Getopt                            && \
    cpanm MooseX::Storage::Format::JSONpm           && \
    cpanm MooseX::Types::Path::Class                && \
    cpanm Path::Class::Iterator                     && \
    cpanm IO::Capture::Stdout                       && \
    cpanm Text::Table                               && \
    cpanm MIME::Types                               && \
    cpanm Mail::Address                             && \
    cpanm Email::Date::Format                       && \
    cpanm HTTP::CookieJar::LWP                      && \
    cpanm REST::Client                              && \
    cpanm Config::Identity                          && \
    cpanm HTML::TreeBuilder                         && \
    echo done

# Dist::Zilla::Plugin::Homepage
# Test::Output
# Dist::Zilla::Plugin::Test::Perl::Critic

# Dist::Zilla::Plugin::Test::UnusedVars
# Test::Output
# The dependencies of Task::Test
# Test::Class ?


# Path::Class::Iterator seem to fail in docker


RUN adduser --disabled-password --gecos "" ubuntu

COPY bashrc /home/ubuntu/.bashrc
RUN chown ubuntu:ubuntu /home/ubuntu/.bashrc

WORKDIR /opt

