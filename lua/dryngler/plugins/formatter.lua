-- import formatter plugin safely
local status, formatter = pcall(require, "formatter")
if not status then
  return
end

-- Utilities for creating configurations
-- local util = require "formatter.util"

formatter.setup({
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  -- Need to install formatters
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,
    },
    -- python formatter
    python = {
      -- require("formatter.filetypes.python") this uses all the formatters rather than specify specifics.
      require("formatter.filetypes.python").isort,
      require("formatter.filetypes.python").black,
    },
    css = {
      require("formatter.filetypes.css"),
    },
    javascript = {
      require("formatter.filetypes.javascript"),
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact"),
    },
    json = {
      require("formatter.filetypes.json").fixjson,
    },
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})
