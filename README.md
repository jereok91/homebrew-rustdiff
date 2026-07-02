# homebrew-rustdiff

Homebrew tap for [RustDiff](https://github.com/jereok91/rustdiff) — semantic JSON & XML diff tool with a native GTK4 desktop UI.

## Install

```sh
brew tap jereok91/rustdiff
brew install rustdiff
```

Or in one step:

```sh
brew install jereok91/rustdiff/rustdiff
```

## Launchpad (macOS)

The formula builds a `RustDiff.app` wrapper. To make it show up in Launchpad and Spotlight, copy it once to `/Applications`:

```sh
cp -R "$(brew --prefix)/opt/rustdiff/RustDiff.app" /Applications/
```

The bundle launches the brew-managed binary, so it keeps working after `brew upgrade` without copying it again.

## Notes

- Builds from source; requires the GTK4 stack (`gtk4`, `libadwaita`, `gtksourceview5`), installed automatically as dependencies.
- GTK4 on macOS is functional but experimental upstream.
- The formula is updated automatically by the [release workflow](https://github.com/jereok91/rustdiff/blob/main/.github/workflows/release-homebrew.yml) whenever a new `v*` tag is published.
