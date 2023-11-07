local plugins = {
    {
    "neovim/nvim-lspconfig",
    config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
    end,
    },
    {
        "hrsh7th/nvim-cmp",
        enabled = true,
        opts = {
            sources = {
                {name = 'nvim_lsp', keyword_length = 3},
                {name = 'luasnip', keyword_length = 2},
                {name = 'path'},
                {name = 'buffer', keyword_length = 3},
            },
        },
    },
    {
    "NvChad/nvim-colorizer.lua",
    opts = {
         user_default_options = {
         names = false
           }
    }
    }
}
return plugins
