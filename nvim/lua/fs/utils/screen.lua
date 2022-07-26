local screen = { }

screen.small_screen =  140

function screen.if_narrow(small_option, large_option)
  if vim.o.columns <= screen.small_screen then
    return small_option
  else
    return large_option
  end
end

return screen
