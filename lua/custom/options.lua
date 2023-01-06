-- [[ Setting options ]]
-- See `:help vim.o`

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Decrease update time
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.opt.guicursor = ''

vim.opt.number = false
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath 'cache' .. '/undodir'
vim.opt.undofile = true
vim.opt.shada = "!,%,'100,<50,s10,h"

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 250

vim.opt.colorcolumn = '132'

vim.opt.autowrite = true
vim.opt.list = true
vim.opt.listchars['tab'] = '⇥ '
vim.opt.listchars['trail'] = '⋯'
vim.opt.listchars['nbsp'] = '⬸'
vim.opt.listchars['extends'] = '↵'

vim.opt.matchpairs['<'] = '>'
vim.opt.matchpairs['«'] = '»'
vim.opt.matchpairs['≪'] = '≫'
vim.opt.matchpairs['｢'] = '｣'


