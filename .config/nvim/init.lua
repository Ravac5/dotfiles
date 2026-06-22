-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("matugen").setup()

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end
