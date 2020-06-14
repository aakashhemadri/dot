" Key mappings
"
" My personal mappings for various commands and key combinations

let mapleader = "'"
" Smart save: Attempt to use SudoWrite if the file isn't writeable
nnoremap <expr> <C-s>
  \ expand('%') != '' && getfperm(expand('%')) != '' && !filewritable(expand('%')) ?
  \ ':write suda://%<CR>' : ':write<CR>'

" Remap Ctrl+C to be the same as escape without telling us to use :q to quit.
" the 'r' command is special cased to a NOP.
nnoremap r<C-c> <NOP>
nnoremap  <C-c> <NOP>
inoremap  <C-c> <Esc>
nnoremap  <C-c> <Esc>

" Disable EX mode
map Q <Nop>

""" Buffer Managment
nnoremap <silent>       <C-]>  :bnext<CR>
nnoremap <silent>       <C-[>  :bprev<CR>
nnoremap <silent><expr> <C-q> ':confirm '.(NoBuffersOpen() ? 'quit' : 'BD').'<CR>'

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
map <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

""" Window movment
nnoremap <Tab> <C-W><C-w>
nnoremap <S-Tab> <C-W><S-W>

""" fzf
nmap <Leader><Leader> :GFiles<CR>
nmap <Leader>p        :Files<CR>
nmap <Leader>b        :Buffers<CR>

""" Tabularizatins
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /^[^:]*:\zs/l0r1<CR>
vmap <Leader>a: :Tabularize /^[^:]*:\zs/l0r1<CR>

" Quick system copy and paste
nmap <Leader>y "+y
nmap <Leader>Y "+Y
vmap <Leader>y "+y

" Yank file path
nmap <silent><Leader>yp :let @+ = expand('%:p')<CR>:echom "Path copied to system clipboard"<CR>

" Clear search / quickfix
nnoremap <silent><C-l> :nohlsearch<CR>:cclose<CR>:lclose<CR>:call clearmatches()<CR>

" Remove space
nmap <Leader>ds dipO<Esc>

" Don't move on *
nnoremap <silent> *
  \ :let stay_star_view = winsaveview()<CR>*
  \ :call winrestview(stay_star_view)<CR>

" Search for selected text
vnoremap <silent> * :<C-U>
  \ let old_reg = getreg('"')<Bar>
  \ let old_regtype = getregtype('"')<Bar>
  \ let stay_star_view = winsaveview()<CR>
  \ gvy/<C-R><C-R>=substitute(
  \ escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \ gV:call setreg('"', old_reg, old_regtype)<CR>
  \ :call winrestview(stay_star_view)<CR>

" Search using Rg
nnoremap <leader>/ :Rg<CR>

" Source line and selection in vim
vnoremap <leader>S y:execute @@<CR>:echo 'Sourced selection'<CR>
nnoremap <leader>S ^vg_y:execute @@<CR>:echo 'Sourced line'<CR>

" Repeat the lmast executed macro
nnoremap , @@

noremap <C-`> :Ttoggle

map <C-N> :NERDTreeToggle<CR>

if match(&runtimepath, 'scrooloose/nerdtree') != -1
  " NERDTree
  " Open NERDTree if no files are specified
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  
  " Close NERDTree if it is the last window that is open.
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " NERDTree starts when opening a directory.
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

  " NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

endif

" s for substitute
"nmap s <plug>(SubversiveSubstitute)
"nmap ss <plug>(SubversiveSubstituteLine)
"nmap S <plug>(SubversiveSubstituteToEndOfLine)
