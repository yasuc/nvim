-- browser setup for Markdown Preview
if vim.fn.has("mac") == 1 then
	vim.cmd([[
  function OpenMarkdownPreview (url)
  execute "silent ! open -a Firefox -n --args --new-window " . a:url
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])
elseif vim.fn.has("win64") == 1 then
	vim.cmd([[
  function OpenMarkdownPreview (url)
  execute "silent ! chrome --new-window --app=" . a:url
  endfunction
]])
else
	vim.cmd([[
  function OpenMarkdownPreview (url)
  execute "silent ! chrome --new-window --app=" . a:url
  endfunction
]])
end

vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
