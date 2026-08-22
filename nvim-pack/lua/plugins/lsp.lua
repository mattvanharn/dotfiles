-- How diagnostics are displayed. Independent of which servers are running.
vim.diagnostic.config({
  severity_sort = true,
  underline = true,
  -- Inline text after every line gets noisy; show the full message only for
  -- the line the cursor is on.
  virtual_text = false,
  virtual_lines = { current_line = true },
  float = { source = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
})

-- Nvim already maps gra/gri/grn/grr/grt/grx/gO/K/<C-s>/]d/[d itself, so only
-- the genuine gaps are added here, buffer-local to buffers with a server.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp.attach', { clear = true }),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    local function map(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { buffer = ev.buf, desc = desc })
    end

    -- <C-]> already does this via 'tagfunc', but gd is the common muscle memory.
    map('gd', vim.lsp.buf.definition, 'Go to definition')
    map('gD', vim.lsp.buf.declaration, 'Go to declaration')

    if client:supports_method('textDocument/inlayHint') then
      map('<leader>uh', function()
        local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf })
        vim.lsp.inlay_hint.enable(not enabled, { bufnr = ev.buf })
      end, 'Toggle inlay hints')
    end
  end,
})

-- Configs themselves come from nvim-lspconfig's lsp/ directory, with our
-- overrides layered on top from after/lsp/.
vim.lsp.enable({ 'basedpyright', 'ruff' })
