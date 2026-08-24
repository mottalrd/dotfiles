-- Minimal nvim config for aerc compose (email replies only).
-- Kept deliberately plugin-free. NVIM_APPNAME=nvim-email keeps this
-- fully isolated from the main ~/.config/nvim setup.

vim.opt.colorcolumn = ""
vim.opt.textwidth = 0
vim.opt.formatoptions:remove("t")

-- Match the leader used in the main ~/.vim/vimrc, so muscle memory carries over.
vim.g.mapleader = ","

-- Save shortcut, ported from ~/.vim/vimrc's `noremap <Leader>s :update<CR>`.
-- :update only writes if the buffer was actually modified.
vim.keymap.set("n", "<leader>s", ":update<CR>", { silent = true, desc = "Save buffer" })

-- Copy file path, ported from the mottalrd/copypath.vim plugin used in the
-- main config (kept out of this config to stay plugin-free). Fills the
-- system clipboard (*) and the unnamed register ("), matching
-- g:copypath_copy_to_unnamed_register=1 in ~/.vim/vimrc.
local function copy_path(expr)
  local path = vim.fn.expand(expr)
  vim.fn.setreg("*", path)
  vim.fn.setreg('"', path)
end

vim.api.nvim_create_user_command("CopyPath", function()
  copy_path("%:p")
end, { desc = "Copy full file path to clipboard" })

vim.api.nvim_create_user_command("CopyRelativePath", function()
  copy_path("%")
end, { desc = "Copy relative file path to clipboard" })

-- Add email-specific macros/abbreviations/keymaps below as needed.
