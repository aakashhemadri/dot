" coc.nvim configuration
let g:coc_data_home = "$XDG_CONFIG_HOME/vim/coc"
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-go',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-stylelint',
      \ 'coc-python',
      \ 'coc-angular',
      \ 'coc-clangd',
      \ 'coc-cmake',
      \ 'coc-css',
      \ 'coc-cssmodules',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-jedi',
      \ 'coc-markdownlint',
      \ 'coc-metals',
      \ 'coc-omnisharp',
      \ 'coc-sql',
      \ 'coc-svg',
      \ 'coc-template',
      \ 'coc-xml',
      \ 'coc-yaml',
      \ ]
"      \ 'coc-rust-analyser',
"      \ 'coc-git',
hi CocErrorSign   guifg=#FDB3B0 guibg=#cc241d
hi CocWarningSign guifg=#FFECB9 guibg=#fabd2f
hi CocInfoSign    guifg=#CFE3DC guibg=#83a598
hi CocHintSign    guifg=#DCEFD5 guibg=#8ec07c

hi CocErrorFloat   guifg=#fbf1c7
hi CocWarningFloat guifg=#fbf1c7
hi CocInfoFloat    guifg=#fbf1c7
hi CocHintFloat    guifg=#fbf1c7
