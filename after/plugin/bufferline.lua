local name = 'bufferline'
local module = require(name)
module.setup {
  options = {
    offsets = {
      {
        filetype = "filetree",
        text = "",
        highlight = "Explorer",
        text_align = "left",
      },
    },
  },
}
