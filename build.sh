#!/usr/bin/env bash
set -euxo pipefail

PREFIX=/usr/lib/gentoo-prefix
ARTIFACT="${ARTIFACT:-gentoo-prefix-rap-x86_64-$(date -u +%Y-%m-%d).tar.gz}"

/workspace/bootstrap-prefix-with-root.sh "$PREFIX" stage1

tar --xattrs --acls --absolute-names \
	-czvf "/workspace/${ARTIFACT}" "$PREFIX"
