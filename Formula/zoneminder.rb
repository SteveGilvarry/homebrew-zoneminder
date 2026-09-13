class Zoneminder < Formula
  desc "Video surveillance and security camera system"
  homepage "https://zoneminder.com"
  license "GPL-2.0-or-later"
  head "https://github.com/ZoneMinder/zoneminder.git", branch: "master"

  # No stable spec yet. The macOS build fixes are on master and are not in
  # 1.38.4, so a formula pointing at the current release would not compile.
  # A url/sha256 pair goes here once a release carries them.

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "ffmpeg"
  depends_on "gsoap"
  depends_on "jpeg-turbo"
  depends_on "mosquitto"
  depends_on "mysql-client"
  depends_on "nlohmann-json"
  depends_on "openssl@3"
  depends_on "pcre2"
  depends_on "perl"

  # The Perl modules ZoneMinder needs but does not bundle, taken from what the
  # Debian package declares in Depends and closed over their own dependencies.
  # Installed into the keg rather than left to cpanm, because cpanm writes to
  # the Perl formula's sitelib, which resolves into its versioned cellar
  # directory - so upgrading Perl would silently delete them and the daemons
  # would stop being able to read monitor state.
  #
  # Two of Debian's are absent. Sys::CPU has been removed from CPAN entirely,
  # and only zmtelemetry.pl uses it. Cpanel::JSON::XS is no longer at the path
  # its release records, and JSON::MaybeXS falls back to core JSON::PP without
  # it.
  resource "AppConfig" do
    url "https://cpan.metacpan.org/authors/id/N/NE/NEILB/AppConfig-1.71.tar.gz"
    sha256 "1177027025ecb09ee64d9f9f255615c04db5e14f7536c344af632032eb887b0f"
  end

  resource "Archive::Zip" do
    url "https://cpan.metacpan.org/authors/id/P/PH/PHRED/Archive-Zip-1.68.tar.gz"
    sha256 "984e185d785baf6129c6e75f8eb44411745ac00bf6122fb1c8e822a3861ec650"
  end

  resource "B::Hooks::EndOfScope" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/B-Hooks-EndOfScope-0.28.tar.gz"
    sha256 "edac77a17fc36620c8324cc194ce1fad2f02e9fcbe72d08ad0b2c47f0c7fd8ef"
  end

  resource "Class::Data::Inheritable" do
    url "https://cpan.metacpan.org/authors/id/R/RS/RSHERER/Class-Data-Inheritable-0.10.tar.gz"
    sha256 "aa1ae68a611357b7bfd9a2f64907cc196ddd6d047cae64ef9d0ad099d98ae54a"
  end

  resource "Class::Inspector" do
    url "https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/Class-Inspector-1.36.tar.gz"
    sha256 "cc295d23a472687c24489d58226ead23b9fdc2588e522f0b5f0747741700694e"
  end

  resource "Class::Load" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Class-Load-0.25.tar.gz"
    sha256 "2a48fa779b5297e56156380e8b32637c6c58decb4f4a7f3c7350523e11275f8f"
  end

  resource "Class::Mix" do
    url "https://cpan.metacpan.org/authors/id/Z/ZE/ZEFRAM/Class-Mix-0.006.tar.gz"
    sha256 "8747f643893914f8c44979f1716d0c1ec8a41394796555447944e860f1ff7c0b"
  end

  resource "Class::Singleton" do
    url "https://cpan.metacpan.org/authors/id/S/SH/SHAY/Class-Singleton-1.6.tar.gz"
    sha256 "27ba13f0d9512929166bbd8c9ef95d90d630fc80f0c9a1b7458891055e9282a4"
  end

  resource "Class::Std" do
    url "https://cpan.metacpan.org/authors/id/C/CH/CHORNY/Class-Std-0.013.tar.gz"
    sha256 "bcd6d82f6c8af0fe069fced7dd165a4795b0b6e92351c7d4e5a1ab9a14fc35c6"
  end

  resource "Class::Std::Fast" do
    url "https://cpan.metacpan.org/authors/id/A/AC/ACID/Class-Std-Fast-v0.0.8.tar.gz"
    sha256 "1bd43763c6a373183097a30e787f5d6713b0db27511c52d533266b59d2cfa780"
  end

  resource "Clone::PP" do
    url "https://cpan.metacpan.org/authors/id/N/NE/NEILB/Clone-PP-1.08.tar.gz"
    sha256 "57203094a5d8574b6a00951e8f2399b666f4e74f9511d9c9fb5b453d5d11f578"
  end

  resource "Crypt::Eksblowfish" do
    url "https://cpan.metacpan.org/authors/id/Z/ZE/ZEFRAM/Crypt-Eksblowfish-0.009.tar.gz"
    sha256 "3cc7126d5841107237a9be2dc5c7fbc167cf3c4b4ce34678a8448b850757014c"
  end

  resource "Crypt::Rijndael" do
    url "https://cpan.metacpan.org/authors/id/L/LE/LEONT/Crypt-Rijndael-1.16.tar.gz"
    sha256 "6540085e3804b82a6f0752c1122cf78cadd221990136dd6fd4c097d056c84d40"
  end

  resource "Crypt::URandom" do
    url "https://cpan.metacpan.org/authors/id/D/DD/DDICK/Crypt-URandom-0.55.tar.gz"
    sha256 "ef9f44141073c13573e85b148ff9a9089c45825b7d6608d832e4263899d3a2d4"
  end

  resource "Data::Dump" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GARU/Data-Dump-1.25.tar.gz"
    sha256 "a4aa6e0ddbf39d5ad49bddfe0f89d9da864e3bc00f627125d1bc580472f53fbd"
  end

  resource "Data::Entropy" do
    url "https://cpan.metacpan.org/authors/id/R/RR/RRWO/Data-Entropy-0.010.tar.gz"
    sha256 "d0cf2cdb028202e89dc362b8d90b70d345850293b01900d9a1882a0c6f20f837"
  end

  resource "Data::Float" do
    url "https://cpan.metacpan.org/authors/id/R/RR/RRWO/Data-Float-0.015.tar.gz"
    sha256 "8a6cb97aea2f5cfa4fad85d8c39c0ff27822a598626aba4e7f456e0f6d1ff30a"
  end

  resource "Data::OptList" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Data-OptList-0.115.tar.gz"
    sha256 "fa0e7cdc10925db925a82f8eb9608a701f1c2bf5e88d512d9acd46977e174056"
  end

  resource "Data::UUID" do
    url "https://cpan.metacpan.org/authors/id/G/GT/GTERMARS/Data-UUID-1.227.tar.gz"
    sha256 "95bda7276265f57bc48ffdeddec5ef28cd6f765e3a183757fa5f09f0ce6b98ac"
  end

  resource "DateTime" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/DateTime-1.67.tar.gz"
    sha256 "ba237fe792c93e8c13879c58fead45de2d1185e53793b792db1a3c9e77dd7b55"
  end

  resource "DateTime::Locale" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/DateTime-Locale-1.46.tar.gz"
    sha256 "fda10fd3ee85f9ce73f46e4ccfe764243978c3ac377e3097597058101b935d9f"
  end

  resource "DateTime::TimeZone" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/DateTime-TimeZone-2.69.tar.gz"
    sha256 "a8e285cd14bc7f40daae8028bc912e1d0c53bb9ac464659ad64a36cc5e2bf35f"
  end

  resource "Devel::Deprecate" do
    url "https://cpan.metacpan.org/authors/id/O/OV/OVID/Devel-Deprecate-0.01.tar.gz"
    sha256 "c502c41a82fe254e97151277cad3a4f0a407ad3c9d3f623d277b0303a3e1a12f"
  end

  resource "Devel::StackTrace" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/Devel-StackTrace-2.05.tar.gz"
    sha256 "63cb6196e986a7e578c4d28b3c780e7194835bfc78b68eeb8f00599d4444888c"
  end

  resource "Device::SerialPort" do
    url "https://cpan.metacpan.org/authors/id/C/CO/COOK/Device-SerialPort-1.04.tar.gz"
    sha256 "d392567cb39b4ea606c0e0acafd8ed72320311b995336ece5fcefcf9b150e9d7"
  end

  resource "Dist::CheckConflicts" do
    url "https://cpan.metacpan.org/authors/id/D/DO/DOY/Dist-CheckConflicts-0.11.tar.gz"
    sha256 "ea844b9686c94d666d9d444321d764490b2cde2f985c4165b4c2c77665caedc4"
  end

  resource "Email::Date::Format" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-Date-Format-1.008.tar.gz"
    sha256 "432b7c83ff88749af128003f5257c573aec1a463418db90ed22843cbbc258b4f"
  end

  resource "Eval::Closure" do
    url "https://cpan.metacpan.org/authors/id/D/DO/DOY/Eval-Closure-0.14.tar.gz"
    sha256 "ea0944f2f5ec98d895bef6d503e6e4a376fea6383a6bc64c7670d46ff2218cad"
  end

  resource "Exception::Class" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/Exception-Class-1.45.tar.gz"
    sha256 "5482a77ef027ca1f9f39e1f48c558356e954936fc8fbbdee6c811c512701b249"
  end

  resource "Expect" do
    url "https://cpan.metacpan.org/authors/id/J/JA/JACOBY/Expect-1.38.tar.gz"
    sha256 "7b1048335f327958903867cea079dc072ea07f4eafae1b40c2e6f25db21686c0"
  end

  resource "File::ShareDir" do
    url "https://cpan.metacpan.org/authors/id/R/RE/REHSACK/File-ShareDir-1.118.tar.gz"
    sha256 "3bb2a20ba35df958dc0a4f2306fc05d903d8b8c4de3c8beefce17739d281c958"
  end

  resource "File::ShareDir::Install" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/File-ShareDir-Install-0.14.tar.gz"
    sha256 "8f9533b198f2d4a9a5288cbc7d224f7679ad05a7a8573745599789428bc5aea0"
  end

  resource "File::Slurp" do
    url "https://cpan.metacpan.org/authors/id/C/CA/CAPOEIRAB/File-Slurp-9999.32.tar.gz"
    sha256 "4c3c21992a9d42be3a79dd74a3c83d27d38057269d65509a2f555ea0fb2bc5b0"
  end

  resource "IO::Interface" do
    url "https://cpan.metacpan.org/authors/id/L/LD/LDS/IO-Interface-1.09.tar.gz"
    sha256 "e63e81c52eb1e0e60ec2d983f5552d2493e117179925c96757f23c4bd9fa713a"
  end

  resource "IO::Socket::Multicast" do
    url "https://cpan.metacpan.org/authors/id/B/BR/BRAMBLE/IO-Socket-Multicast-1.12.tar.gz"
    sha256 "70e8af4aa21d19bab5edd9f43a6b3d6277748a65145d46ff0ea2ae4c59495c72"
  end

  resource "IO::Tty" do
    url "https://cpan.metacpan.org/authors/id/T/TO/TODDR/IO-Tty-1.31.tar.gz"
    sha256 "d597af221628571cbecf35b44520148c44798dfc8a9867774e60453f79d25ff7"
  end

  resource "JSON::MaybeXS" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/JSON-MaybeXS-1.004008.tar.gz"
    sha256 "cd3937afa78831f80a2ad5abab6c51b9e82fca4c31e5856ea208d598db5dc867"
  end

  resource "MailTools" do
    url "https://cpan.metacpan.org/authors/id/M/MA/MARKOV/MailTools-2.22.tar.gz"
    sha256 "3bf68bb212298fa699a52749dddff35583a74f36a92ca89c843b854f29d87c77"
  end

  resource "MIME::Lite" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/MIME-Lite-3.038.tar.gz"
    sha256 "06eb47db74d594d2256cf4794f2c259e9f3f54b9f61b900544e6e1d879e244f5"
  end

  resource "MIME::Tools" do
    url "https://cpan.metacpan.org/authors/id/D/DS/DSKOLL/MIME-tools-5.518.tar.gz"
    sha256 "4c1dd6316c13df6f897bd33ec82b13e2228cb80a420a264d320aead21acd123e"
  end

  resource "Module::Build" do
    url "https://cpan.metacpan.org/authors/id/L/LE/LEONT/Module-Build-0.4234.tar.gz"
    sha256 "66aeac6127418be5e471ead3744648c766bd01482825c5b66652675f2bc86a8f"
  end

  resource "Module::Implementation" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/Module-Implementation-0.09.tar.gz"
    sha256 "c15f1a12f0c2130c9efff3c2e1afe5887b08ccd033bd132186d1e7d5087fd66d"
  end

  resource "Module::Runtime" do
    url "https://cpan.metacpan.org/authors/id/H/HA/HAARG/Module-Runtime-0.018.tar.gz"
    sha256 "0bf77ef68e53721914ff554eada20973596310b4e2cf1401fc958601807de577"
  end

  resource "MRO::Compat" do
    url "https://cpan.metacpan.org/authors/id/H/HA/HAARG/MRO-Compat-0.15.tar.gz"
    sha256 "0d4535f88e43babd84ab604866215fc4d04398bd4db7b21852d4a31b1c15ef61"
  end

  resource "namespace::autoclean" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/namespace-autoclean-0.31.tar.gz"
    sha256 "d3b32c82e1d2caa9d58b8c8075965240e6cab66ab9350bd6f6bea4ca07e938d6"
  end

  resource "namespace::clean" do
    url "https://cpan.metacpan.org/authors/id/R/RI/RIBASUSHI/namespace-clean-0.27.tar.gz"
    sha256 "8a10a83c3e183dc78f9e7b7aa4d09b47c11fb4e7d3a33b9a12912fd22e31af9d"
  end

  resource "Net::SFTP::Foreign" do
    url "https://cpan.metacpan.org/authors/id/S/SA/SALVA/Net-SFTP-Foreign-1.93.tar.gz"
    sha256 "6c7d64250876873da434800e5060a8bef7a46451d81f817e37e43cfda51a0f7a"
  end

  resource "Number::Bytes::Human" do
    url "https://cpan.metacpan.org/authors/id/F/FE/FERREIRA/Number-Bytes-Human-0.11.tar.gz"
    sha256 "5fc79c49b0b40df780479c43696381343e2b6ad1fe52859f60bc65b66ebe6f2c"
  end

  resource "Package::Stash" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Package-Stash-0.40.tar.gz"
    sha256 "5a9722c6d9cb29ee133e5f7b08a5362762a0b5633ff5170642a5b0686e95e066"
  end

  resource "Package::Stash::XS" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Package-Stash-XS-0.30.tar.gz"
    sha256 "26bad65c1959c57379b3e139dc776fbec5f702906617ef27cdc293ddf1239231"
  end

  resource "Params::Classify" do
    url "https://cpan.metacpan.org/authors/id/Z/ZE/ZEFRAM/Params-Classify-0.015.tar.gz"
    sha256 "398ec15cd899fcd8bef3db9ea1748bf631f15f6c32be203e475b67df510a5914"
  end

  resource "Params::SomeUtil" do
    url "https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/Params-SomeUtil-1.11.tar.gz"
    sha256 "ad171c7c579e332d067089fa5cb11e3b2c9a6bddf41050d57274577e7bcc976a"
  end

  resource "Params::ValidationCompiler" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/Params-ValidationCompiler-0.31.tar.gz"
    sha256 "7b6497173f1b6adb29f5d51d8cf9ec36d2f1219412b4b2410e9d77a901e84a6d"
  end

  resource "PHP::Serialization" do
    url "https://cpan.metacpan.org/authors/id/B/BO/BOBTFISH/PHP-Serialization-0.34.tar.gz"
    sha256 "b912d426e9aeba5491a5e502e7c5c039c5daa575428ac9bdc82afff39ec6f07a"
  end

  resource "Role::Tiny" do
    url "https://cpan.metacpan.org/authors/id/H/HA/HAARG/Role-Tiny-2.002005.tar.gz"
    sha256 "4618ec524618c104dc28a8cc86af129a00cad282aea7f4c75060ba05d4c8f4d7"
  end

  resource "SOAP::WSDL" do
    url "https://cpan.metacpan.org/authors/id/S/SW/SWALTERS/SOAP-WSDL-3.004.tar.gz"
    sha256 "e2cc1e42eace8dbb384e509d04644191afcdd8df0fec144376cebafad3f15744"
  end

  resource "Specio" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/Specio-0.53.tar.gz"
    sha256 "0d0eecfb9e89bd0f5f710fac42e1200a882d513a862f98497eaef5927ac6c183"
  end

  resource "Sub::Exporter::Progressive" do
    url "https://cpan.metacpan.org/authors/id/F/FR/FREW/Sub-Exporter-Progressive-0.001013.tar.gz"
    sha256 "d535b7954d64da1ac1305b1fadf98202769e3599376854b2ced90c382beac056"
  end

  resource "Sub::Install" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Sub-Install-0.929.tar.gz"
    sha256 "80b1e281d8cd3b2b31dac711f5c8a1657a87cd80bbe69af3924bcbeb4e5db077"
  end

  resource "Sub::Override" do
    url "https://cpan.metacpan.org/authors/id/M/MV/MVSJES/Sub-Override-0.12.tar.gz"
    sha256 "d922dc6ef0e51f6385e111310845c3393be6b7a4d4ebda2a9e47c05bf62f79e3"
  end

  resource "Sub::Quote" do
    url "https://cpan.metacpan.org/authors/id/H/HA/HAARG/Sub-Quote-2.006009.tar.gz"
    sha256 "967282d54d2d51b198c67935594f93e4dea3e54d1e5bced158c94e29be868a4b"
  end

  resource "Sys::MemInfo" do
    url "https://cpan.metacpan.org/authors/id/S/SC/SCRESTO/Sys-MemInfo-0.99.tar.gz"
    sha256 "0786319d3a3a8bae5d727939244bf17e140b714f52734d5e9f627203e4cf3e3b"
  end

  resource "Template" do
    url "https://cpan.metacpan.org/authors/id/T/TO/TODDR/Template-Toolkit-3.106.tar.gz"
    sha256 "c7474050be80201f1fb55f0a569b9c0ab6c1c3f0cebbd7e601bda9b4046eec85"
  end

  resource "Term::ReadKey" do
    url "https://cpan.metacpan.org/authors/id/J/JS/JSTOWE/TermReadKey-2.38.tar.gz"
    sha256 "5a645878dc570ac33661581fbb090ff24ebce17d43ea53fd22e105a856a47290"
  end

  resource "Test::Deep" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Test-Deep-1.205.tar.gz"
    sha256 "42781e9943a7a215e662c4973b9feafdc019fd16469bdb849a8537ee58956273"
  end

  resource "Test::Fatal" do
    url "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Test-Fatal-0.018.tar.gz"
    sha256 "b8d2cccf9ee467271bc478f9cf7eba49545452be9302ae359bc538b8bf687cd6"
  end

  resource "Variable::Magic" do
    url "https://cpan.metacpan.org/authors/id/V/VP/VPIT/Variable-Magic-0.65.tar.gz"
    sha256 "457bfb1b2369e44c0e2ef3e7b61580831107cbeebf0f5d8c4b9b02368550b91e"
  end

  resource "XML::Parser" do
    url "https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.59.tar.gz"
    sha256 "a358fd7c49f5e27717a644a9102bd21dc7fc25a415983279c59b1580e2b62a58"
  end

  resource "XString" do
    url "https://cpan.metacpan.org/authors/id/A/AT/ATOOMIC/XString-0.005.tar.gz"
    sha256 "f247f55c19aee6ba4a1ae73c0804259452e02ea85a9be07f8acf700a5138f884"
  end

  def install
    mysql = Formula["mysql-client"]
    perl = Formula["perl"]

    # So each resource can see the ones built before it - DBD::MariaDB needs DBI
    # at configure time. This does nothing for the installed scripts, which run
    # under -T and therefore ignore PERL5LIB; they get an explicit use lib from
    # ZM_PERL_SEARCH_PATH below.
    ENV.prepend_path "PERL5LIB", libexec/"lib/perl5"

    # Module::Build left core in 5.22 and several of these ship only a Build.PL,
    # so it has to be in place before the rest are built. Its own Build.PL
    # bootstraps from the copy in the tarball.
    ordered = resources.partition { |r| r.name == "Module::Build" }.flatten

    ordered.each do |r|
      r.stage do
        # DBD::MariaDB asks mysql_config for link flags and is handed
        # -lzstd -lssl -lcrypto, but a Homebrew Perl carries no -L for the
        # Homebrew prefix, so its configure step fails with "Can't link/include
        # C library 'zstd', 'ssl', 'crypto', aborting".
        # Each of these is one argument. %W would split them on whitespace and
        # Makefile.PL would report "Unknown option: lmysqlclient".
        extra = if r.name == "DBD::MariaDB"
          [
            "--libs=-L#{mysql.opt_lib} -L#{HOMEBREW_PREFIX}/lib -lmysqlclient " \
            "-lz -lzstd -lssl -lcrypto -lresolv",
            "--cflags=-I#{mysql.opt_include}/mysql",
          ]
        else
          []
        end

        # Most of these are ExtUtils::MakeMaker, a few are Module::Build.
        if (Pathname.pwd/"Makefile.PL").exist?
          system perl.opt_bin/"perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", *extra
          system "make"
          system "make", "install"
        else
          system perl.opt_bin/"perl", "Build.PL", "--install_base", libexec, *extra
          system "./Build"
          system "./Build", "install"
        end
      end
    end

    # Everything that outlives an upgrade is pinned outside the cellar. The
    # build's own macOS defaults derive from the install prefix, which here is a
    # versioned cellar directory, so config and state would be thrown away on
    # every upgrade if they were left alone.
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DBUILD_MAN=0
      -DZM_CONFIG_DIR=#{etc}/zm
      -DZM_CONFIG_SUBDIR=#{etc}/zm/conf.d
      -DZM_RUNDIR=#{var}/run/zm
      -DZM_SOCKDIR=#{var}/run/zm
      -DZM_PATH_MAP=#{var}/run/zm
      -DZM_LOGDIR=#{var}/log/zm
      -DZM_CACHEDIR=#{var}/cache/zoneminder
      -DZM_TMPDIR=#{var}/cache/zoneminder/temp
      -DZM_CONTENTDIR=#{var}/lib/zoneminder
      -DZM_DIR_EVENTS=#{var}/lib/zoneminder/events
      -DPERL_EXECUTABLE=#{formula_opt_bin("perl")}/perl
      -DZM_PERL_INSTALL_PATH=#{libexec}/lib/perl5
      -DZM_PERL_SEARCH_PATH=#{opt_libexec}/lib/perl5
      -DOPENSSL_ROOT_DIR=#{formula_opt_prefix("openssl@3")}
      -DCMAKE_PREFIX_PATH=#{mysql.opt_prefix};#{HOMEBREW_PREFIX}
      -DCMAKE_C_FLAGS=-I#{mysql.opt_include}
      -DCMAKE_CXX_FLAGS=-I#{mysql.opt_include}
    ]

    # mysql-client is keg-only, so its headers are not on the default include
    # path and the bare find_library call in CMakeLists.txt misses them. Without
    # the flags above the build stops at "'mysql/mysql.h' file not found".

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    # The launchd job and the sample web server configuration, both generated by
    # the build with these paths already substituted, and both guidance rather
    # than something to drop in unread. Loading the job is the admin's decision:
    # /Library/LaunchDaemons is read at boot.
    #
    # Deliberately under pkgshare and not at the root of the keg. A .plist there
    # sets Keg#plist_installed?, which makes brew advertise "brew services start"
    # even for a formula with no service block - and that command would do
    # nothing, because there is no command for it to run.
    (pkgshare/"misc").install \
      (buildpath/"build/misc/com.zoneminder.zoneminder.plist"),
      (buildpath/"build/misc/apache.conf"),
      (buildpath/"build/misc/nginx.conf")
  end

  post_install_steps do
    mkdir_p "run/zm", base: :var
    mkdir_p "log/zm", base: :var
    mkdir_p "cache/zoneminder/temp", base: :var
    mkdir_p "lib/zoneminder/events", base: :var
  end

  def caveats
    <<~EOS
      The Perl modules ZoneMinder needs are installed with it. Two things are
      still left, and neither can safely be done for you.

      1. A database:

           brew services start mariadb
           mysql -u root < #{pkgshare}/db/zm_create.sql
           mysql -u root -e "CREATE USER IF NOT EXISTS 'zmuser'@localhost IDENTIFIED BY 'zmpass';"
           mysql -u root -e "GRANT LOCK TABLES, ALTER, SELECT, INSERT, UPDATE, DELETE, CREATE, INDEX ON zm.* TO 'zmuser'@localhost;"
           zmupdate.pl --nointeractive

         Change those credentials here and in #{etc}/zm/zm.conf before putting
         this anywhere reachable.

      2. A web server. Samples for Apache and nginx, with your paths already
         filled in, are at #{pkgshare}/misc.

      Then start it:

           zmpkg.pl start

      `brew services` cannot run ZoneMinder. zmpkg.pl forks and returns, so the
      launchd job needs AbandonProcessGroup or launchd kills the daemons the
      moment it exits, and the services DSL has no way to emit that key. To
      start at boot, load the generated job directly:

           sudo install -o root -g wheel -m 644 \\
             #{pkgshare}/misc/com.zoneminder.zoneminder.plist /Library/LaunchDaemons/
           sudo launchctl load -w /Library/LaunchDaemons/com.zoneminder.zoneminder.plist

      Unloading does not stop ZoneMinder; run `zmpkg.pl stop` first.
    EOS
  end

  test do
    # zmc prints the bare version and nothing else. Not zmu --version, which is
    # the Video4Linux API version to query with, and which prints the usage
    # screen and exits 0 whatever you give it.
    assert_match(/^\d+\.\d+\.\d+/, shell_output("#{bin}/zmc --version"))

    # Perl modules went where ZM_PERL_INSTALL_PATH put them rather than into
    # the Perl keg, which is the part most likely to drift on an upgrade.
    assert_path_exists libexec/"lib/perl5/ZoneMinder.pm"

    # The paths that have to outlive an upgrade really are outside the cellar.
    assert_path_exists etc/"zm/zm.conf"
    refute_match prefix.to_s, (etc/"zm/conf.d/01-system-paths.conf").read
  end
end
