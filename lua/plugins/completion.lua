return {
    {
        'rafamadriz/friendly-snippets',
        lazy = false,
    },
    {
    'saghen/blink.cmp',
    version = '*',
    opts = {
        keymap = {
            preset = 'default',
            ['<C-e>'] = {},
            ['<C-c>'] = { 'cancel', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
        },
        appearance = { nerd_font_variant = 'mono' },
        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
        },
        snippets = { preset = 'default' },
    },
    },
}
