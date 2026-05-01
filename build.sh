#!/usr/bin/env bash
set -euxo pipefail

STAGE=$1
PREFIX=/usr/lib/gentoo-prefix

# If this is stage 2 or 3, extract the tarball from the previous stage
if [ -f "/workspace/input.tar.gz" ]; then
	echo "Restoring previous stage state..."
	tar --xattrs --acls --absolute-names -xzf /workspace/input.tar.gz -C /
fi

# Run your bootstrap script, passing the stage argument
/workspace/bootstrap-prefix-with-root.sh "$PREFIX" "$STAGE"

# Archive the current state
echo "Archiving output..."
tar --xattrs --acls --absolute-names -czvf /workspace/output.tar.gz "$PREFIX"
