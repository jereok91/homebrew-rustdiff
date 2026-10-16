cask "rustdiff-app" do
  version "1.0.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "1a02c681d593978097fdaa2c292780658f55c492f432889547b5ba805a452ce5",
         intel: "4ac013d2f799f24e5fdca53f9504b886665f7ceef648843a7ffe95e967730ca3"

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
