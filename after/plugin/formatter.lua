-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

    },
    -- Formatter configurations for filetype "javascript" go here
    -- and will be executed in order
    javascript = {
      -- "formatter.filetypes.javascript" defines default configurations for the
      -- "javascript" filetype
      require("formatter.filetypes.javascript").prettier,

    },
    -- Formatter configurations for filetype "typescript" go here
    -- and will be executed in order
    typescript = {
      -- "formatter.filetypes.typescript" defines default configurations for the
      -- "typescript" filetype
      require("formatter.filetypes.typescript").prettier,
    },
    -- Formatter configurations for filetype "vue" go here
    -- and will be executed in order
    vue = {
      -- "formatter.filetypes.vue" defines default configurations for the
      -- "vue" filetype
      -- require("formatter.filetypes.vue").prettier,
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
          stdin = true
        }
      end
    },
    -- Formatter configurations for filetype "go" go here
    -- and will be executed in order
    go = {
      -- "formatter.filetypes.go" defines default configurations for the
      -- "go" filetype
      require("formatter.filetypes.go").gofmt,
    },
  }
}
