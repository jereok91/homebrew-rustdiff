cask "rustdiff-app" do
  version "0.4.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "03e14a0fa938ca42a4d1f0ab4951b5cac0f571d6503788f86dfbe807dcd9a310",
         intel: "df7ef1d532301e0413e7de382e7a542567be28bfedd9ff386eca1c9eec75782d"

  url "https://github.com/jereok91/rustdiff/releases/download/v#{version}/RustDiff-#{version}-macos-#{arch}.dmg"
  name "RustDiff"
  desc "Semantic JSON/XML/SQL diff tool with a native GTK4 desktop UI"
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
    "~/.config/rustdiff",
    "~/.local/share/rustdiff",
    "~/Library/Caches/com.digitalgex.RustDiff",
  ]
end
