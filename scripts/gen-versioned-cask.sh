#!/usr/bin/env bash
#
# Generate a series-pinned cask (e.g. Casks/trustwise-cli@4.7.rb) from the
# rolling cask, so users can pin to a minor series:
#
#   brew install --cask trustwiseai/tap/trustwise-cli@4.7
#
# The pinned cask is derived from Casks/trustwise-cli.rb rather than kept as a
# separate template, so future changes to the cask body (new architectures,
# artifacts, postflight steps) flow into every new pinned cask automatically.
#
# Prereleases (4.4.0.dev12 and friends) are skipped on purpose: a dev build
# must not take over the series token that stable users are pinned to.
#
# Usage: scripts/gen-versioned-cask.sh <version> <sha256>
# Prints the path of the file it wrote; prints nothing when it skips.

set -euo pipefail

VERSION="${1:?usage: $0 <version> <sha256>}"
SHA="${2:?usage: $0 <version> <sha256>}"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ROLLING="${REPO_ROOT}/Casks/trustwise-cli.rb"

if [[ ! "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Skipping pinned cask: '${VERSION}' is not a stable X.Y.Z release" >&2
  exit 0
fi

SERIES="${VERSION%.*}"
OUT="${REPO_ROOT}/Casks/trustwise-cli@${SERIES}.rb"

# awk (not sed -i) so this behaves identically on macOS and CI's Linux runner.
awk -v series="$SERIES" -v version="$VERSION" -v sha="$SHA" '
  /^cask "trustwise-cli" do$/ { print "cask \"trustwise-cli@" series "\" do"; next }
  /^  version "/              { print "  version \"" version "\""; next }
  /^    sha256 "/             { print "    sha256 \"" sha "\""; next }
  /^  postflight do$/         { print "  conflicts_with cask: \"trustwise-cli\""; print "" }
  { print }
' "$ROLLING" > "$OUT"

echo "$OUT"
