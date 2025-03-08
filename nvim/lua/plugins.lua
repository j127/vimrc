-- If the `lazy` directory doesn't exist, create it and clone the `lazy` Github
-- repo.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
-- Tell nvim where the lazypath is.
vim.opt.rtp:prepend(lazypath)
-- Equivalent to:
-- `vim.opt.rtp.prepend(vim.opt,rtp, lazypath)`
-- The `:prepend` version is shorthand for injecting itself into the args(?).


-- Setup lazy.nvim
require("lazy").setup({
    {
        "rebelot/kanagawa.nvim",
        config = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        -- Create a virtualenv specifically for Nvim using pyenv, and set
        -- `g:python3_host_prog`. This will avoid the need to install the
        -- pynvim module in each version/virtualenv.
        config = function()
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all" (the listed parsers MUST always be installed)
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "ruby",
                    "javascript",
                    "typescript",
                    "rust",
                    "bash",
                    "css",
                    "diff",
                    "eex",
                    "hurl"
                },

                -- Automatically install missing parsers when entering buffer
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                rainbow = { enable = true },
            })
        end
    },
    {
        "tpope/vim-surround"
    },
    {
        "easymotion/vim-easymotion"
    },
    {
        "nvim-lua/plenary.nvim"
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
        config = function()
            local telescope = require("telescope")

            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git" },
                    find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
                    layout_strategy = "vertical", -- Alternative: "horizontal", "center"
                    sorting_strategy = "ascending",
                    mappings = {
                        i = {
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                        },
                    },
                },
                extensions = {
                    fzf = { fuzzy = true, override_generic_sorter = true },
                    file_browser = { hijack_netrw = true },
                    gh = { -- GitHub PRs, issues, etc.
                        user = "j127",
                    },
                },
            })
            -- Load extensions
            telescope.load_extension("fzf")
            telescope.load_extension("file_browser")
            telescope.load_extension("gh")
            telescope.load_extension("project")
            telescope.load_extension("file_browser")
        end,
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension("project")
        end
    },
    {
        "nvim-telescope/telescope-github.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension("gh")  -- Load GitHub extension
        end,
    },
    {
        -- Run `:Cheatsheet` to see your shortcuts
        "sudormrfbin/cheatsheet.nvim"
    },
    { "neovim/nvim-lspconfig" },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,  -- Use Treesitter for better matching
            })
        end
    },
})
