cask "rustdiff-app" do
  version "1.0.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "9d026112877d345bb5fe0f9755436f5c9c223834c462c6f70541e397e49f83e9",
         intel: "168de45fe963101b970085121c676fab999a9de473791210e3c1e445752fec98"

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
