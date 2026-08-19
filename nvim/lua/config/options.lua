-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Offline install: make a bundled lazygit binary discoverable without editing
-- the system PATH. Drop lazygit(.exe) in <config>/bin — e.g. on Windows
-- %LOCALAPPDATA%\nvim\bin\lazygit.exe — and Neovim adds it to its own PATH so
-- the snacks.nvim `<leader>gg` integration (which just runs `lazygit`) finds it.
do
  local bindir = vim.fn.stdpath("config") .. "/bin"
  if vim.fn.executable(bindir .. "/lazygit") == 1 or vim.fn.filereadable(bindir .. "/lazygit.exe") == 1 then
    local sep = vim.fn.has("win32") == 1 and ";" or ":"
    vim.env.PATH = bindir .. sep .. vim.env.PATH
  end
end
