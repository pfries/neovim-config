local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Insert --
keymap("i", "jj", "<ESC>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)
keymap("n", "<C-j>", ":tabnext<CR>", opts)
keymap("n", "<C-k>", ":tabprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--keymap("n", "<C-_>", ":lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<C-_>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", opts)
keymap("n", "<C-p>", ":lua require('telescope.builtin').find_files()<cr>", opts)

-- insert date
keymap("n", "<F5>", ":r !date<CR>", opts)
keymap("i", "<F5>", "<C-R>=strftime('%c')<CR>", opts)

keymap("n", "<C-w>z", ":MaximizerToggle<CR>", opts)
keymap("v", "<C-w>z", ":MaximizerToggle<CR>gv", opts)
keymap("i", "<C-w>z", "<C-o>:MaximizerToggle<CR>", opts)

keymap("n", "<leader>cp", ":let @+ = expand('%')<CR>", opts)
-- swap buffer/alt
-- keymap("n", "<C-e>", "<C-^>", opts)
--keymap("n", "<C-e>", ":lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({previewer = false, prompt_title = 'MRU', result_title = ''}))<CR>", opts)
keymap("n", "<C-e>", ":lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({previewer = false, prompt_title = 'MRU', result_title = ''}), {only_cwd=true})<CR>", opts)
--keymap("n", "<C-e>", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})
keymap("n", "<C-b>", ":lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({previewer = false, prompt_title = 'Buffers', result_title = ''}))<CR>", opts)

keymap("n", "<C-f>", ":HopWord<CR>", opts)

-- fixes nvimtree clobbering gx (open uri under cursor)
keymap("n", "gx", "<CMD>execute '!xdg-open ' .. shellescape(expand('<cfile>'), v:true)<CR>", opts)

keymap("n", "gs", "<CMD>silent! StarDictCursor<CR>", opts)

keymap("n", "<leader>af", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<leader>ac", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>ag", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>aa", ":lua require('harpoon.term').nav_file(1)<CR>", opts)
keymap("n", "<leader>ab", ":lua require('harpoon.term').nav_file(2)<CR>", opts)
keymap("n", "<leader>ac", ":lua require('harpoon.term').nav_file(3)<CR>", opts)
keymap("n", "<leader>ad", ":lua require('harpoon.term').nav_file(4)<CR>", opts)
keymap("n", "<leader>at", ":lua require('harpoon.term').goToTerminal(1)<CR>", opts)
keymap("n", "<leader>ay", ":lua require('harpoon.term').goToTerminal(2)<CR>", opts)

