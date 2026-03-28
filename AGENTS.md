# AGENTS.md

## Project Overview
- This repository is a personal Neovim configuration based on `LazyVim` and `lazy.nvim`.
- Entry point is [`init.lua`](/Users/thomasd/.config/nvim/init.lua). It currently loads `config.lazy` and `config.neovide_config`.
- [`lua/config/options.lua`](/Users/thomasd/.config/nvim/lua/config/options.lua), [`lua/config/keymaps.lua`](/Users/thomasd/.config/nvim/lua/config/keymaps.lua), and [`lua/config/autocmds.lua`](/Users/thomasd/.config/nvim/lua/config/autocmds.lua) follow the LazyVim starter layout and are auto-loaded by the startup chain even though `init.lua` does not require them directly.
- Plugin specs live under [`lua/plugins`](/Users/thomasd/.config/nvim/lua/plugins). Custom plugin behavior should usually be added there instead of editing LazyVim upstream defaults directly.

## Current Layout
- [`init.lua`](/Users/thomasd/.config/nvim/init.lua): startup entry.
- [`lua/config/lazy.lua`](/Users/thomasd/.config/nvim/lua/config/lazy.lua): bootstraps `lazy.nvim` and imports `lazyvim.plugins` plus local `plugins`.
- [`lazyvim.json`](/Users/thomasd/.config/nvim/lazyvim.json): enabled LazyVim extras.
- [`lua/plugins/colorscheme.lua`](/Users/thomasd/.config/nvim/lua/plugins/colorscheme.lua): colorscheme setup and final theme selection.
- [`lua/plugins/snacks.lua`](/Users/thomasd/.config/nvim/lua/plugins/snacks.lua): `snacks.nvim` feature toggles and keymaps.
- [`lua/plugins/lualine.lua`](/Users/thomasd/.config/nvim/lua/plugins/lualine.lua) and [`lua/config/plugins/lualine-config.lua`](/Users/thomasd/.config/nvim/lua/config/plugins/lualine-config.lua): statusline setup.
- [`lua/plugins/nvim-treesitter.lua`](/Users/thomasd/.config/nvim/lua/plugins/nvim-treesitter.lua): active Treesitter plugin spec.
- [`lua/config/plugins/nvim-treesitter.lua`](/Users/thomasd/.config/nvim/lua/config/plugins/nvim-treesitter.lua): older direct setup file; currently not loaded from `init.lua`.
- [`lua/plugins/example.lua`](/Users/thomasd/.config/nvim/lua/plugins/example.lua): LazyVim sample file, effectively disabled via `if true then return {} end`.
- [`stylua.toml`](/Users/thomasd/.config/nvim/stylua.toml): formatting uses spaces, width 2, column width 120.

## Working Rules
- Preserve the LazyVim-first structure. Prefer extending or overriding via plugin specs in `lua/plugins/*.lua`.
- Do not add manual `require(...)` calls for `config.options`, `config.keymaps`, or `config.autocmds`; keep them on the standard LazyVim autoload path.
- [`lua/config/plugins/nvim-treesitter.lua`](/Users/thomasd/.config/nvim/lua/config/plugins/nvim-treesitter.lua) is different: it is currently inactive because its direct `require` line in [`init.lua`](/Users/thomasd/.config/nvim/init.lua) is commented out.
- Avoid duplicating configuration in two places. If a setting already exists in an active plugin spec, modify that source instead of the inactive legacy file.
- Keep Lua modules small and focused. New plugin definitions should usually get their own file in `lua/plugins/`.
- Follow existing Lua style in this repo: 2-space indentation, concise comments, no unnecessary abstractions.
- Keep comments and docs short. English is preferred for new comments unless the surrounding file is already predominantly Chinese or Japanese.

## Plugin-Specific Notes
- Theme selection is finalized in [`lua/plugins/colorscheme.lua`](/Users/thomasd/.config/nvim/lua/plugins/colorscheme.lua). If changing the active colorscheme, update the `set_colorscheme(...)` call there.
- Treesitter should be changed in the active plugin spec at [`lua/plugins/nvim-treesitter.lua`](/Users/thomasd/.config/nvim/lua/plugins/nvim-treesitter.lua), not the inactive direct setup file, unless the task is explicitly to revive the older path.
- `lualine` customization should stay in [`lua/config/plugins/lualine-config.lua`](/Users/thomasd/.config/nvim/lua/config/plugins/lualine-config.lua) because [`lua/plugins/lualine.lua`](/Users/thomasd/.config/nvim/lua/plugins/lualine.lua) delegates to it.
- `snacks.nvim` is loaded eagerly (`lazy = false`) and already defines several keymaps. Check for key collisions before adding more mappings.
- This config includes GUI-specific logic for Neovide in [`lua/config/neovide_config.lua`](/Users/thomasd/.config/nvim/lua/config/neovide_config.lua). GUI-only changes belong there.

## Validation
- Run `stylua` on changed Lua files when available.
- Use `nvim --headless "+Lazy! sync" +qa` only when plugin metadata or plugin specs changed and you need to verify startup/plugin resolution.
- Use `nvim --headless "+checkhealth" +qa` for broader environment checks when the change touches providers, Treesitter, clipboard, or external tooling.
- If testing startup behavior, verify against the real entry path in [`init.lua`](/Users/thomasd/.config/nvim/init.lua), not against inactive config files.

## Git And Safety
- The worktree may already contain user changes. Check `git status` before editing and do not overwrite unrelated modifications.
- Prefer additive, minimal edits. This is a personal config repo, so avoid broad refactors unless explicitly requested.
- If a task appears to require choosing between the active Treesitter path and the legacy direct-config path, call that out explicitly before making a larger structural change.
