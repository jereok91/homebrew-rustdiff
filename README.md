# homebrew-rustdiff

Homebrew tap for [RustDiff](https://github.com/jereok91/rustdiff) — semantic JSON & XML diff tool with a native GTK4 desktop UI.

## Install

Install RustDiff and add it to Launchpad with two commands:

```sh
brew install jereok91/rustdiff/rustdiff
cp -R "$(brew --prefix)/opt/rustdiff/RustDiff.app" /Applications/
```

The second command makes the app show up in Launchpad and Spotlight (macOS). It is needed only once: the bundle launches the brew-managed binary, so it keeps working after `brew upgrade` without copying it again.

## Notes

- Builds from source; requires the GTK4 stack (`gtk4`, `libadwaita`, `gtksourceview5`), installed automatically as dependencies.
- GTK4 on macOS is functional but experimental upstream.
- The formula is updated automatically by the [release workflow](https://github.com/jereok91/rustdiff/blob/main/.github/workflows/release-homebrew.yml) whenever a new `v*` tag is published.
