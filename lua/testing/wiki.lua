local wikipath = vim.env.HOME .. '/OneDrive - PROVARIS GMBH/wiki'
if vim.fn.isdirectory(wikipath) == 0 then
  wikipath = vim.env.HOME .. '/wiki'
end

vim.g.vimwiki_list = {{path = wikipath, syntax = 'markdown', ext = '.md'}}

vim.g.wiki_root=wikipath
