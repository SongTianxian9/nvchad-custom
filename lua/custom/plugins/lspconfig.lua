local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config

   local servers = { "clangd", "texlab" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         -- root_dir = vim.loop.cwd,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end

   -- lspconfig.lspname.setup {
   --    on_attach = attach,
   --    capabilities = capabilities,
   -- }

   lspconfig.texlab.setup {
      on_attach = attach,
      capabilities = capabilities,
      cmd = { "texlab" },
      filetypes = { "tex", "bib" },
      -- root_dir = vim's starting directory
      settings = {
         texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
            build = {
               args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
               executable = "xelatex",
               forwardSearchAfter = false,
               onSave = false,
            },
            chktex = {
               onEdit = true,
               onOpenAndSave = false,
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
               args = {},
            },
            latexFormatter = "latexindent",
            latexindent = {
               modifyLineBreaks = true,
            },
         },
      },
   }
   --    -- typescript
   --
   --   lspconfig.tsserver.setup {
   --       on_attach = attach,
   --       capabilities = capabilities,
   --       cmd = { "typescript-language-server", "--stdio" },
   --       filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
   --       root_dir = lspcofig.util.root_pattern("package.json", "tsconfig.json")
   --     }
   --
end

return M
