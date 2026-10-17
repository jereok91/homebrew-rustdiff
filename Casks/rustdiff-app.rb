cask "rustdiff-app" do
  version "1.0.3"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "32aa74e61b58a96d2066bc9d15c37581f258d44c05237d11a1c1b836de7b1e91",
         intel: "75656696b0a7edc36cca0ef6a21d452ea1c7531aa4ed995d79acd93fe9245c98"

  url "https://github.com/jereok91/rustdiff/releases/download/v#{version}/RustDiff-#{version}-macos-#{arch}.dmg"
  name "RustDiff"
  desc "Semantic JSON/XML/SQL diff tool"
  homepage "https://github.com/jereok91/rustdiff"

  app "RustDiff.app"
  binary "#{appdir}/RustDiff.app/Contents/MacOS/rustdiff"

  caveats <<~CAVEATS
    RustDiff.app is ad-hoc signed (no Apple Developer certificate).
    If macOS blocks the first launch, either right-click the app and
    choose "Open", or clear the quarantine attribute with:
      xattr -cr /Applications/RustDiff.app
  CAVEATS

  zap trash: [
    "~/Library/Application Support/rustdiff",
    "~/Library/Application Support/com.digitalgex.RustDiff",
    "~/Library/Caches/com.digitalgex.RustDiff",
    "~/Library/WebKit/com.digitalgex.RustDiff",
  ]
end
