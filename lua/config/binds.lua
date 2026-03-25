vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.Ex, { desc = "File explorer" })

vim.api.nvim_create_user_command("Shortcuts", function()
    local lines = {
        "  SHORTCUTS",
        " ─────────────────────────────────────────────",
        "  GENERAL",
        "    <leader>q        Open file explorer (Netrw)",
        "",
        "  TELESCOPE",
        "    <leader>ff       Find files",
        "    <leader>fg       Live grep",
        "    <leader>fb       Open buffers",
        "    <leader>fh       Help tags",
        "",
        "  HARPOON",
        "    <leader>a        Add file to harpoon",
        "    <C-e>            Toggle harpoon menu",
        "    <leader>fl       Harpoon list (telescope)",
        "    <C-p>            Previous harpoon file",
        "    <C-n>            Next harpoon file",
        "",
        "  C++ SWITCHER",
        "    <leader>hh       Switch header <-> source",
        "",
        "  LSP",
        "    gd               Go to definition",
        "    gD               Go to declaration",
        "    gi               Go to implementation",
        "    gr               Go to references",
        "    K                Hover docs",
        "    <leader>rn       Rename symbol",
        "    <leader>ca       Code action",
        "    <leader>e        Show line diagnostics",
        "    [d / ]d          Previous / next diagnostic",
        "",
        "  GIT (gitsigns)",
        "    ]h / [h          Next / previous hunk",
        "    <leader>hs       Stage hunk",
        "    <leader>hu       Unstage hunk",
        "    <leader>hp       Preview hunk",
        "    <leader>hb       Blame line",
        "",
        "  COMPLETION (blink.cmp)",
        "    <C-space>        Force open completion",
        "    <Tab>/<S-Tab>    Navigate suggestions",
        "    <CR>             Confirm selection",
        "    <C-c>            Dismiss completion",
        "    <C-k>/<C-j>      Scroll docs",
        " ─────────────────────────────────────────────",
    }

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false

    local width = 52
    local height = #lines
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        style = "minimal",
        border = "rounded",
        title = " Shortcuts ",
        title_pos = "center",
    })

    vim.keymap.set("n", "q", function()
        vim.api.nvim_win_close(win, true)
    end, { buffer = buf, nowait = true })
end, {})
