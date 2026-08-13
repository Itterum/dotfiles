# dotfiles

Personal terminal and editor configuration for Fedora Atomic/Niri.

## Contents

- `helix/` — editor settings and language support for JavaScript/TypeScript, Rust, Python and C#
- `ghostty/` and `alacritty/` — terminal configuration (Ghostty is preferred)
- `herdr/` — persistent terminal workspace configuration
- `zed/` — Zed settings
- `.zshrc` — Zsh/Oh My Zsh environment

The obsolete Pi Agent configuration was intentionally removed.

## Helix dependencies

Install the language tools before using the configuration:

```sh
npm install --global typescript typescript-language-server prettier
uv tool install ruff
uv tool install basedpyright
rustup component add rust-analyzer rustfmt clippy
```

Then copy the configuration:

```sh
mkdir -p ~/.config/helix ~/.config/ghostty ~/.config/herdr
cp -r helix/. ~/.config/helix/
cp -r ghostty/. ~/.config/ghostty/
cp herdr/config.toml ~/.config/herdr/config.toml
cp .zshrc ~/.zshrc
```

Use `hx --health typescript`, `hx --health rust`, and `hx --health python` to verify the language tooling.
