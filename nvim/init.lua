_G.dd = function(...)
  require("util.debug").dump(...)
end
vim.print = _G.dd

require("josean.core")
require("josean.lazy")
