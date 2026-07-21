cask "rustdiff-app" do
  version "0.3.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "b02c529bf4b9611d9fdff545b48528115d9f5d9da1ea4cc238c91d06afa7c7ca",
         intel: "1da973b3c6a568a44988e85f45c6f47d93cf99c7be92a6d5f14c195e5684a0cd"

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
