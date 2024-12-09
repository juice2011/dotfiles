require("tkp")
local o = vim.opt
o.number = true
o.expandtab = true
o.tabstop = 3
o.shiftwidth = 3

o.foldmethod = "indent"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 9999
