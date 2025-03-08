-- Telescope
local builtin = require("telescope.builtin")
-- I set up two "find" commands. One includes hidden files and the other doesn't.
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>ffh", function()
    require("telescope.builtin").find_files({
        hidden = true, -- Show dotfiles
        no_ignore = true, -- Don’t ignore files from .gitignore
    })
end, { desc = "Find Files (incl. hidden)" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })

-- LSP Keybindings
vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to Definition" })
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Find References" })
vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Find Implementations" })
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Document Symbols" })
vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })


-- `nt` for NerdTree, even though this isn't NerdTree (`fb` was already used in
-- this file)
vim.keymap.set("n", "<leader>nt", ":Telescope file_browser<CR>", { desc = "File Browser" })
-- `ntc` for NerdTree current-dir
vim.keymap.set("n", "<leader>ntc", function()
    require("telescope").extensions.file_browser.file_browser({ path = vim.fn.expand("%:p:h") })
end, { desc = "File Explorer (Current Buffer's Directory)" })

-- open a project
vim.keymap.set("n", "<leader>pr", ":Telescope project<CR>", { desc = "Project Manager" })

-- Convert double quotes to single quotes on the current line
vim.keymap.set("n", "<leader>'", [[:s/"/'/g<CR>:noh<CR>]], { silent = true, desc = "Replace double quotes with single quotes (line)" })
vim.keymap.set("n", "<leader><leader>'", [[:s/"/'/gc<CR>:noh<CR>]], { silent = true, desc = "Replace double quotes with single quotes (line, confirm)" })

-- Convert double quotes to single quotes in a visual selection
vim.keymap.set("v", "<leader>'", [[:s/"/'/g<CR>:noh<CR>]], { silent = true, desc = "Replace double quotes with single quotes (selection)" })
vim.keymap.set("v", "<leader><leader>'", [[:s/"/'/gc<CR>:noh<CR>]], { silent = true, desc = "Replace double quotes with single quotes (selection, confirm)" })

-- Convert single quotes to double quotes on the current line
vim.keymap.set("n", "<leader>\"", [[:s/'/"/g<CR>:noh<CR>]], { silent = true, desc = "Replace single quotes with double quotes (line)" })
vim.keymap.set("n", "<leader><leader>\"", [[:s/'/"/gc<CR>:noh<CR>]], { silent = true, desc = "Replace single quotes with double quotes (line, confirm)" })

-- Convert single quotes to double quotes in a visual selection
vim.keymap.set("v", "<leader>\"", [[:s/'/"/g<CR>:noh<CR>]], { silent = true, desc = "Replace single quotes with double quotes (selection)" })
vim.keymap.set("v", "<leader><leader>\"", [[:s/'/"/gc<CR>:noh<CR>]], { silent = true, desc = "Replace single quotes with double quotes (selection, confirm)" })

vim.keymap.set("n", "<leader><leader>v", "$v0", { silent = true, desc = "Visually select line without newline" })

vim.keymap.set("n", "<leader><leader>m", [[:g/^#	modified:/t1<CR>:2,+s/^#	/- /<CR>:norm ggO<CR>]], {
    silent = true,
    desc = "Copy modified files to a list in Git commit messages"
})

vim.keymap.set("n", "<leader>ss", ":setlocal spell!<CR>", { silent = true, desc = "Toggle spell check" })

vim.keymap.set("n", "<leader>n", ":nohlsearch<CR>", { silent = true, desc = "Clear search highlights" })


-- Move line up and down in normal mode
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", { silent = true, desc = "Move line up" })

-- Move selection up and down in visual mode
vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

vim.keymap.set("n", "<leader>p", '"+p', { silent = true, desc = "Paste from system clipboard (after cursor)" })
vim.keymap.set("n", "<leader>P", '"+P', { silent = true, desc = "Paste from system clipboard (before cursor)" })

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { silent = true, desc = "Copy to system clipboard (normal mode)" })
vim.keymap.set("v", "<leader>y", '"+y', { silent = true, desc = "Copy to system clipboard (visual mode)" })

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p', { silent = true, desc = "Paste from system clipboard (normal mode)" })
vim.keymap.set("v", "<leader>p", '"+p', { silent = true, desc = "Paste from system clipboard (visual mode)" })

-- Split navigation (move between window splits with Ctrl + H/J/K/L)
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { silent = true, desc = "Move to split below" })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { silent = true, desc = "Move to split above" })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { silent = true, desc = "Move to split right" })
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { silent = true, desc = "Move to split left" })

-- Open window splits in various positions
vim.keymap.set("n", "<leader>sh", ":leftabove  vnew<CR>", { silent = true, desc = "Open vertical split to the left" })
vim.keymap.set("n", "<leader>sl", ":rightbelow vnew<CR>", { silent = true, desc = "Open vertical split to the right" })
vim.keymap.set("n", "<leader>sk", ":leftabove  new<CR>", { silent = true, desc = "Open horizontal split above" })
vim.keymap.set("n", "<leader>sj", ":rightbelow new<CR>", { silent = true, desc = "Open horizontal split below" })

-- Switch between % (current) and # (alternate) buffer
vim.keymap.set("n", "<F2>", ":e#<CR>", { silent = true, desc = "Switch to alternate buffer" })

-- Alternative split navigation (duplicate mappings for redundancy)
vim.keymap.set("n", "<C-H>", "<C-W>h", { silent = true, desc = "Move to split left" })
vim.keymap.set("n", "<C-K>", "<C-W>k", { silent = true, desc = "Move to split above" })
vim.keymap.set("n", "<C-J>", "<C-W>j", { silent = true, desc = "Move to split below" })
vim.keymap.set("n", "<C-L>", "<C-W>l", { silent = true, desc = "Move to split right" })

-- Resize splits using arrow keys
vim.keymap.set("n", "<Up>", ":resize +2<CR>", { silent = true, desc = "Increase window height" })
vim.keymap.set("n", "<Down>", ":resize -2<CR>", { silent = true, desc = "Decrease window height" })
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", { silent = true, desc = "Increase window width" })
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", { silent = true, desc = "Decrease window width" })

-- Visually select to end of line
vim.keymap.set("n", "<leader>$", "v$h", { silent = true, desc = "Select to end of line (excluding newline)" })

-- Ctrl + Backspace to delete the previous word
vim.keymap.set("i", "<C-BS>", "<C-w>", { silent = true, desc = "Delete previous word (insert mode)" })
vim.keymap.set("c", "<C-BS>", "<C-w>", { silent = true, desc = "Delete previous word (command mode)" })

-- Ctrl + H (alternative for backspace, usually redundant)
vim.keymap.set("i", "<C-h>", "<C-w>", { silent = true, desc = "Delete previous word (insert mode, alternative)" })
vim.keymap.set("c", "<C-h>", "<C-w>", { silent = true, desc = "Delete previous word (command mode, alternative)" })

-- Change the working directory of all windows to the directory of the open file
vim.keymap.set("n", "<leader>d", ":cd %:p:h<CR>", { silent = true, desc = "Change working directory to file's location (all windows)" })

-- Change only the current window's working directory
vim.keymap.set("n", "<leader>dl", ":lcd %:p:h<CR>", { silent = true, desc = "Change working directory to file's location (current window)" })
