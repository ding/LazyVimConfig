# Neovim Config

Personal Neovim configuration built on top of `LazyVim` and `lazy.nvim`.

## Structure
- [`init.lua`](/Users/thomasd/.config/nvim/init.lua): startup entry.
- [`lua/config/lazy.lua`](/Users/thomasd/.config/nvim/lua/config/lazy.lua): bootstraps `lazy.nvim` and imports local plugins.
- [`lua/plugins`](/Users/thomasd/.config/nvim/lua/plugins): custom plugin specs and overrides.
- [`lazyvim.json`](/Users/thomasd/.config/nvim/lazyvim.json): enabled LazyVim extras.
- [`lua/config/neovide_config.lua`](/Users/thomasd/.config/nvim/lua/config/neovide_config.lua): Neovide-specific GUI settings.

## Current Behavior
- Startup currently loads `config.lazy` and `config.neovide_config`.
- `options`, `keymaps`, and `autocmds` follow the standard LazyVim starter layout and are auto-loaded by the startup chain even though `init.lua` does not require them directly.
- `lua/config/options.lua` is active in practice, including settings such as `mapleader = ","`, Python host setup, and macOS PATH adjustments.
- Treesitter is configured through [`lua/plugins/nvim-treesitter.lua`](/Users/thomasd/.config/nvim/lua/plugins/nvim-treesitter.lua).
- Theme selection is managed in [`lua/plugins/colorscheme.lua`](/Users/thomasd/.config/nvim/lua/plugins/colorscheme.lua).

## Requirements
- Neovim `>= 0.11` recommended.
- `git` is required for bootstrapping plugins.
- Optional tools such as `npx`, `fzf`, and `fd` improve plugin behavior.

## Windows Notes
- Supported in principle, but you still need the external tools used by your enabled plugins.
- Recommended base tools on Windows:
  - `git`
  - `python3` or `python`
  - `npx` for `markdown-preview.nvim`
  - `fzf` and `fd` for fuzzy finding workflows
  - `lazygit` if you want the git shortcuts exposed by `snacks.nvim`
- Clipboard integration uses `unnamedplus`. This usually works in native Windows Neovim, but may behave differently in WSL or remote terminal setups.
- GUI font settings now fall back across several candidates, but if you want consistent rendering in Neovide, install at least one suitable monospaced font such as `Maple Mono NF`, `Cascadia Mono NF`, or `Consolas`.

## Quick Checks
- Check general health:

```bash
nvim --headless "+checkhealth" +qa
```

- Check Tree-sitter specifically:

```bash
nvim --headless "+checkhealth vim.treesitter" +qa
```

- Check Python provider:

```bash
nvim --headless "+checkhealth provider" +qa
```

## Usage
Clone or link this directory to `~/.config/nvim`, then start Neovim:

```bash
nvim
```

On first launch, `lazy.nvim` will bootstrap automatically if needed.

## Development
- Format Lua files with `stylua`.
- Validate startup with:

```bash
nvim --headless "+checkhealth" +qa
```

- If plugin specs changed, also verify plugin resolution with:

```bash
nvim --headless "+Lazy! sync" +qa
```

## Notes
- The repository may contain local, uncommitted changes during active customization.
- See [`AGENTS.md`](/Users/thomasd/.config/nvim/AGENTS.md) for contributor-specific working rules.
