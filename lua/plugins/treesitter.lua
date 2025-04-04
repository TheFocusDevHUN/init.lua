return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { 
        "c",
        "cpp",
        "lua",
        "go", 
        "python",
        "java",
        "kotlin",
        "vim", 
        "vimdoc",
        -- Web dev
        "php",
        "svelte",
        "vue",
        "javascript", 
        "typescript",
        "html",
        -- Configuration languages
        "json",
        "toml",
        "yaml",
        "hcl",
        "properties"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
