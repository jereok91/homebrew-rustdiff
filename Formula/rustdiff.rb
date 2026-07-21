class Rustdiff < Formula
  desc "Semantic JSON & XML diff tool with a native GTK4 desktop UI"
  homepage "https://github.com/jereok91/rustdiff"
  url "https://github.com/jereok91/rustdiff/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "38bd8efa05c11316a1318ac4081a4b28a61843d71cf0e70572a388bc7dec91df"
  license "GPL-3.0-or-later"
  head "https://github.com/jereok91/rustdiff.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "gtk4"
  depends_on "gtksourceview5"
  depends_on "libadwaita"

  on_macos do
    depends_on "librsvg" => :build
  end

  def install
    system "cargo", "install", *std_cargo_args
    (share/"applications").install "data/com.digitalgex.RustDiff.desktop"
    (share/"metainfo").install "data/com.digitalgex.RustDiff.metainfo.xml"
    (share/"icons/hicolor/scalable/apps").install "data/icons/com.digitalgex.RustDiff.svg"

    return unless OS.mac?

    # Bundle .app para Launchpad/Spotlight. El launcher apunta a opt_bin
    # (ruta estable entre versiones), así la copia en /Applications
    # sobrevive a los `brew upgrade`.
    app = prefix/"RustDiff.app"
    (app/"Contents/MacOS").mkpath
    (app/"Contents/Resources").mkpath

    (app/"Contents/MacOS/rustdiff").write <<~LAUNCHER
      #!/bin/bash
      exec "#{opt_bin}/rustdiff" "$@"
    LAUNCHER
    (app/"Contents/MacOS/rustdiff").chmod 0755

    (app/"Contents/Info.plist").write <<~PLIST
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>CFBundleName</key>
        <string>RustDiff</string>
        <key>CFBundleDisplayName</key>
        <string>RustDiff</string>
        <key>CFBundleIdentifier</key>
        <string>com.digitalgex.RustDiff</string>
        <key>CFBundleExecutable</key>
        <string>rustdiff</string>
        <key>CFBundleIconFile</key>
        <string>rustdiff</string>
        <key>CFBundlePackageType</key>
        <string>APPL</string>
        <key>CFBundleInfoDictionaryVersion</key>
        <string>6.0</string>
        <key>CFBundleShortVersionString</key>
        <string>#{version}</string>
        <key>CFBundleVersion</key>
        <string>#{version}</string>
        <key>LSApplicationCategoryType</key>
        <string>public.app-category.developer-tools</string>
        <key>NSHighResolutionCapable</key>
        <true/>
      </dict>
      </plist>
    PLIST

    # El SVG ya fue movido (install = move) a share/icons más arriba;
    # usar esa ruta, no la del árbol de fuentes.
    svg = share/"icons/hicolor/scalable/apps/com.digitalgex.RustDiff.svg"
    iconset = buildpath/"rustdiff.iconset"
    iconset.mkpath
    rsvg = Formula["librsvg"].opt_bin/"rsvg-convert"
    [16, 32, 128, 256, 512].each do |size|
      system rsvg, "-w", size.to_s, "-h", size.to_s,
             "-o", iconset/"icon_#{size}x#{size}.png", svg
      system rsvg, "-w", (size * 2).to_s, "-h", (size * 2).to_s,
             "-o", iconset/"icon_#{size}x#{size}@2x.png", svg
    end
    system "iconutil", "-c", "icns", iconset,
           "-o", app/"Contents/Resources/rustdiff.icns"
  end

  def caveats
    return unless OS.mac?

    <<~EOS
      To show RustDiff in Launchpad, copy the app bundle once:

        cp -R "#{opt_prefix}/RustDiff.app" /Applications/

      The bundle launches the brew-managed binary, so it keeps working
      after `brew upgrade` without copying it again.
    EOS
  end

  test do
    # App GTK sin flag --version y sin display en CI: se valida la instalación.
    assert_predicate bin/"rustdiff", :exist?
  end
end
