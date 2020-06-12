" coc omnicompletions
if match(&runtimepath, 'coc.nvim') != -1
  " Use tab like you would expect
  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
  inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gr <Plug>(coc-references)

  " Trigger info window
  nnoremap <silent> <Space> :call CocActionAsync('doHover')<CR>

  " Diagnostic navigation
  nmap <silent> <C-p> <Plug>(coc-diagnostic-prev)
  nmap <silent> <C-n> <Plug>(coc-diagnostic-next)
  
  " Show signature help when jumping between placeholders
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
endif