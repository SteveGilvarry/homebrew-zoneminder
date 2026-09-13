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

  # The Perl modules ZoneMinder needs but does not bundle. Installed into the
  # keg rather than left to cpanm, because cpanm writes to the Perl formula's
  # sitelib, which resolves into its versioned cellar directory - so upgrading
  # Perl would silently delete them and the daemons would stop being able to
  # read monitor state.
  resource "Clone" do
    url "https://cpan.metacpan.org/authors/id/A/AT/ATOOMIC/Clone-0.50.tar.gz"
    sha256 "f9732a4a857974db30905233589113003301b585b0cecda29a21cfba5bb014f9"
  end

  resource "Date::Manip" do
    url "https://cpan.metacpan.org/authors/id/S/SB/SBECK/Date-Manip-7.00.tar.gz"
    sha256 "37133eeb09d36da6d461546cc216b8f6a2297a43331c680a6848f3fff925975c"
  end

  resource "DBD::MariaDB" do
    url "https://cpan.metacpan.org/authors/id/P/PA/PALI/DBD-MariaDB-1.24.tar.gz"
    sha256 "f977a25b4116a0a95a7c8a894fd37097abe19af9a6a9ed4d800604ec17873fe4"
  end

  resource "DBI" do
    url "https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/DBI-1.653.tgz"
    sha256 "a98c21fd37eed8f841172875d175d972fe87f063d7d0d2a3b7765908bb25eb58"
  end

  resource "Devel::CheckLib" do
    url "https://cpan.metacpan.org/authors/id/M/MA/MATTN/Devel-CheckLib-1.16.tar.gz"
    sha256 "869d38c258e646dcef676609f0dd7ca90f085f56cf6fd7001b019a5d5b831fca"
  end

  resource "Encode::Locale" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/Encode-Locale-1.05.tar.gz"
    sha256 "176fa02771f542a4efb1dbc2a4c928e8f4391bf4078473bd6040d8f11adb0ec1"
  end

  resource "File::Listing" do
    url "https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/File-Listing-6.16.tar.gz"
    sha256 "189b3a13fc0a1ba412b9d9ec5901e9e5e444cc746b9f0156d4399370d33655c6"
  end

  resource "HTML::Parser" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTML-Parser-3.85.tar.gz"
    sha256 "fd42ba6abe07241cf0ad57be246c3980065f683e4465e59b46af9efebc8e0c71"
  end

  resource "HTML::Tagset" do
    url "https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/HTML-Tagset-3.24.tar.gz"
    sha256 "eb89e145a608ed1f8f141a57472ee5f69e67592a432dcd2e8b1dbb445f2b230b"
  end

  resource "HTTP::Cookies" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-Cookies-6.12.tar.gz"
    sha256 "4e460c4bae76285bfc726f641349402fc9038fcd9ca0f33346bec036d73876b8"
  end

  resource "HTTP::Date" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-Date-6.08.tar.gz"
    sha256 "b57d80ca6d821c6949ca48b27467d45aba7a9c77346562306facca781a003e44"
  end

  resource "HTTP::Message" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-Message-7.04.tar.gz"
    sha256 "699f3350dbb7bd8fdc9f3b013b0c91b7c059783708443e39bc395fa33352f006"
  end

  resource "HTTP::Negotiate" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTTP-Negotiate-6.01.tar.gz"
    sha256 "1c729c1ea63100e878405cda7d66f9adfd3ed4f1d6cacaca0ee9152df728e016"
  end

  resource "IO::HTML" do
    url "https://cpan.metacpan.org/authors/id/C/CJ/CJM/IO-HTML-1.004.tar.gz"
    sha256 "c87b2df59463bbf2c39596773dfb5c03bde0f7e1051af339f963f58c1cbd8bf5"
  end

  resource "LWP" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/libwww-perl-6.83.tar.gz"
    sha256 "e75f0fa9d3c6f0daf5a5a72fa9f8b1c9c0d23e3a84a8522ccb4f835232b95505"
  end

  resource "LWP::MediaTypes" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/LWP-MediaTypes-6.05.tar.gz"
    sha256 "abb2dcfbf069317fe65b098e3b2ad58c5eb33e9a839b9190cce6d371f8966cc1"
  end

  resource "MIME::Base32" do
    url "https://cpan.metacpan.org/authors/id/R/RE/REHSACK/MIME-Base32-1.303.tar.gz"
    sha256 "ab21fa99130e33a0aff6cdb596f647e5e565d207d634ba2ef06bdbef50424e99"
  end

  resource "Net::HTTP" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/Net-HTTP-6.24.tar.gz"
    sha256 "290ed9a97b05c7935b048e6d2a356035871fca98ad72c01c5961726adf85c83c"
  end

  resource "Sys::Mmap" do
    url "https://cpan.metacpan.org/authors/id/T/TO/TODDR/Sys-Mmap-0.21.tar.gz"
    sha256 "fdec18081928b0b3ff688ec8b5d2d9bd1ffc81c2c3eb1fb3c1c56aac48a96f4c"
  end

  resource "TimeDate" do
    url "https://cpan.metacpan.org/authors/id/A/AT/ATOOMIC/TimeDate-2.35.tar.gz"
    sha256 "baddd0306ae2e86e9ec28d3de5439e514643e80b3735e43bd0fbb426d73304de"
  end

  resource "Try::Tiny" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Try-Tiny-0.32.tar.gz"
    sha256 "ef2d6cab0bad18e3ab1c4e6125cc5f695c7e459899f512451c8fa3ef83fa7fc0"
  end

  resource "URI" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/URI-5.37.tar.gz"
    sha256 "5a8750ddd8ee743d7cc89bebdd542a9b78a34023164ebe19dea0c248e121c21e"
  end

  resource "WWW::RobotRules" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/WWW-RobotRules-6.03.tar.gz"
    sha256 "8522b532935a11bfa688c2e113bac66729df4851be50c2c26d4b06f45fade472"
  end

  # ZoneMinder does not create these itself, and on Linux the distribution
  # package is what does. Nothing would otherwise, and the daemons fail on
  # first start without them.
  def install
    mysql = Formula["mysql-client"]
    perl = Formula["perl"]

    # So each resource can see the ones built before it - DBD::MariaDB needs DBI
    # at configure time. This does nothing for the installed scripts, which run
    # under -T and therefore ignore PERL5LIB; they get an explicit use lib from
    # ZM_PERL_SEARCH_PATH below.
    ENV.prepend_path "PERL5LIB", libexec/"lib/perl5"

    resources.each do |r|
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

        system perl.opt_bin/"perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", *extra
        system "make"
        system "make", "install"
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
