#!/usr/bin/env sh
#
# Generate files and copy documentation from basedpython.
#
# Usage
#
#   ./scripts/autogenerate-files.sh
#
set -eu

script_root="$(realpath "$(dirname "$0")")"
project_root="$(dirname "$script_root")"
cd "$project_root"

echo "Updating lockfile..."
uv lock

echo "Copying reference documentation from basedpython..."
cp ./basedpython/crates/ty/docs/cli.md ./docs/reference/
cp ./basedpython/crates/ty/docs/configuration.md ./docs/reference/
cp ./basedpython/crates/ty/docs/rules.md ./docs/reference/
cp ./basedpython/crates/ty/docs/environment.md ./docs/reference/

echo "Documentation has been copied from basedpython submodule"
