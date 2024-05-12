" NVIM QT
if exists('g:GuiLoaded')
  let s:fontsize = 9
  function! AdjustFontSize(amount)
    let s:fontsize = s:fontsize+a:amount
    :execute "GuiFont! JetBrainsMono\ NF:h" . s:fontsize
  endfunction

  noremap <C-Shift>+ :call AdjustFontSize(1)<CR>
  noremap <C-Shift>- :call AdjustFontSize(-1)<CR>
  
  noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
  noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
  inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
  inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

  GuiFont! JetBrainsMono\ NF:h9
  GuiTabline 0
  GuiPopupmenu 0
  GuiLinespace 1
endif
