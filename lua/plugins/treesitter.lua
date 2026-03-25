return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
      require("nvim-treesitter").setup({
	    ensure_installed = {
		"lua",
		"c",
		"cpp",
		"python",
		"java",
		"rust",
	    },
	    auto_install = true,
        })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "c", "cpp", "python", "java", "rust" },
        callback = function()
            pcall(vim.treesitter.start)
        end,
    })
    end
}
