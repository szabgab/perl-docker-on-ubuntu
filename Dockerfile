FROM perldocker/perl-tester:5.42
RUN apt update                              && \
    apt -y upgrade                          && \
    apt install -y gpg-agent                && \
    apt install -y vim                      && \
    echo done

# gpg-agent seems to be required by Config::Identity

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
    cpanm --verbose MooseX::Storage::Format::JSONpm           && \
    cpanm --verbose MooseX::Types::Path::Class                && \
    cpanm --verbose Text::Table                               && \
    cpanm --verbose MIME::Types                               && \
    cpanm --verbose Mail::Address                             && \
    cpanm --verbose Email::Date::Format                       && \
    cpanm --verbose HTTP::CookieJar::LWP                      && \
    cpanm --verbose REST::Client                              && \
    cpanm --verbose Config::Identity                          && \
    cpanm --verbose HTML::TreeBuilder                         && \
    cpanm --verbose Test::Taint                               && \
    cpanm --verbose Test::Strict                              && \
    cpanm --verbose Test::FailWarnings                        && \
    cpanm --verbose Log::Log4perl                             && \
    cpanm --verbose Archive::Tar::Wrapper                     && \
    cpanm --verbose Test::HTML::Lint                          && \
    cpanm --verbose Test::Mock::Simple                        && \
    cpanm --verbose DBI                                       && \
    cpanm --verbose Test::DatabaseRow                         && \
    cpanm --verbose Test::File                                && \
    echo done

# Test::XPath
# X11::GUITest
# HTTP::Daemon
# Test::WWW::Mechanize::PSGI
# Fennec::Declare
# Devel::NYTProf
# DBD::Mock
# WWW::Mechanize::PhantomJS
# Test::Expect
# PPI::HTML
# Test::Inline
# HTML::Lint
# Expect
# Fennec
# Net::Telnet
# Selenium::Remote::Driver
# Data::Random
# Browser::Open
# Template
# Test::Snapshots
# Net::Server
# Net::SSH::Perl
# Test::Compile
# Parallel::Iterator
# Test::HTML::Tidy
# Test::WWW::Mechanize
# Expect::Simple
# TAP::Formatter::HTML
# Test::Class::Moose
# Smolder
# WWW::Mechanize::Firefox
# HTML::Tidy
# HTTP::Proxy
# Net::SSH
#    cpanm --verbose Task::Test                                && \

# Path::Class::Iterator seem to fail in docker
# cpanm --verbose --notest Path::Class::Iterator            && \

RUN adduser --disabled-password --gecos "" ubuntu

COPY bashrc /home/ubuntu/.bashrc
RUN chown ubuntu:ubuntu /home/ubuntu/.bashrc

WORKDIR /opt

