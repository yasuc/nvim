-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- set leader key to space
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

--Old settings
--Remap space as leader key
keymap.set("", "<Space>", "<Nop>", opts)

keymap.set("n", "x", '"_x')

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-d>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", ":Jaq quickfix<Return>")

-- Normal --
-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- New tab
keymap.set("n", "te", ":tabedit", opts)
-- 新しいタブを一番右に作る
keymap.set("n", "gn", ":tabnew<Return>", opts)
-- move tab
keymap.set("n", "gh", "gT", opts)
keymap.set("n", "gl", "gt", opts)

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w", opts)
keymap.set("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Select all
--keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Do not yank with x
keymap.set("n", "x", '"_x', opts)

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', opts)

-- 行の端に行く
keymap.set("n", "<leader>h", "^", opts)
keymap.set("n", "<leader>l", "$", opts)

-- ;でコマンド入力( ;と:を入れ替)
keymap.set("n", ";", ":", opts)

-- 行末までのヤンクにする
keymap.set("n", "Y", "y$", opts)

-- <Space>q で強制終了
keymap.set("n", "<Space>q", ":<C-u>q!<Return>", opts)

-- ESC*2 でハイライトやめる
keymap.set("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap.set("i", "jk", "<ESC>", opts)

-- コンマの後に自動的にスペースを挿入
-- keymap.set("i", ",", ",<Space>", opts)

-- Visual --
-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- ビジュアルモード時vで行末まで選択
keymap.set("v", "v", "$h", opts)

-- 0番レジスタを使いやすくした
keymap.set("v", "<C-p>", '"0p', opts)

-- insert mode での移動
keymap.set("i", "<C-e>", "<END>", opts)
keymap.set("i", "<C-a>", "<HOME>", opts)
keymap.set("i", "<C-n>", "<Down>", opts)
keymap.set("i", "<C-p>", "<Up>", opts)
keymap.set("i", "<C-b>", "<Left>", opts)
keymap.set("i", "<C-f>", "<Right>", opts)

-- jqa
keymap.set("n", ",r", ":Jaq quickfix<Return>", opts)

-- Telescope-file-browser
keymap.set("n", ",fb", ":Telescope file_browser<Return>", opts)
keymap.set("n", ",ff", ":Telescope find_files<Return>", opts)
keymap.set("n", ",fg", ":Telescope live_grep<Return>", opts)

-- Commentary.vim
keymap.set("n", ",/", ":Commentary<Return>", opts)
keymap.set("v", ",/", ":Commentary<Return>", opts)
