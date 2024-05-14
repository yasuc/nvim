-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd([[
function OpenMarkdownPreview (url)
  execute "silent ! chrome --new-window --app=" . a:url
endfunction
]])

vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
