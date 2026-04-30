#!/usr/bin/env bash
set -euxo pipefail

PREFIX=/usr/lib/gentoo-prefix
ARTIFACT="${ARTIFACT:-gentoo-prefix-rap-x86_64-$(date -u +%Y-%m-%d).tar.gz}"

/workspace/bootstrap-prefix-with-root.sh "$PREFIX" noninteractive

tar --xattrs --acls --absolute-names \
	-czvf "/workspace/${ARTIFACT}" "$PREFIX"
