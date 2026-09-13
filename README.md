# homebrew-zoneminder

A Homebrew tap for [ZoneMinder](https://zoneminder.com) on macOS.

```
brew tap stevegilvarry/zoneminder
brew install --HEAD stevegilvarry/zoneminder/zoneminder
```

## Why `--HEAD`

There is no stable spec yet. The changes that make ZoneMinder build and install
on macOS are on `master` and are not in 1.38.4, so a formula pointing at the
current release would not compile. Once a release carries them the formula gets
a `url`/`sha256` pair and `--HEAD` stops being necessary.

## What the formula does and does not do

It builds ZoneMinder, installs it, and pins everything that has to outlive an
upgrade — `etc/zm`, and state under `var` — outside the versioned cellar
directory.

It does not set up a database, a web server, or the Perl modules ZoneMinder
needs but does not bundle. Those steps need decisions a formula should not make
for you, so they are printed as caveats after installing. Read them; ZoneMinder
is not usable until they are done.

`brew services` does not work for ZoneMinder. `zmpkg.pl` forks and returns, and
the launchd job therefore needs `AbandonProcessGroup` to stop launchd killing
the daemons the moment it exits — a key the services DSL cannot emit. The
formula installs a generated launchd job instead, and the caveats show how to
load it.

## Related

The macOS support this depends on is in
[ZoneMinder/zoneminder#5132](https://github.com/ZoneMinder/zoneminder/pull/5132).
Installation is documented upstream in `docs/installationguide/macos.rst`, which
covers the same ground for a from-source install without Homebrew.
