cask "gamut" do
  arch arm: "aarch64", intel: "x64"

  # version is "<app-version>,<release-tag>": the .dmg filename uses the app
  # version while the release URL uses the tag, and the two are decoupled.
  version "0.5.0,v0.5.0"
  sha256 arm:   "7263f7900982e76782c4802cc6e6bca5c83b9672434b09558ba0eaf115bbdc45",
         intel: "c57555505fbe589bbf7e78ff49c5649c8233773c21177460f3e7774445fdd170"

  url "https://github.com/Rymera-Web-Co/Gamut/releases/download/#{version.csv.second}/Gamut_#{version.csv.first}_#{arch}.dmg"
  name "Gamut"
  desc "Local git desktop app for reviewing changes and browsing history"
  homepage "https://github.com/Rymera-Web-Co/Gamut"

  # No macOS minimum is declared. The app's real floor is 10.13 (High Sierra,
  # per its Info.plist), but Homebrew has dropped that symbol -- the oldest it
  # still accepts is :catalina, which would falsely gate out valid older-macOS
  # users. Modern Homebrew can't run on pre-Catalina anyway, so omitting the
  # gate is both more accurate and lower-maintenance than asserting a wrong one.

  app "Gamut.app"

  zap trash: [
    "~/Library/Application Support/com.rymera.gamut",
    "~/Library/Caches/com.rymera.gamut",
    "~/Library/Saved Application State/com.rymera.gamut.savedState",
    "~/Library/WebKit/com.rymera.gamut",
  ]

  # Gamut is not yet signed/notarized. Homebrew 6 quarantines all cask downloads
  # with no opt-out flag, so Gatekeeper blocks the first launch. We don't strip
  # quarantine for the user (that would silently bypass Gatekeeper); instead we
  # print the one-time fix. A notarized build (issue #3, Option B) removes this.
  caveats <<~CAVEATS
    Gamut is not yet signed or notarized, so on first launch macOS Gatekeeper
    reports: "Gamut is damaged and can't be opened."

    It is not damaged. Clear the quarantine flag once to run it:

      xattr -dr com.apple.quarantine /Applications/Gamut.app
  CAVEATS
end
