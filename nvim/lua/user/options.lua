-- Miscellaneous {{{
vim.g.python3_host_prog = "py"
vim.api.nvim_create_autocmd({'BufWinEnter'}, {
  desc = 'return cursor to where it was last time closing the file',
  pattern = '*',
  command = 'silent! normal! g`"zv',
})
-- Miscellaenous }}}

-- UTF-8 {{{
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- UTF-8 }}}

-- File handling {{{
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.cmd "filetype plugin on"
vim.cmd "filetype plugin indent on"
vim.cmd "autocmd BufNewFile,BufRead *.p8 set syntax=lua"
vim.cmd "autocmd BufNewFile,BufRead *.conf set syntax=dosini"
vim.cmd "autocmd BufNewFile,BufRead justfile set syntax=make"
vim.cmd "autocmd BufNewFile,BufRead *.vue set filetype=html"
vim.cmd "autocmd BufNewFile,BufRead *.md,*.mdx set wrap"
vim.cmd "autocmd BufNewFile,BufRead *.mdx set filetype=javascript"
vim.cmd "autocmd BufNewFile,BufRead *.ad set filetype=asciidoc"
vim.cmd "autocmd BufNewFile,BufRead *.zsh-theme set filetype=zsh"
vim.cmd "autocmd BufNewFile,BufRead *.ad,*.adoc set wrap"
vim.cmd "autocmd BufNewFile,BufRead *.ad,*.adoc set colorcolumn=55,65,76"
vim.cmd "set tags=.tags;/"
-- File handling }}}

-- Cursor {{{
vim.opt.cursorline = true
-- Cursor }}}

-- Undo {{{
vim.opt.undofile = true
-- Undo }}}

-- Text width {{{
vim.opt.wrap = false
vim.opt.colorcolumn = "120"
vim.opt.signcolumn = "yes"
-- Text width }}}

-- Line Numbers {{{
vim.opt.number = true
-- Line Numbers }}}

-- Search {{{
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shortmess:remove "S"
-- Search }}}

-- Tabs {{{
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- Tabs }}}

-- Mouse {{{
vim.opt.mouse = "a"
-- Mouse }}}

-- Scrolling {{{
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 30
vim.opt.scrolloff = 3
vim.opt.lazyredraw = true
-- Scrolling }}}

-- Movement {{{
vim.cmd "set backspace=indent,eol,start"
-- Movement }}}

-- Splits {{{
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Splits }}}

-- List chars {{{
vim.opt.listchars = { tab = "|·", nbsp = "~", trail = "·", precedes = "<", extends = ">" }
vim.opt.list = true
vim.cmd "match ErrorMsg '\\s\\+$'"
-- List chars }}}

-- Temporary files {{{
vim.opt.backupcopy = "yes"
-- Temporary files }}}

-- Status bar {{{
vim.opt.laststatus = 2
vim.opt.wildmenu = true
-- Status bar }}}

-- Folding {{{
vim.opt.foldenable = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 10
-- Folding }}}

-- Modelines {{{
vim.opt.modelines = 1
-- Modelines }}}

-- Spelling {{{
vim.opt.spell = true
vim.opt.spelllang = "en_us"
-- Spelling }}}

-- vim:foldmethod=marker:foldlevel=0
