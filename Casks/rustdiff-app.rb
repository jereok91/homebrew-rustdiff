cask "rustdiff-app" do
  version "0.2.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "892ddb6762abdc8f8dc7d9150d5031e2ed09eebb8fb1973e17a19775fb7ca58b",
         intel: "f1fee31ea11cb3b76a75a8d9cade5b178699ac8c3f6ec550da09de1bcad8449c"

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
