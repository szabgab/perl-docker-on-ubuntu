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
    apt install -y libreadline-dev          && \
    echo done


# libreadline-dev is needed Term::ReadLine::Gnu which is needed to allow history in the perl debugger.

# gpg-agent seems to be required by Config::Identity

RUN echo start                                      && \
    echo added                                                && \
    cpanm --verbose Test::Most                                && \
    cpanm --verbose Dist::Zilla::Plugin::CopyrightYearFromGit           && \
    echo done

# HTML::Tidy needs tidyp.h that can be installed using the Alien::Tidyp module
RUN echo start                                      && \
    cpanm --verbose Alien::Tidyp                             && \
    cpanm --verbose HTML::Tidy                               && \
    cpanm --verbose Test::HTML::Tidy                         && \
    echo done

RUN echo start                                      && \
    echo next                                                 && \
    cpanm --verbose Term::ReadLine::Gnu                                 && \
    cpanm --verbose Dist::Zilla::Plugin::MatchManifest                  && \
    cpanm --verbose Dist::Zilla::Plugin::Covenant                       && \
    cpanm --verbose Dist::Zilla::Plugin::CoderwallEndorse               && \
    cpanm --verbose Dist::Zilla::Plugin::HelpWanted           && \
    cpanm --verbose Dist::Zilla::Plugin::ChangeStats::Git     && \
    cpanm --verbose Dist::Zilla::Plugin::CoalescePod          && \
    cpanm --verbose Dist::Zilla::PluginBundle::YANICK         && \
    cpanm --verbose PPIx::DocumentName                        && \
    cpanm --verbose Dist::Zilla::Plugin::Readme::Brief        && \
    cpanm --verbose Test::Lib                                 && \
    cpanm --verbose Test::WWW::Mechanize::PSGI                && \
    cpanm --verbose Test::LeakTrace                           && \
    cpanm --verbose Test::ClassAPI                            && \
    cpanm --verbose Test::Inline                              && \
    echo done
#    cpanm --verbose Dist::Zilla::Plugin::PreviousVersion::Changelog     && \

RUN echo start                                      && \
    echo Dancer                                               && \
    cpanm --verbose Data::Censor                              && \
    cpanm --verbose Template::Tiny                            && \
    cpanm --verbose File::Share                               && \
    cpanm --verbose CLI::Osprey                               && \
    cpanm --verbose Plack::Middleware::RemoveRedundantBody      && \
    cpanm --verbose Plack::Middleware::FixMissingBodyInRedirect && \
    cpanm --verbose Dancer2                                     && \
    echo done

RUN echo start                                                && \
    echo maybe part 1                                         && \
    cpanm --verbose System::Command                           && \
    cpanm --verbose Git::Repository                           && \
    cpanm --verbose Devel::Mutator                            && \
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
    echo done

RUN echo start                                                && \
    echo maybe part 2                                         && \
    cpanm --verbose AppConfig                                 && \
    cpanm --verbose Template                                  && \
    cpanm --verbose DateTime::Format::SQLite                  && \
    cpanm --verbose MooX::Types::MooseLike::Base              && \
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
    echo done

RUN echo start                                                && \
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
    echo done

RUN echo start                                                && \
    echo maybe part 3                                         && \
    cpanm --verbose Math::Round                               && \
    cpanm --verbose Text::CSV                                 && \
    cpanm --verbose Test::XPath                               && \
    cpanm --verbose Test::IsAny                               && \
    cpanm --verbose Test::CheckDeps                           && \
    cpanm --verbose Test::RedisServer                         && \
    cpanm --verbose Mock::Sub                                 && \
    cpanm --verbose MetaCPAN::Client                          && \
    cpanm --verbose TAP::Formatter::HTML                      && \
    cpanm --verbose Test::BDD::Cucumber                       && \
    cpanm --verbose IO::Tty                                   && \
    cpanm --verbose Expect                                    && \
    cpanm --verbose Expect::Simple                            && \
    cpanm --verbose Test::Expect                              && \
    cpanm --verbose Test::Snapshots                           && \
    cpanm --vernose Net::Telnet                               && \
    cpanm --vernose Net::FTP                                  && \
    cpanm --vernose Net::SSH                                  && \
    cpanm --verbose WebService::Validator::HTML::W3C          && \
    cpanm --verbose Test::HTTP::LocalServer                   && \
    cpanm --verbose Test::Base                                && \
    cpanm --verbose Net::Server                               && \
    cpanm --verbose Test::Simple                              && \
    cpanm --verbose Test2::AsyncSubtest                       && \
    cpanm --verbose CSS::Tiny                                 && \
    cpanm --verbose PPI::HTML                                 && \
    cpanm --verbose Mock::Config                              && \
    echo done

RUN echo start                                                && \
    echo maybe part 4                                         && \
    cpanm --verbose Parallel::Iterator                        && \
    cpanm --verbose Parallel::ForkManager                     && \
    cpanm --verbose HTTP::Proxy                               && \
    cpanm --verbose Sub::Attribute                            && \
    cpanm --verbose Test::Class::Moose                        && \
    cpanm --verbose Test2::AsyncSubtest                       && \
    cpanm --verbose --notest Path::Class::Iterator            && \
    echo done

# Path::Class::Iterator seem to fail in docker

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

# X11::GUITest
# Fennec::Declare
# WWW::Mechanize::PhantomJS
# Fennec
# Selenium::Remote::Driver
# Net::SSH::Perl
# WWW::Mechanize::Firefox
# Net::SSH
# XML::Fast
# Test2

RUN adduser --disabled-password --gecos "" ubuntu

COPY bashrc /home/ubuntu/.bashrc
RUN chown ubuntu:ubuntu /home/ubuntu/.bashrc

WORKDIR /opt

