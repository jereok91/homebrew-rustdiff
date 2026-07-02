class Rustdiff < Formula
  desc "Semantic JSON & XML diff tool with a native GTK4 desktop UI"
  homepage "https://github.com/jereok91/rustdiff"
  url "https://github.com/jereok91/rustdiff/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "89b5f5d94792de5f9e73e52bf77696dd986607e5c78a20391dc13024139c5af2"
  license "GPL-3.0-or-later"
  head "https://github.com/jereok91/rustdiff.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "gtk4"
  depends_on "gtksourceview5"
  depends_on "libadwaita"

  def install
    system "cargo", "install", *std_cargo_args
    (share/"applications").install "data/com.digitalgex.RustDiff.desktop"
    (share/"metainfo").install "data/com.digitalgex.RustDiff.metainfo.xml"
    (share/"icons/hicolor/scalable/apps").install "data/icons/com.digitalgex.RustDiff.svg"
  end

  test do
    # App GTK sin flag --version y sin display en CI: se valida la instalación.
    assert_predicate bin/"rustdiff", :exist?
  end
end
