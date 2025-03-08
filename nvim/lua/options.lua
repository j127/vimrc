vim.opt.number = true

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
-- TODO: check if these two lines are correct.
vim.opt.smartindent = false -- Disable Vim’s built-in "smart" indenting
vim.opt.indentexpr = ""  -- Only if using Treesitter for indentation

-- wrap lines
vim.opt.wrap = true
-- Show an indicator for wrapped lines
vim.opt.showbreak = "↳ "

-- allows visual block mode to move into non-character spaces (doesn't lock
-- your movement at the end of a line).
vim.opt.virtualedit = "block"

-- Shows search/replace results in a split.
vim.opt.inccommand = "split"

-- Ignores case while searching and elsewhere.
vim.opt.ignorecase = true
-- " When searching try to be smart about cases
vim.opt.smartcase = true
-- " Highlight search results
vim.opt.hlsearch = true
-- " Makes search act like search in modern browsers
vim.opt.incsearch = true

-- Theme
vim.opt.termguicolors = true

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.history = 999

-- vim.opt.wildmenu = true  -- Enables enhanced command-line completion
-- vim.opt.wildmode = "longest:full,full"  -- Improves completion cycling

vim.opt.list = true
vim.opt.listchars = {
    tab = "𒋖 ",  -- Displays a special character for tab
    trail = ".",  -- Shows trailing spaces as dots
    extends = "»",  -- Indicates text extending beyond the screen
    precedes = "«",  -- Indicates text before the start of the screen
    nbsp = "%",  -- Displays non-breaking spaces as %
}

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.keymap.set("n", "<Leader>l", function()
    vim.cmd("mark l")  -- Mark current position as 'l'
    vim.cmd("execute 'match Search /\\%'.line('.')..'l/'")  -- Highlight current line
end, { silent = true })

-- Highlight desired line limit column (97 chars)
vim.opt.colorcolumn = "97"

-- Show matching brackets when cursor is on them
vim.opt.showmatch = true

-- Time (in tenths of a second) before jumping back after a match highlight
vim.opt.matchtime = 4

-- Enable mouse support in all modes
vim.opt.mouse = "a"

local autocmd = vim.api.nvim_create_autocmd

-- Set indentation for specific file types
autocmd("FileType", {
    pattern = { "ruby", "eruby", "jade", "elixir" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})

autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.opt_local.shiftwidth = 8
        vim.opt_local.tabstop = 8
        vim.opt_local.softtabstop = 8
        vim.opt_local.expandtab = false -- Use actual tab characters
    end,
})

-- Ensure Vue syntax synchronization starts from the beginning
autocmd("FileType", {
    pattern = "vue",
    command = "syntax sync fromstart",
})

-- Treat `.js.es6` files as JavaScript
autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.js.es6",
    command = "set syntax=javascript",
})

-- Set TypeScript single-line comment format
autocmd("FileType", {
    pattern = "typescript",
    callback = function()
        vim.opt_local.commentstring = "// %s"
    end,
})

-- use `par` for `gq`
-- vim.opt.formatprg = "par"
-- vim.env.PARINIT = "rTbgqR B=.,?_A_a Q=_s>|"
-- vim.opt.formatprg = "par jw120" -- prevent long words from breaking par

-- Prevent Vim from adding two spaces after a period. See also:
-- http://stackoverflow.com/questions/4760428/how-can-i-make-vims-j-and-gq-commands-use-one-space-after-a-period
vim.opt.joinspaces = false


-- Use Unix as the standard file type
vim.opt.fileformats = { "unix", "dos", "mac" }


-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.hs",
    callback = function()
        local save_cursor = vim.api.nvim_win_get_cursor(0)  -- Save cursor position
        vim.cmd([[%s/\s\+$//e]])  -- Remove trailing whitespace
        vim.api.nvim_win_set_cursor(0, save_cursor)  -- Restore cursor position
    end,
    group = vim.api.nvim_create_augroup("WhitespaceCleanup", { clear = true }),
})

vim.opt.matchpairs:append("<:>")

-- open (zo), close (zc), etc.
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- an alterate method:
-- vim.opt.foldexpr = "v:lua.vim.lsp._foldexpr()"
vim.opt.foldenable = false  -- Don't fold everything by default
vim.opt.foldlevel = 99      -- Expand all folds initially

-- Turn this on if there are problems with hot-reloading files.
-- vim.opt.backupcopy = "yes"

-- backup files
vim.opt.directory = { "~/.vimswap//", "/var/tmp//", "/tmp//", "." }

vim.cmd("hi clear Conceal")
