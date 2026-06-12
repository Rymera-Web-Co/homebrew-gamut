cask "gamut" do
  arch arm: "aarch64", intel: "x64"

  # version is "<app-version>,<release-tag>": the .dmg filename uses the app
  # version while the release URL uses the tag, and the two are decoupled.
  version "0.1.0,alpha-0.3"
  sha256 arm:   "7424d9ab5c35cecd21a7df933b89fd1e05019f6c2f86344d7b6650c4343c711e",
         intel: "d2815461a8ad071aace31f49eebe679f4a570a356901171e7d7b2f64f49d1742"

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
