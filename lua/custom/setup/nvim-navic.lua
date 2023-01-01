return function(module)
  require('lualine').setup {
    sections = {
      lualine_c = {
        { module.get_location, cond = module.is_available },
        'filename',
      }
    }
  }
end
