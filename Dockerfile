FROM perldocker/perl-tester:5.42
RUN apt update                              && \
    apt -y upgrade                          && \
    apt install -y gpg-agent                && \
    apt install -y vim                      && \
    apt install -y tree                     && \
    apt install -y less                     && \
    apt install -y libxml2-dev              && \
    echo done

# gpg-agent seems to be required by Config::Identity

RUN echo start                                      && \
    cpanm --verbose Perl::Critic::Bangs                       && \
    cpanm --verbose HTML::TreeBuilder                         && \
    cpanm --verbose WWW::Mechanize                            && \
    cpanm --verbose Test::WWW::Mechanize                      && \
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
    cpanm --verbose Log::Log4perl                             && \
    cpanm --verbose Archive::Tar::Wrapper                     && \
    cpanm --verbose DBD::Mock                                 && \
    cpanm --verbose Devel::NYTProf                            && \
    cpanm --verbose Test::WWW::Mechanize::PSGI                && \
    cpanm --verbose Test::LeakTrace                           && \
    cpanm --verbose AppConfig                                 && \
    cpanm --verbose Template                                  && \
    cpanm --verbose DateTime::Format::SQLite                  && \
    cpanm --verbose MooX::Types::MooseLike::Base              && \
    cpanm --verbose Data::Random                              && \
    cpanm --verbose Test::ClassAPI                            && \
    cpanm --verbose Test::Inline                              && \
    cpanm --verbose CHI                                       && \
    cpanm --verbose DBIx::Class                               && \
    cpanm --verbose DBIx::Class::InflateColumn::Serializer    && \
    cpanm --verbose Data::Page                                && \
    cpanm --verbose Future                                    && \
    cpanm --verbose Future::AsyncAwait                        && \
    cpanm --verbose IO::Async::Function                       && \
    cpanm --verbose IO::Async::Loop                           && \
    cpanm --verbose Metrics::Any                              && \
    cpanm --verbose SQL::Translator                           && \
    cpanm --verbose Data::Structure::Util                     && \
    cpanm --verbose MetaCPAN::Client                          && \
    cpanm --verbose Mock::Quick                               && \
    cpanm --verbose PAUSE::Permissions                        && \
    cpanm --verbose PkgConfig                                 && \
    cpanm --verbose FFI::CheckLib                             && \
    cpanm --verbose Alien::Base::Wrapper                      && \
    cpanm --verbose Alien::Build::Plugin::Download::GitLab    && \
    cpanm --verbose Alien::Libxml2                            && \
    echo Dancer                                               && \
    cpanm --verbose Data::Censor                              && \
    cpanm --verbose Template::Tiny                            && \
    cpanm --verbose File::Share                               && \
    cpanm --verbose Test::Lib                                 && \
    cpanm --verbose CLI::Osprey                               && \
    cpanm --verbose Plack::Middleware::RemoveRedundantBody      && \
    cpanm --verbose Plack::Middleware::FixMissingBodyInRedirect && \
    cpanm --verbose Dancer2                                     && \
    echo done




# Installing PkgConfig generates lots of warnings:
# Ignoring unknown extended header keyword
# https://github.com/PerlPkgConfig/perl-PkgConfig/issues/67
# To supress these warnigs one coulde set:
# export TAR_OPTIONS='--warning=no-unknown-keyword'

# We install libxml2-dev so when installing Alien::Libxml2 it won't need to compile.
# XML::LibXML

# Test::XPath
# X11::GUITest
# Fennec::Declare
# WWW::Mechanize::PhantomJS
# Test::Expect
# PPI::HTML
# HTML::Lint
# Expect
# Fennec
# Net::Telnet
# Selenium::Remote::Driver
# Test::Snapshots
# Net::Server
# Net::SSH::Perl
# Parallel::Iterator
# Expect::Simple
# TAP::Formatter::HTML
# Test::Class::Moose
# WWW::Mechanize::Firefox
# HTML::Tidy
# Test::HTML::Tidy
# HTTP::Proxy
# Net::SSH

# Test2

# Path::Class::Iterator seem to fail in docker
# cpanm --verbose --notest Path::Class::Iterator            && \

RUN adduser --disabled-password --gecos "" ubuntu

COPY bashrc /home/ubuntu/.bashrc
RUN chown ubuntu:ubuntu /home/ubuntu/.bashrc

WORKDIR /opt

