#!/usr/bin/env bash
# Bump Formula/*.rb to the latest upstream release. Idempotent; prints what changed.
# Needs: gh (authenticated, or GH_TOKEN), curl, jq, perl, shasum/sha256sum.
set -euo pipefail
cd "$(dirname "$0")/.."

sha256() { if command -v sha256sum >/dev/null; then sha256sum "$1" | cut -d' ' -f1; else shasum -a 256 "$1" | cut -d' ' -f1; fi; }
current_version() { perl -ne 'if (m{releases/download/v([^/]+)/}) { print $1; exit }' "Formula/$1.rb"; }

bump_go() { # prebuilt GitHub release tarballs + checksums.txt
  local name=$1 tag version cur tmp
  tag=$(gh release view --repo "kunchenguid/$name" --json tagName -q .tagName)
  version=${tag#v}
  cur=$(current_version "$name")
  [[ "$version" == "$cur" ]] && { echo "$name: up to date ($cur)"; return; }
  tmp=$(mktemp -d)
  gh release download "$tag" --repo "kunchenguid/$name" -p checksums.txt -D "$tmp"
  perl -pi -e "s/\Q$cur\E/$version/g" "Formula/$name.rb"
  for plat in darwin-arm64 darwin-amd64 linux-arm64 linux-amd64; do
    local sha
    sha=$(awk -v f="$name-$tag-$plat.tar.gz" '$2 == f {print $1}' "$tmp/checksums.txt")
    [[ ${#sha} == 64 ]] || { echo "$name: no checksum for $plat" >&2; exit 1; }
    perl -0pi -e "s{($name-v\Q$version\E-$plat\\.tar\\.gz\"\\n\\s+sha256 \")[0-9a-f]+\"}{\${1}$sha\"}" "Formula/$name.rb"
  done
  echo "$name: $cur -> $version"
}

bump_npm() { # npm registry tarball
  local name=$1 meta version tarball cur tmp sha
  meta=$(curl -fsSL "https://registry.npmjs.org/$name/latest")
  version=$(jq -r .version <<<"$meta")
  tarball=$(jq -r .dist.tarball <<<"$meta")
  cur=$(perl -ne "print \$1 if m{/-/$name-([^/]+)\\.tgz}" "Formula/$name.rb")
  [[ "$version" == "$cur" ]] && { echo "$name: up to date ($cur)"; return; }
  tmp=$(mktemp -d)
  curl -fsSL "$tarball" -o "$tmp/pkg.tgz"
  sha=$(sha256 "$tmp/pkg.tgz")
  perl -pi -e "s{^(\\s+url \").*\"}{\${1}$tarball\"}; s{^(\\s+sha256 \")[0-9a-f]+\"}{\${1}$sha\"}" "Formula/$name.rb"
  echo "$name: $cur -> $version"
}

bump_go treehouse
bump_go no-mistakes
bump_npm lavish-axi
