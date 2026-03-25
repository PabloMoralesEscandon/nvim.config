return {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add          = { text = '+' },
            change       = { text = '~' },
            delete       = { text = '-' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
        },
        on_attach = function(buf)
            local gs = package.loaded.gitsigns
            local map = function(keys, func, desc)
                vim.keymap.set('n', keys, func, { buffer = buf, desc = desc })
            end

            map(']h', gs.next_hunk,                 'Next hunk')
            map('[h', gs.prev_hunk,                 'Previous hunk')
            map('<leader>hs', gs.stage_hunk,        'Stage hunk')
            map('<leader>hu', gs.undo_stage_hunk,   'Unstage hunk')
            map('<leader>hp', gs.preview_hunk,      'Preview hunk')
            map('<leader>hb', gs.blame_line,        'Blame line')
        end,
    },
}
