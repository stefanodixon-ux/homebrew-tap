# Homebrew tap for SofaDeck

Cask: `Casks/sofadeck.rb` (SofaDeck 1.0.1, universal DMG, notarized, macOS 11 Big Sur or later —
matches `LSMinimumSystemVersion` / `MACOSX_DEPLOYMENT_TARGET=11.0` in `build/`).

## Publish the personal tap (Mac, `gh` signed in as stefanodixon-ux)

```sh
gh repo create stefanodixon-ux/homebrew-tap --public \
  --description "Homebrew tap for Dixon App Studio apps"
git clone https://github.com/stefanodixon-ux/homebrew-tap.git /tmp/homebrew-tap
mkdir -p /tmp/homebrew-tap/Casks
cp store/homebrew/Casks/sofadeck.rb /tmp/homebrew-tap/Casks/
cd /tmp/homebrew-tap && git add Casks/sofadeck.rb && git commit -m "sofadeck 1.0.1" && git push -u origin HEAD:main
```

The repo must be named `homebrew-tap` (Homebrew strips the `homebrew-` prefix).

## Check it (Mac)

```sh
brew tap stefanodixon-ux/tap
brew style --cask stefanodixon-ux/tap/sofadeck
brew audit --cask --new stefanodixon-ux/tap/sofadeck
brew install --cask stefanodixon-ux/tap/sofadeck
brew livecheck --cask stefanodixon-ux/tap/sofadeck   # should print 1.0.1
```

## Users install with

```sh
brew install stefanodixon-ux/tap/sofadeck
```

## New version

Bump `version` and `sha256` (from https://www.sofadeck.com/download/SHA256SUMS, the `-mac.dmg` line),
commit to `homebrew-tap` main. `uninstall launchctl:` removes the Open-at-login LaunchAgent
(`com.dixonappstudio.sofadeck`); `zap` also deletes data, logs and the LaunchAgent plist.

Official homebrew/cask later: needs notability (roughly 30 forks / 30 watchers / 75 stars on a GitHub
repo, or equivalent) — the personal tap has no such requirement.
