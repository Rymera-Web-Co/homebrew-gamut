# Homebrew tap for Gamut

[Gamut](https://github.com/Rymera-Web-Co/Gamut) is a local git desktop app for **reviewing changes** and **browsing history**, built with Tauri 2 + React.

## Install (macOS)

```bash
brew install --cask rymera-web-co/gamut/gamut
xattr -dr com.apple.quarantine /Applications/Gamut.app
```

Gamut isn't yet signed/notarized, and Homebrew quarantines downloaded apps (Homebrew 6 removed the `--no-quarantine` opt-out). So on first launch Gatekeeper reports *"Gamut is damaged and can't be opened"* — it isn't damaged; the `xattr` command clears the quarantine flag once so it launches normally. `brew install` also prints this command as a caveat.

After the first install you can refer to the cask as just `gamut`:

```bash
brew upgrade --cask gamut
```

## Maintenance

This `Casks/gamut.rb` is published automatically by the Gamut release workflow on every tagged release. See [`homebrew/README.md`](https://github.com/Rymera-Web-Co/Gamut/blob/main/homebrew/README.md) in the main repo for details.
