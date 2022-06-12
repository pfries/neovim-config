vim.cmd [[
try
  colorscheme onedarker
catch /^Vim\%((\a\+)\)\=:E185/
  echom "Could not requested colorscheme! Falling back on default."
  colorscheme default
  set background=dark
endtry
]]
