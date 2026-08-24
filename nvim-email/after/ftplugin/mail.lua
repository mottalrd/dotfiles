-- Neovim's built-in mail ftplugin sets textwidth=72 and adds "t" to
-- formatoptions, which would otherwise clobber the settings in init.lua
-- (ftplugins load after init.lua, when the buffer's filetype is detected).
-- after/ftplugin/ is guaranteed to load after the built-in one, so this
-- re-applies our preferences for good.

vim.opt_local.colorcolumn = ""
vim.opt_local.textwidth = 0
vim.opt_local.formatoptions:remove("t")
