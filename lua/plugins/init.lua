-- ~/.config/nvim/lua/plugins/init.lua
-- All plugin specifications

return {
  require("plugins.ui"),
  require("plugins.treesitter"),
  require("plugins.lsp"),
  require("plugins.completion"),
  require("plugins.telescope"),
  require("plugins.editing"),
  require("plugins.formatting"),
  require("plugins.git"),
}
