local map = require("core.utils").map

-- Navigation
--
-- Better cursor movement
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move cursor up" })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move cursor down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move cursor and screen up (Page up)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move cursor and screen down (Page down)" })
--
-- Pane navigation
map("n", "<C-h>", "<C-w>h", { desc = "Navigate to left window (Vertical split)" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate to right window (Vertical split)" })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate to window abovew (Horizontal split)" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate to window below (Horizontal split)" })
--
-- Quick fix navigation
map("n", "<C-k>", "<CMD>cnext<CR>zz", { desc = "Jump to next match" })
map("n", "<C-j>", "<CMD>cprev<CR>zz", { desc = "Jump to previous match" })

-- Window management
--
-- Split window
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<CMD>close<CR>", { desc = "Close current split" })
--

-- Exiting
--
-- Use Ctrl + c to exit insert mode (useful in visual block mode)
map("i", "<C-c>", "<ESC>", { desc = "Exit insert mode with Ctrl + c" })
--
-- Use Ctrl + s to save files
map({ "i", "n", "s", "x" }, "<C-s>", "<CMD>w<CR><ESC>", { desc = "Save file with Ctrl + s" })

-- Editing
--
-- Use Alt + j/k to move lines up/down
map("i", "<A-k>", "<ESC><CMD>m .-2<CR>==gi", { desc = "Move line(s) up" })
map("i", "<A-j>", "<ESC><CMD>m .+1<CR>==gi", { desc = "Move lines(s) down" })
map("n", "<A-k>", "<CMD>m .-2<CR>==", { desc = "Move line(s) up" })
map("n", "<A-j>", "<CMD>m .+1<CR>==", { desc = "Move line(s) down" })
map("v", "<A-k>", "<CMD>m '<-2<CR>gv=gv", { desc = "Move line(s) up" })
map("v", "<A-j>", "<CMD>m '>+1<CR>gv=gv", { desc = "Move line(s) down" })
--
-- Indenting
map("n", ">", ">gv", { desc = "Shift text to the right" })
map("n", "<", "<gv", { desc = "Shift text to the left" })
--
-- Join the line below to the current one and
-- keep the cursor at the beginning of the line
map("n", "J", "mzJ`z", { desc = "Join line below to the current one with one space in between" })

-- Search & Replace
--
-- Keep the cursor at the same position
-- when searching word under it
map("n", "n", "nzzzv", { desc = "Repeat search in the same direction" })
map("n", "N", "Nzzzv", { desc = "Repeat search in the opposite direction" })

-- Registers
--
-- Paste over highlighted text and delete the
-- highlighted text from the void register
map("x", "<leader>v", '"_dP', { desc = "Paste without loosing current paste buffer" })
--
-- Copy text to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into the system clipboard register" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank into the system clipboard register" })

-- Misc
-- Better experiences
map("n", "<space>", "<NOP>", { desc = "Do nothing when hitting space" })
map("n", "Q", "<NOP>", { desc = "Do nothing when hitting Q" })
