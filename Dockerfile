FROM perldocker/perl-tester:5.42
RUN apt update                              && \
    apt -y upgrade                          && \
    apt install -y gpg-agent                && \
    apt install -y vim                      && \
    apt install -y tree                     && \
    apt install -y less                     && \
    apt install -y libxml2-dev              && \
    apt install -y libexpat1-dev            && \
    apt install -y pkg-config               && \
    apt install -y libgd-dev                && \
    echo done

# gpg-agent seems to be required by Config::Identity

RUN echo start                                      && \
    echo added                                                && \
    echo next                                                 && \
    cpanm --verbose Perl::Version                             && \
    cpanm --verbose System::Command                           && \
    cpanm --verbose Test::NoWarnings                          && \
    cpanm --verbose Git::Version::Compare                     && \
    cpanm --verbose Test::Requires::Git                       && \
    cpanm --verbose Git::Repository                           && \
    echo next                                                 && \
    cpanm --verbose Dist::Zilla::Plugin::NextVersion::Semantic          && \
    cpanm --verbose Dist::Zilla::Plugin::VerifyPhases                   && \
    cpanm --verbose Dist::Zilla::Plugin::CopyrightYearFromGit           && \
    cpanm --verbose Dist::Zilla::Plugin::MatchManifest                  && \
    cpanm --verbose Dist::Zilla::Plugin::Covenant                       && \
    cpanm --verbose Dist::Zilla::Plugin::Test::PAUSE::Permissions       && \
    cpanm --verbose Dist::Zilla::Plugin::CoderwallEndorse               && \
    cpanm --verbose Dist::Zilla::Plugin::ReportVersions::Tiny           && \
    cpanm --verbose Dist::Zilla::Plugin::PreviousVersion::Changelog     && \
    cpanm --verbose Dist::Zilla::Plugin::HelpWanted           && \
    cpanm --verbose Dist::Zilla::Plugin::ChangeStats::Git     && \
    cpanm --verbose Dist::Zilla::Plugin::CoalescePod          && \
    cpanm --verbose Dist::Zilla::PluginBundle::YANICK         && \
    echo Dancer                                               && \
    cpanm --verbose Data::Censor                              && \
    cpanm --verbose Template::Tiny                            && \
    cpanm --verbose File::Share                               && \
    cpanm --verbose Test::Lib                                 && \
    cpanm --verbose CLI::Osprey                               && \
    cpanm --verbose Plack::Middleware::RemoveRedundantBody      && \
    cpanm --verbose Plack::Middleware::FixMissingBodyInRedirect && \
    cpanm --verbose Dancer2                                     && \
    echo maybe                                                && \
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
    echo Perl Weekly                                          && \
    cpanm --verbose Data::ICal                                && \
    cpanm --verbose Data::Printer                             && \
    cpanm --verbose DateTime::Format::ICal                    && \
    cpanm --verbose DateTime::Format::W3CDTF                  && \
    cpanm --verbose DateTime::Functions                       && \
    cpanm --verbose Email::SendGrid::V3                       && \
    cpanm --verbose File::Serialize                           && \
    cpanm --verbose Gravatar::URL                             && \
    cpanm --verbose JSON::Path                                && \
    cpanm --verbose MIME::Lite                                && \
    cpanm --verbose PerlX::Maybe                              && \
    cpanm --verbose Plack::Middleware::DirIndex               && \
    cpanm --verbose URL::Encode                               && \
    cpanm --verbose WWW::Mailman                              && \
    cpanm --verbose WWW::Shorten::Bitly                       && \
    cpanm --verbose XML::Parser                               && \
    cpanm --verbose XML::XPath                                && \
    cpanm --verbose XML::Atom                                 && \
    cpanm --verbose XML::RSS                                  && \
    cpanm --verbose XML::Feed                                 && \
    cpanm --verbose ExtUtils::PkgConfig                       && \
    cpanm --verbose GD                                        && \
    cpanm --verbose GD::Graph                                 && \
    cpanm --verbose Math::Round                               && \
    cpanm --verbose Text::CSV                                 && \
    echo done

# pkg-config is needed by ExtUtils::PkgConfig

# libgd-dev is needed by GD

# Installing PkgConfig generates lots of warnings:
# Ignoring unknown extended header keyword
# https://github.com/PerlPkgConfig/perl-PkgConfig/issues/67
# To supress these warnigs one coulde set:
# export TAR_OPTIONS='--warning=no-unknown-keyword'

# We install libxml2-dev so when installing Alien::Libxml2 it won't need to compile.
# XML::LibXML

# We install libexpat1-dev as it is needed by XML::Parser

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

