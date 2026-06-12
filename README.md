# Homebrew tap for Gamut

[Gamut](https://github.com/Rymera-Web-Co/Gamut) is a local git desktop app for **reviewing changes** and **browsing history**, built with Tauri 2 + React.

## Install (macOS)

```bash
brew install --cask --no-quarantine rymera-web-co/gamut/gamut
```

The `--no-quarantine` flag is required: Gamut isn't yet signed/notarized, and Homebrew quarantines downloaded apps by default, which trips Gatekeeper's "damaged app" block on an unsigned build. The flag tells Homebrew to skip the quarantine attribute so the app launches normally.

After the first install you can refer to the cask as just `gamut`:

```bash
brew upgrade --cask gamut
```

Already installed without the flag? Clear quarantine on the installed app once:

```bash
xattr -dr com.apple.quarantine /Applications/Gamut.app
```

## Maintenance

This `Casks/gamut.rb` is published automatically by the Gamut release workflow on every tagged release. See [`homebrew/README.md`](https://github.com/Rymera-Web-Co/Gamut/blob/main/homebrew/README.md) in the main repo for details.
