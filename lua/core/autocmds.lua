if vim.fn.has "nvim-0.7" then
  local api = vim.api

  local termGrp = api.nvim_create_augroup("terminal_job", { clear = true })
  api.nvim_create_autocmd("TermOpen", { command = "startinsert", group = termGrp, })
  api.nvim_create_autocmd("TermOpen", { command = "setlocal listchars= nonumber norelativenumber", group = termGrp, })
  api.nvim_create_autocmd("TermOpen", { command = "setlocal statusline=%{b:term_title} listchars= nonumber norelativenumber", group = termGrp, })
  api.nvim_create_autocmd("TermOpen", { command = [[tnoremap <C-w> <C-\><C-n><C-w>]], group = termGrp, })
  api.nvim_create_autocmd("TermOpen", { command = [[tnoremap <silent> <C-[><C-[> <C-\><C-n>]], group = termGrp, })

  -- Highlight on yank
  local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
  api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank {on_visual = false}",
    group = yankGrp,
  })

else
  local cmd = vim.cmd

  -- Highlight on yank
  cmd [[
    augroup YankHighlight
      autocmd!
      autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
  ]]

end
