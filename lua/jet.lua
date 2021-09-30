local M = {}

local current_folder = debug.getinfo(1, "S").source:sub(2):match("(.*[/\\])"):sub(1, -2):match("(.*[/\\])")

function M.setup(opts)
  opts = opts or {}
  timeout = opts.timeout or 15000
  setup_lspconfig = opts.setup_lspconfig or true
  local null_ls = require("null-ls")
  local helpers = require("null-ls.helpers")
  local builtins = null_ls.builtins
  local generator = null_ls.generator

  local jet_julia = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "julia" },
    generator = null_ls.generator({
      command = current_folder .. "/scripts/jet",
      to_stdin = true,
      from_stderr = true,
      timeout = timeout,
      -- choose an output format (raw, json, or line)
      format = "line",
      check_exit_code = function(code)
        return code <= 1
      end,
      args = function(params)
        local filename = params.bufname
        return { filename }
      end,
      -- use helpers to parse the output from string matchers,
      -- or parse it manually with a function
      on_output = helpers.diagnostics.from_patterns({
        {
          pattern = [[(%d+):(.*)]],
          groups = { "row", "message" },
        },
      }),
    }),
  }

  null_ls.register(jet_julia)
  null_ls.config({
    sources = { jet_julia },
  })

  if setup_lspconfig then
    require("lspconfig")["null-ls"].setup({})
  end
end

return M
