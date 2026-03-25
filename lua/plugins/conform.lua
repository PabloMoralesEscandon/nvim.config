return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    opts = {
        formatters_by_ft = {
            python = { 'ruff_format', 'ruff_organize_imports' },
            c      = { 'clang_format' },
            cpp    = { 'clang_format' },
            lua    = { 'stylua' },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
