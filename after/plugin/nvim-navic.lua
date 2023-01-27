local name = 'lualine'
local module = require(name)
local navic = require('nvim-navic')
module.setup {
  sections = {
    lualine_c = {
      { navic.get_location, cond = navic.is_available },
      'filename',
    },
  },
}
