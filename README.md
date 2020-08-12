## Why?

Because storing cross-machine config is cumbersome. Installing Git is &mdash; for the most part &mdash; easy.

# Installation

## macOS

```shell
xcode-select --install

git checkout https://github.com/nonrational/dotfiles .dotfiles
cd .dotfiles
./setup-macos.sh
osascript -e 'tell app "loginwindow" to «event aevtrrst»'
```

## GNU/Linux

```shell
# TODO
```

# Development

Since live-copies are symlinked out, just commit and push changes as necessary.

For big refactors, don't try to do it live. Clone a separate copy.
