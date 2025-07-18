-- Set runtimepath to include ~/.vim directories
vim.opt.runtimepath:prepend('~/.vim')
vim.opt.runtimepath:append('~/.vim/after')

-- Set packpath to match runtimepath
vim.opt.packpath = vim.opt.runtimepath:get()

-- Source your existing vimrc
vim.cmd('source ~/.vim/vimrc')

-- Add your new terminal function
vim.keymap.set('n', '<leader>nt', function()
  vim.cmd('tabnew')
  vim.fn.termopen(vim.o.shell)
end)

