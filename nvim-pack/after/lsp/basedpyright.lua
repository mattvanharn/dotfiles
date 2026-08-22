return {
  -- uv puts a project's interpreter at <root>/.venv. basedpyright will not find
  -- it on its own, so point it there when one exists.
  before_init = function(_, config)
    local venv = config.root_dir and (config.root_dir .. '/.venv/bin/python')
    if venv and vim.uv.fs_stat(venv) then
      config.settings = vim.tbl_deep_extend('force', config.settings or {}, {
        python = { pythonPath = venv },
      })
    end
  end,
  settings = {
    basedpyright = {
      analysis = {
        -- Default is 'recommended', which is very strict against untyped
        -- third-party data/ML code. Raise this as annotations improve.
        typeCheckingMode = 'standard',
        diagnosticSeverityOverrides = {
          -- Ruff reports these too (F401/F841); avoid duplicate diagnostics.
          reportUnusedImport = 'none',
          reportUnusedVariable = 'none',
          reportMissingTypeStubs = 'none',
        },
        inlayHints = {
          variableTypes = true,
          callArgumentNames = true,
          functionReturnTypes = true,
        },
      },
    },
  },
}
