return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        spec = {
            { '<leader>f', group = 'Find' },
            { '<leader>h', group = 'Git hunks / C++ switch' },
            { '<leader>r', group = 'Refactor' },
            { '<leader>c', group = 'Code' },
        },
    },
}
