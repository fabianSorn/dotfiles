local lsp_installer = require("nvim-lsp-installer")
local lsp_handlers = require("fs.lsp.handlers")

local server_specific_opts = {
  { server = "jsonls", module = "fs.lsp.settings.jsonls" },
  { server = "sumneko_lua", module = "fs.lsp.settings.sumneko_lua" },
  { server = "pyright", module = "fs.lsp.settings.pyright" },
}

lsp_installer.on_server_ready(function(server)

  local opts = {
    on_attach = lsp_handlers.on_attach,
    capabilities = lsp_handlers.capabilities,
  }

  for server, module in pairs(server_specific_opts) do
    if server.name == server then
      local server_opts = require(module)
      opts = vim.tbl_deep_extend("force", server_opts, opts)
    end
  end

  server:setup(opts)

end)
