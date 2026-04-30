# Gentoo RAP Prefix Builder

Daily-built Gentoo RAP (Reference Application Prefix) tarball for x86_64,
ready to be extracted at `/usr/lib/gentoo-prefix` and used system-wide.

## Usage

Download the latest release artifact, then:

```bash
sudo tar --xattrs --acls --absolute-names \
  -xzvf gentoo-prefix-rap-x86_64-YYYY-MM-DD.tar.gz -C /
/usr/lib/gentoo-prefix/startprefix
```

## Build

Triggered daily by GitHub Actions. To build locally:

```bash
podman run --rm -v "$PWD":/workspace:Z -w /workspace \
  gentoo/stage3:nomultilib-systemd \
  /workspace/build.sh
```
