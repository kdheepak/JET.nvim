# JET.nvim

![](https://github.com/kdheepak/JET.nvim/assets/1813121/de113f50-6167-495f-8b33-ac2e1bd4bc1e)
![](https://github.com/kdheepak/JET.nvim/assets/1813121/87b969d6-c2ab-44d7-bc4b-529ede3eab42)

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
