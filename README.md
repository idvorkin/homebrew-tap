# idvorkin/homebrew-tap

Homebrew formulas for [Kun Chen's](https://github.com/kunchenguid) CLI tools, until they ship in
[kunchenguid/homebrew-tap](https://github.com/kunchenguid/homebrew-tap).
Upstream proposals: [treehouse#211](https://github.com/kunchenguid/treehouse/pull/211),
[lavish-axi#482](https://github.com/kunchenguid/lavish-axi/pull/482),
[no-mistakes#1744](https://github.com/kunchenguid/no-mistakes/issues/1744).

| Formula       | Upstream                                                            |
| ------------- | ------------------------------------------------------------------- |
| `treehouse`   | [kunchenguid/treehouse](https://github.com/kunchenguid/treehouse)     |
| `no-mistakes` | [kunchenguid/no-mistakes](https://github.com/kunchenguid/no-mistakes) |
| `lavish-axi`  | [kunchenguid/lavish-axi](https://github.com/kunchenguid/lavish-axi)   |

## Install

```sh
brew install idvorkin/tap/treehouse idvorkin/tap/no-mistakes idvorkin/tap/lavish-axi
```

macOS and Linux, arm64 and x86_64. `treehouse` and `no-mistakes` install the upstream prebuilt
release binaries; `lavish-axi` installs the npm package against Homebrew's `node`.

## Bumping versions

[`.github/workflows/bump.yml`](.github/workflows/bump.yml) runs every 6 hours (and on demand from
the Actions tab). It runs [`scripts/bump.sh`](scripts/bump.sh), which reads the latest GitHub release
(sha256 from its `checksums.txt`) or npm version and commits any change to `main`.

To bump by hand:

```sh
scripts/bump.sh && git commit -am bump && git push
```
