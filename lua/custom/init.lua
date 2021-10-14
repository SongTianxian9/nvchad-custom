-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

-- hooks.add("setup_mappings", function(map)
--    map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
--    .... many more mappings ....
-- end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
   --    use {
   --       "max397574/better-escape.nvim",
   --       event = "InsertEnter",
   --    }
   use {
      "lervag/vimtex",
      -- "SirVer/ultisnips",
      -- "honza/vim-snippets"
      config = function()
         vim.api.nvim_exec(
            [[
      let g:tex_flavor='latex'
      let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \}
      let g:vimtex_view_method = 'zathura'
      let g:vimtex_quickfix_mode=0
      set conceallevel=1
      let g:tex_conceal='abdmg'
      ]],
            true
         )
      end,
   }

   --    use {
   --      "conornewton/vim-latex-preview",
   --
   --      config = function()
   --      vim.api.nvim_exec(
   --      [[
   --      let g:latex_pdf_viewer="zathura"
   --      let g:latex_engine="xelatex"
   --      ]],
   --      true)
   --       end
   --
   --    }

   --    use {
   --      "skywind3000/asyncrun.vim"
   --    }
   --       use {
   --         "xuhdev/vim-latex-live-preview",
   --         config = function()
   --           vim.api.nvim_exec(
   --           [[
   --           let g:livepreview_previewer = 'zathura'
   --           let g:livepreview_engine = 'xelatex'
   --
   --           ]],
   --           true)
   --         end
   --       }
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
