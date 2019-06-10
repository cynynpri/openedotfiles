let s:schemename = 'desert'

nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

"括弧の補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [ []<Left>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

if &compatible
  set nocompatible
endif

set noerrorbells
set noswapfile
"set number
set ruler
set laststatus=2
set backspace=indent,eol,start
set termguicolors
set fenc=utf-8
set title
set autoread
set showcmd
"set cursorline
"set cursorcolumn
set virtualedit=onemore
set visualbell
set showmatch
set matchtime=1
"set tabstop=2
"set shiftwidth=2
set ignorecase
set incsearch
set wrapscan
set hlsearch
set history=100
set hidden
set nobackup
" set paste
set display=lastline
set pumheight=5
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,cp932
set ambiwidth=double
set wildmenu wildmode=list:full
set smartindent
set autoindent
set list listchars=tab:\▸\-,trail:-,eol:↲,extends:»,precedes:«,nbsp:␣

" python host
let g:python3_host_prog = $HOME . '/.pyenv/shims/python3'

if has('nvim')
  " term settings
  nnoremap <A-j> <C-w>w
  inoremap <A-j> <Esc><C-w>w
  tnoremap <A-j> <C-\><C-n><C-w>w
  " ウィンドウ間を逆に移動
  noremap  <A-k> <C-w>W
  inoremap <A-k> <Esc><C-w>W
  tnoremap <A-k> <C-\><C-n><C-w>W
  " 他のウィンドウを閉じて最大化する
  noremap  <A-o> <C-w>o
  inoremap <A-o> <Esc><C-w>o
  tnoremap <A-o> <C-\><C-n><C-w>o
  " コマンドラインモードに移行（これは英語キーボードの場合です）
  noremap  <A-;> :
  inoremap <A-;> <Esc><C-o>:
  tnoremap <A-;> <C-\><C-n><C-w>:
  " 検索に移行
  noremap  <A-/> /
  inoremap <A-/> <Esc><C-o>/
  tnoremap <A-/> <C-\><C-n>/
  autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif

endif

function! s:colorscheme_init()
  if s:schemename == 'iceberg'
    colorscheme iceberg
  elseif s:schemename == 'onedark'
    colorscheme onedark
  elseif s:schemename == 'desert'
    colorscheme desert
  elseif s:schemename == 'molokai'
    colorscheme molokai
  elseif s:schemename == 'solarized-dark'
    set background=dark
    colorscheme solarized
  endif
  if s:schemename == 'iceberg' || s:schemename == 'onedark'
    let g:lightline = {
      \ 'colorscheme' : s:schemename
      \ }
  endif
endfunction

"dein Scripts--------------------------
"if &compatible
  "set nocompatible                       " Be iMproved
"endif

" Required:
set runtimepath+=$HOME/dotfiles/dein/repos/github.com/Shougo/dein.vim

" Required:
let s:dein_dir = $HOME . '/dotfiles/dein'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  "Let dein manage dein
  " Required:
  call dein#add(s:dein_dir . '/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this :
  "call dein#add('Shougo/neosnippet.vim')
  let s:toml_dir  = $HOME      . '/.vim/userconfig'
  let s:toml      = s:toml_dir . '/plugin.toml'
  let s:lazy_toml = s:toml_dir . '/plugin_lazy.toml'

  call dein#load_toml(s:toml,     {'lazy': 0})
  call dein#load_toml(s:lazy_toml,{'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"End dein Scripts----------------------------------

if executable('pyls')
  au user lsp_setup call lsp#register_server({
    \ 'name' : 'pyls',
    \ 'cmd' : {server_info->['pyls']},
    \ 'whitelist': ['python','py'],
    \ })
endif

if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'typescript-languaage-server',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
    \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
    \ 'whitelist': ['typescript', 'typescript.tsx'],
    \ })
endif

let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

let g:lsp_signs_error = {'text': 'x'}
let g:lsp_signs_warning = {'text': '!'}
let g:asyncomplete_auto_popup = 1

function! s:tab_size_auto_setting()
  if &filetype == 'python' || &filetype == 'Java'
    set tabstop=4
    set shiftwidth=4
  else
    set tabstop=2
    set shiftwidth=2
  endif
  set expandtab
endfunction

let g:ale_linters = {
  \ 'python': ['pydocstyle', 'flake8'],
  \ }
    
let g:ale_fixers = {
  \ 'python': ['autopep8'],
  \ }

let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_pydocstyle_executable = g:python3_host_prog
let g:ale_python_pydocstyle_options = '-m pydocstyle'
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'

" fix mapping.
nnoremap <silent> <Leader>x <Plug>(ale_fix)

let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:my_settings_initable = 1 

if g:my_settings_initable == 1 
  call s:colorscheme_init()
  call s:tab_size_auto_setting()
endif

