# JET.nvim

![](https://aws1.discourse-cdn.com/business5/uploads/julialang/original/3X/b/4/b47f035733d3f3fab9dd9c13f0e5446e60f59d3c.jpeg)

## Install

**With [Packer](https://github.com/wbthomason/packer.nvim):**

Add the following to `init.lua`:

```lua
use({
  "~/gitrepos/JET.nvim",
  requires = "jose-elias-alvarez/null-ls.nvim",
  run = [[mkdir -p ~/.julia/environments/nvim-null-ls && julia --startup-file=no --project=~/.julia/environments/nvim-null-ls -e 'using Pkg; Pkg.add("JET")']],
  ft = { "julia" },
  config = function()
    require("jet").setup()
  end,
})
```

**With [vim-plug](https://github.com/junegunn/vim-plug):**

Run the following in a terminal:

```bash
$ mkdir -p ~/.julia/environments/nvim-null-ls && julia --startup-file=no --project=~/.julia/environments/nvim-null-ls -e 'using Pkg; Pkg.add("JET")'
```

Then add the following to your `init.vim` or `.vimrc`:

```vim
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
