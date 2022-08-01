local M = {}

local root_folder = debug.getinfo(1, "S").source:sub(2):match("(.*[/\\])"):sub(1, -2):match("(.*[/\\])")

local command = root_folder .. "scripts/jet"

function M.setup(opts)
  opts = opts or {}
  timeout = opts.timeout or 20000
  setup_lspconfig = opts.setup_lspconfig or true
  local null_ls = require("null-ls")
  local helpers = require("null-ls.helpers")
  local builtins = null_ls.builtins
  local generator = null_ls.generator

  local jet_julia = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "julia" },
    generator = null_ls.generator({
      command = command,
      to_stdin = true,
      from_stderr = true,
      timeout = timeout,
      format = "line",
      check_exit_code = function(code)
        return code <= 1
      end,
      args = { "$FILENAME" },
      on_output = helpers.diagnostics.from_patterns({
        {
          pattern = [[(%d+):([EIW]):(.*)]],
          groups = { "row", "severity", "message" },
          overrides = {
            severities = {
              E = helpers.diagnostics.severities["error"],
              W = helpers.diagnostics.severities["warning"],
              I = helpers.diagnostics.severities["information"],
            },
          },
        },
      }),
    }),
  }

  null_ls.register(jet_julia)
  -- null_ls.config({
  --   sources = { jet_julia },
  -- })

  if setup_lspconfig then
    require("lspconfig")["null-ls"].setup({})
  end
end

return M
