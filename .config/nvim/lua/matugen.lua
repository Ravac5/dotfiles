local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#1f1c21", -- Default Background
    base01 = "#342f37", -- Lighter Background (status bars)
    base02 = "#2f2a31", -- Selection Background
    base03 = "#6e6574", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#b4afb6", -- Dark Foreground (status bars)
    base05 = "#f2f2f3", -- Default Foreground
    base06 = "#f2f2f3", -- Light Foreground
    base07 = "#f2f2f3", -- Lightest Foreground
    -- Accent colors
    base08 = "#fd4663", -- Variables, XML Tags, Errors
    base09 = "#cc6688", -- Integers, Constants
    base0A = "#675cd6", -- Classes, Search Background
    base0B = "#bb67e4", -- Strings, Diff Inserted
    base0C = "#e996b1", -- Regex, Escape Chars
    base0D = "#cf93ec", -- Functions, Methods
    base0E = "#9d96e9", -- Keywords, Storage
    base0F = "#900017", -- Deprecated, Embedded Tags
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
