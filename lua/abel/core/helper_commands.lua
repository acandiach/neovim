-- KEYMAPS HELPERS

-- Basic Configuration
    "<jk>", desc = "escape mode insert"
    "<Space>q", desc = "quit neovim"
    "<Space>w", desc = "save changes"

-- File Browser
    "<Space>e", desc = "open file explore"

-- To Navigate between buffer and close buffer
    "<Space>bn", desc = "go to next buffer"
    "<Space>bp", desc = "go to previous buffer"
    "<Space>bd", desc = "close current buffer "

-- Move text up and down normal mode
    "<Alt-j>", desc = "Move the line you're on one space down in normal mode"
    "<Alt-k >", desc = "Move the line you're on one space up in normal mode"

-- Move text up and down visual mode
    "J", desc = "Move the line you're on one space down in visual mode"
    "K", desc = "Move the line you're on one space up in visual mode"

-- Terminal
    "<Ctrl-t>", desc = "Open vertical Terminal"
    "<Esc><Esc>", desc = "quit terminal mode"

-- Resize windows with arrows keys
    "<right>", desc = "vertical resize -5"
    "<left>", desc = "vertical resize +5"
    "<up>", desc = "resize -5"
    "<down>", desc = "resize +5"

-- Indenting in visual mode
    ">", desc = "after tab in re-select the same"
    "<", desc = "after tab out re-select the same"

-- Faster Scrolling
    "<Space>j", desc = "Move 10 lines down"
    "<Space>k", desc = "Move 10 lines up"

-- Git Fugitive
    "<Space>ga", desc = "Git fetch",
    "<Space>gl", desc = "Git pull",

-- Telescope
    "<Space>gf", desc = "Telescope Git Files",
    "<Space>gs", desc = "Telescope Git status",
    "<Space>gc", desc = "Telescope Git commits",
    "<Space>gb", desc = "Telescope Git branches",
    "<Space>bf", desc = "Telescope buffers",
    "<Space>wd", desc = "Open Workspaces directory and create file/Dir"
    "<Space>pf", desc = "Open Plugins directory and create new plugins"
    "<Space>ff", desc = "Telescope Find Files",
    "<Space>th", desc = "Telescope Help"
    "<Space>fb", desc = "Telescope file browser"

-- Harpoon
    "<Space><Space>h", desc = "Harpoon open menu",
    "<Space><Space>ha", desc = "harpoon Add file",
    "<Space><Space>hn", desc = "harpoon to next mark",
    "<Space><Space>hp", desc = "harpoon to previous mark",

-- Surround
--     Old text              Command         New text
-- --------------------------------------------------------------------------------
   surr*ound_words             ysiw)        (surround_words)
   surr*ound_words             ysiw(        ( surround_words )
   *make strings               ys$"         "make strings"  -- $ is for complete line replace for actions require
   [delete ar*ound me!]        ds]          delete around me!
   remove <b>HTML t*ags</b>    dst          remove HTML tags
   'change quot*es'            cs'"         "change quotes"
   <b>or tag* types</b>        csth1<CR>    <h1>or tag types</h1>
   delete(functi*on calls)     dsf          function calls

