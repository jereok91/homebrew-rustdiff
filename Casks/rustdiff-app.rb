cask "rustdiff-app" do
  version "0.3.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "15cd19078a9604e53d63d5bf9a9f90b8217fe79968a75ec4dbbe249f7c88b947",
         intel: "4e78b75063297494ca1264724f2bd05996c9c644721fbdb0b176050cbcbf22f1"

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
