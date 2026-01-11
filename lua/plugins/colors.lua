local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
end
return {
    {
	"ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...,
	config = function()
	    vim.cmd.colorschem "gruvbox"
	    enable_transparency()
	end
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	config = function()
	    require('lualine').setup({
	    options = { theme = 'auto', icons_enabled = true },  -- Disable icons if no patched font
	    sections = { lualine_a = { 'mode' }, lualine_b = { 'branch', 'diff', 'diagnostics' }, lualine_c = { 'filename' } }
	    })
	end,
	opts = {
	    theme = "gruvbox",
	}
    }
}
