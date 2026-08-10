# Trustwise Homebrew Tap

Homebrew tap for the [Trustwise CLI](https://trustwise.ai) — AI red-teaming and risk classification.

> Requires an Apple Silicon Mac. The cask ships an `arm64` build only.

## Install

```sh
brew tap trustwiseai/tap
brew trust trustwiseai/tap    # Homebrew 6.0+ requires explicit trust for non-official taps
brew install --cask trustwise-cli
```

`trustwise-cli` tracks the latest release and moves forward with `brew upgrade`.

## Install a specific version

Each stable minor series also gets its own cask, so you can pin:

```sh
brew install --cask trustwise-cli@4.6
```

| Cask | Resolves to |
| --- | --- |
| `trustwise-cli` | latest release |
| `trustwise-cli@4.7` | latest 4.7.x |
| `trustwise-cli@4.6` | latest 4.6.x |
| `trustwise-cli@4.5` | latest 4.5.x |
| `trustwise-cli@4.4` | latest 4.4.x |

A pinned cask only moves within its series — `brew upgrade` will never jump
`trustwise-cli@4.6` to 4.7. This is how you pin a cask; `brew pin` works on
formulae only.

Every pinned cask declares `conflicts_with` the rolling cask, and two pinned
casks cannot coexist either, since they all install the same `trustwise`
binary. Switch versions by uninstalling first:

```sh
brew uninstall --cask trustwise-cli
brew install --cask trustwise-cli@4.6
```

To go back to tracking the latest:

```sh
brew uninstall --cask trustwise-cli@4.6
brew install --cask trustwise-cli
```

### Older versions

Only stable `X.Y.Z` releases get a pinned cask; prereleases (`4.4.0.dev12`) do
not, so a dev build never takes over a series token. To install an exact patch
release or a prerelease that predates this scheme, download it straight from
[Releases](https://github.com/trustwiseai/homebrew-tap/releases):

```sh
curl -LO https://github.com/trustwiseai/homebrew-tap/releases/download/v4.6.0/trustwise-macos-arm64.tar.gz
tar xzf trustwise-macos-arm64.tar.gz
xattr -cr trustwise    # clear quarantine, same as the cask's postflight
```

## Repository layout

| Path | Purpose |
| --- | --- |
| `Casks/trustwise-cli.rb` | rolling cask, always the latest release |
| `Casks/trustwise-cli@<major.minor>.rb` | pinned series casks, generated |
| `scripts/gen-versioned-cask.sh` | derives a pinned cask from the rolling one |
| `.github/workflows/update-cask.yml` | on release, bumps both and opens a PR |
| `.github/workflows/test-install.yml` | installs both tokens on macOS |

Pinned casks are **generated, not hand-edited**. They are derived from
`Casks/trustwise-cli.rb`, so a change to the cask body (new architecture,
artifact, or postflight step) only needs to be made in the rolling cask — it
flows into every pinned cask cut afterwards. To regenerate one by hand:

```sh
./scripts/gen-versioned-cask.sh 4.6.0 <sha256-of-macos-arm64-tarball>
```
