-- EXTRA FUNCTIONS

-------------------------- Highlight copied Text -----------------------------
vim.cmd([[
augroup AuYank
    autocmd!
    autocmd TextYankPost *
	\ lua vim.highlight.on_yank{higroup = "IncSearch", timeout = 400, on_visual = true}
augroup END
]])

--------------------- Function for open commands helper -----------------------
local function float_file(filepath)
    -- Verificar que el archivo existe
    if vim.fn.filereadable(filepath) == 0 then
        vim.notify("Archivo no encontrado: " .. filepath, vim.log.levels.ERROR)
        return
    end

    -- Crear buffer
    local buf = vim.api.nvim_create_buf(false, true)

    -- Leer contenido
    local lines = vim.fn.readfile(filepath)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Configurar buffer
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].modifiable = false
    vim.bo[buf].filetype = vim.filetype.match({ filename = filepath }) or ""

    -- Tamaño de la ventana
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)

    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    -- Abrir ventana flotante
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        row = row,
        col = col,
        width = width,
        height = height,
        border = "rounded",
        -- title = " " .. vim.fn.fnamemodify(filepath, ":t") .. " ",
        title = " Commands ",
        title_pos = "center",
    })

    -- Cerrar con q
    vim.keymap.set("n", "q", function()
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
    end, { buffer = buf, silent = true })

    -- Cerrar con ESC
    vim.keymap.set("n", "<Esc>", function()
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
    end, { buffer = buf, silent = true })
end

-- Commands for executive this function
vim.api.nvim_create_user_command("FloatFile", function(opts)
    float_file(vim.fn.expand(opts.args))
end, {
    nargs = 1,
    complete = "file",
})

----------------------------------- Initial Message --------------------------------------
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     local buf = vim.api.nvim_create_buf(false, true)
--
--     local lines = {
--       -- "   🚀 Bienvenido a Neovim",
--       -- "",
--       "  <leader>hh   Ver Comandos",
--       "  <leader>ff  Buscar archivos",
--       "      q       Cerrar ventana",
--     }
--
--     vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
--
--     local width = 43
--     local height = #lines
--
--     local win = vim.api.nvim_open_win(buf, true, {
--       title = "🚀 Bienvenido a Neovim",
--       title_pos = "center",
--       relative = "editor",
--       width = width,
--       height = height,
--       row = math.floor((vim.o.lines - height) / 2),
--       col = math.floor((vim.o.columns - width) / 2),
--       style = "minimal",
--       border = "rounded",
--     })
--
--     vim.keymap.set("n", "q", function()
--       if vim.api.nvim_win_is_valid(win) then
--         vim.api.nvim_win_close(win, true)
--       end
--     end, { buffer = buf, silent = true })
--   end,
-- })
