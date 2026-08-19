-- Offline / cross-platform overrides.
--
-- This config is vendored (all plugins committed) so it can be installed from
-- a GitHub ZIP on a locked-down machine with no internet access. The vendored
-- native binaries are built for macOS, so the settings below remove every
-- dependency on a platform-specific binary or on downloading one at runtime.
--
-- Install layout on the target machine:
--   repo `nvim/`  -> stdpath("config")   (Windows: %LOCALAPPDATA%\nvim)
--   repo `lazy/`  -> stdpath("data")/lazy (Windows: %LOCALAPPDATA%\nvim-data\lazy)

return {
  -- blink.cmp completion: use the pure-Lua fuzzy matcher. The default
  -- ("prefer_rust_with_warning") tries to download a prebuilt Rust binary,
  -- which fails with no internet; the vendored one is macOS-only anyway.
  {
    "saghen/blink.cmp",
    opts = {
      fuzzy = {
        implementation = "lua",
        prebuilt_binaries = { download = false },
      },
    },
  },

  -- markdown-preview: skip its build step, which downloads a per-platform
  -- browser-preview binary (fails offline / wrong OS). In-editor markdown
  -- rendering still works via render-markdown.nvim.
  {
    "iamcco/markdown-preview.nvim",
    build = false,
  },

  -- treesitter: don't auto-install parsers on the target (needs a C compiler
  -- and internet). Any parser already vendored keeps working; otherwise
  -- highlighting falls back to built-in Vim syntax.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = false,
    },
  },
}
