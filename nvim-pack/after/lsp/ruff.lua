return {
  -- Ruff's hover only explains lint rules; basedpyright's is far more useful
  -- and two servers answering K produces a muddled popup.
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
  -- Deliberately no lint/format settings here: ruff reads pyproject.toml, so
  -- each project stays the source of truth.
}
