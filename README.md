# JET.nvim

![](https://aws1.discourse-cdn.com/business5/uploads/julialang/original/3X/b/4/b47f035733d3f3fab9dd9c13f0e5446e60f59d3c.jpeg)

## Install

With Packer:

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

## Configuration

```lua
require("jet").setup({
  timeout = 15000,
})
```
