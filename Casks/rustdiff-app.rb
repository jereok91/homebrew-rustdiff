cask "rustdiff-app" do
  version "1.0.4"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "42b37f6e03e91759d73c6e741696945f135cd291e6b14433a69537ff65b1a38e",
         intel: "a86e335b5d11bba1d270060877ff54d26dab5d1036bf7d3de78f0abd408fc35d"

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
