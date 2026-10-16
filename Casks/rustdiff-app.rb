cask "rustdiff-app" do
  version "1.0.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "c0e8a155bce36e0e746b5f4eba98d948c611012ffa32d6ca5b2fd51a25f22c17",
         intel: "bc0639a816bbaf9d8ea9dae8911856030c674a31dee54c0255d1ca6dd135b21b"

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
