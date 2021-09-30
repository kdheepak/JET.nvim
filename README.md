# JET.nvim

![](https://aws1.discourse-cdn.com/business5/uploads/julialang/original/3X/b/4/b47f035733d3f3fab9dd9c13f0e5446e60f59d3c.jpeg)

## Install

**With [Packer](https://github.com/wbthomason/packer.nvim):**

Add the following to `init.lua`:

```lua
use({
  "~/gitrepos/JET.nvim",
  requires = "jose-elias-alvarez/null-ls.nvim",
  ft = { "julia" },
  config = function()
    require("jet").setup()
  end,
})
```

**With [vim-plug](https://github.com/junegunn/vim-plug):**

Add the following to `init.vim` or `.vimrc`:

```vimrc
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'kdheepak/JuliaFormatter.vim'

lua << EOF
  require("jet").setup()
EOF
```

## Configuration

```lua
require("jet").setup({
  timeout = 15000, -- timeout for JET.jl
  setup_lspconfig = true, -- configure lspconfig
})
```
