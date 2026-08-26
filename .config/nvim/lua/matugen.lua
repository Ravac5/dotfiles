local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#10202d", -- Default Background
    base01 = "#1b354b", -- Lighter Background (status bars)
    base02 = "#183043", -- Selection Background
    base03 = "#616a71", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#afb3b6", -- Dark Foreground (status bars)
    base05 = "#f2f2f3", -- Default Foreground
    base06 = "#f2f2f3", -- Light Foreground
    base07 = "#f2f2f3", -- Lightest Foreground
    -- Accent colors
    base08 = "#fd4663", -- Variables, XML Tags, Errors
    base09 = "#9566cc", -- Integers, Constants
    base0A = "#5c60d6", -- Classes, Search Background
    base0B = "#67aae4", -- Strings, Diff Inserted
    base0C = "#bc96e9", -- Regex, Escape Chars
    base0D = "#93c2ec", -- Functions, Methods
    base0E = "#9699e9", -- Keywords, Storage
    base0F = "#8f0118", -- Deprecated, Embedded Tags
  })
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["matugen"] = nil
    require("matugen").setup()
  end)
)

return M
