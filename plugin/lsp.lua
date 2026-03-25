-- Configure LSP clients

-- Set default root markers for all clients
vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.diagnostic.config({
    virtual_text  = true,
    severity_sort = true,
    float         = {
        style  = 'minimal',
        border = 'rounded',
        source = 'if_many',
        header = '',
        prefix = '',
    },
    signs         = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN]  = '▲',
            [vim.diagnostic.severity.HINT]  = '⚑',
            [vim.diagnostic.severity.INFO]  = '»',
        },
    },
})

-- C / C++ via clangd
vim.lsp.config['clangd'] = {
    cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy',
        '--header-insertion=never',
        '--completion-style=detailed',
        '--query-driver=/nix/store/*-gcc-*/bin/gcc*,/nix/store/*-clang-*/bin/clang*,/run/current-system/sw/bin/cc*',
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_markers = { 'compile_commands.json', '.clangd', 'configure.ac', 'Makefile', 'makefile', '.git' },
    capabilities = caps,
    init_options = {
        fallbackFlags = { '-std=c23' }, -- Default to C23
    },
}


vim.lsp.config['jsonls'] = {
    cmd = { 'vscode-json-languageserver', '--stdio' },
    filetypes = { 'json', 'jsonc' },
    root_markers = { 'package.json', '.git', 'config.jsonc' },
    capabilities = caps,
}


vim.lsp.config["pyright"] = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
  before_init = function(_, config)
    local venv_python = (config.root_dir or vim.fn.getcwd()) .. "/.venv/bin/python"
    if vim.fn.filereadable(venv_python) == 1 then
      config.settings.python.pythonPath = venv_python
    end
  end,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "standard",   -- "off" | "basic" | "standard" | "strict"
        autoImportCompletions = true,
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
}

vim.lsp.config["ruff"] = {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".git" },
  init_options = {
    settings = {
      fixAll = true,
      organizeImports = true,
    },
  },

}

vim.lsp.config['luals'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    capabilities = caps,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = { enable = false },
        },
    },
}

vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('ruff')
vim.lsp.enable('jsonls')
vim.lsp.enable('luals')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP keymaps',
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
        end

        map('gd',         vim.lsp.buf.definition,      'Go to definition')
        map('gD',         vim.lsp.buf.declaration,     'Go to declaration')
        map('gi',         vim.lsp.buf.implementation,  'Go to implementation')
        map('gr',         vim.lsp.buf.references,      'Go to references')
        map('K',          vim.lsp.buf.hover,           'Hover docs')
        map('<leader>rn', vim.lsp.buf.rename,          'Rename symbol')
        map('<leader>ca', vim.lsp.buf.code_action,     'Code action')
        map('<leader>e',  vim.diagnostic.open_float,   'Show line diagnostics')
        map('[d',         vim.diagnostic.goto_prev,    'Previous diagnostic')
        map(']d',         vim.diagnostic.goto_next,    'Next diagnostic')
    end,
})
