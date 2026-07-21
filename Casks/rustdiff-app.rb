cask "rustdiff-app" do
  version "0.3.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "8a5843061fecf2888131843a462191091df53624fcc66fbac283c94151d193f6",
         intel: "a18b829879e6928f94a1d3d1764cef3f42a1033bfb293804540ec9450ec7c718"

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
