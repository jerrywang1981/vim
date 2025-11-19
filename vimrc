"
"       _                       __          __
"      | |                      \ \        / /
"      | | ___ _ __ _ __ _   _   \ \  /\  / /_ _ _ __   __ _
"  _   | |/ _ \ |__| |__| | | |   \ \/  \/ / _| | |_ \ / _` |
" | |__| |  __/ |  | |  | |_| |    \  /\  / (_| | | | | (_| |
"  \____/ \___|_|  |_|   \__| |     \/  \/ \__|_|_| |_|\__| |
"                         __/ |                         __/ | * @jerrywang1981 github  ',
"                        |___/                         |___/  * https://jerrywang1981.github.io  ',
"                                                             * jerrywang1981@outlook.com ',
"
"

if v:version < 801 | finish | endif

let g:mapleader = ","
let g:maplocalleader = ","

if !exists('g:env')
  if has('win64') || has('win32') || has('win16')
    let g:env = 'WINDOWS'
  else
    let g:env = toupper(substitute(system('uname'), '\n', '', ''))
  endif
endif

if g:env =~ 'WINDOWS'
  let data_dir = $HOME . '/vimfiles'
elseif g:env =~ 'LINUX'
  let data_dir = $HOME . '/.vim'
endif

" windows (powershell)
" iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/vimfiles/autoload/plug.vim -Force
" linux
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if g:env =~ 'WINDOWS' && empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!powershell -command  "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni ' .. data_dir ..'/autoload/plug.vim -Force"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
elseif g:env =~ 'LINUX' && empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
let g:plug_timeout = 360
let g:plug_threads = 4
let g:plug_shallow = 1

try
  packadd! hlyank
  packadd! comment
  packadd! editorconfig
  packadd! matchit
  packadd! nohlsearch
  packadd! cfilter
catch /.*/
endtry

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-commentary'
if empty(globpath(&runtimepath, 'plugin/comment.vim')) | Plug 'tpope/vim-commentary' | endif
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-rooter'

" if v:version < 901 | Plug 'machakann/vim-highlightedyank' | endif
if empty(globpath(&runtimepath, 'plugin/hlyank.vim')) | Plug 'machakann/vim-highlightedyank' | endif

Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'

"Plug 'elzr/vim-json', { 'for': 'json'  }
"Plug 'honza/dockerfile.vim', { 'for': 'Dockerfile' }

if empty(globpath(&runtimepath, 'plugin/editorconfig.vim')) | Plug 'editorconfig/editorconfig-vim' | endif

Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim', { 'for': ['html', 'htmlangular','css', 'vue'] }
" Plug 'nicwest/vim-http', { 'for': ['http'] }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
" Plug 'catppuccin/vim', { 'as': 'catppuccin' }
" Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'voldikss/vim-floaterm'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" Snippets are separated from the engine. Add this if you want them:
Plug 'sbdchd/neoformat'
Plug 'jerrywang1981/bookmarks.vim'
"Plug 'jerrywang1981/morse.vim'

Plug 'justinmk/vim-sneak'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'

" snippets
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Plug 'bleakwind/vim-filelist', { 'on': 'FilelistToggle' }

" linter
" Plug 'rhysd/vim-lsp-ale'
" Plug 'dense-analysis/ale'

if has('python3')
  Plug 'puremourning/vimspector'
endif

if has('sound')
  Plug 'jerrywang1981/vim-keystroke'
endif

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'liuchengxu/vim-which-key'

" database
Plug 'tpope/vim-dadbod', { 'on': ['DBUI', 'DBUIToggle'] }
Plug 'kristijanhusak/vim-dadbod-ui', { 'on': ['DBUI', 'DBUIToggle'] }
Plug 'kristijanhusak/vim-dadbod-completion', { 'on': ['DBUI', 'DBUIToggle'] }

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

"filetype plugin indent on   " enable loading indent file for filetype
"syntax on                   " syntax highlighting

" runtime! plugin/sensible.vim

set path+=**
set clipboard+=unnamed      " use the clipboards of vim and win
set guioptions+=a               " Visual selection automatically copied to the clipboard
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove scrollbar
set guioptions-=L  "remove scrollbar

set selectmode=mouse,key
set whichwrap+=<,>,h,l
set diffopt+=vertical
set completeopt=menuone,noinsert,noselect,preview
set shortmess+=cF
set belloff=all
" set display=lastline
set sessionoptions+=unix,slash

set hlsearch
set ignorecase
set smartcase
set termguicolors
set showmatch
set noshowcmd
set visualbell
set hidden
set noshowmode

set showtabline=2
set scrolloff=5
set updatetime=500
" set timeoutlen=1000
set splitright

set number
set relativenumber
set cursorline
set cursorcolumn

set signcolumn=yes
set colorcolumn=80
set foldlevel=99

set noswapfile
set autoindent
set cindent
set expandtab
set nostartofline

set tabstop=2
set softtabstop=2
set shiftwidth=2

let g:loaded_vimballPlugin = 1
let g:loaded_tutor_mode_plugin = 1

" let g:loaded_netrw       = 1
" let g:loaded_netrwPlugin = 1

" let g:netrw_liststyle= 3
" let g:netrw_banner = 0
" let g:netrw_winsize = 25

" if !has('gui_running')
"   set t_Co=256
"   set t_ut=
" endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/venv/*,*/node_modules/*

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if has("persistent_undo")
  let target_path = expand('~/.undo_dir')
  " create the directory and any parent directories
  " if the location does not exist.
  if !isdirectory(target_path)
    call mkdir(target_path, "p", 0700)
  endif

  let &undodir=target_path
  set undofile
endif

if has("wildignore") == 1 && has("popupwin") == 1
  try
    set wildoptions=pum
  catch /.*/
  endtry
endif

set background=dark
colorscheme desert
" colorscheme evening
"colorscheme elflord
"colorscheme quiet
" colorscheme industry
" try
"   colorscheme PaperColor
" catch /.*/
"   colorscheme desert
" endtry

" highlight ColorColumn guibg=#666666
highlight EndOfBuffer guifg=bg

tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'


"-------------------------key mappings---------------------------------

nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>et <cmd>execute 'tabedit ' .. $HOME .. '/todo.md'<cr>
nmap <silent> <leader>en <cmd>execute 'tabedit ' .. $HOME .. '/note.md'<cr>

noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <c-h> <left>
inoremap <c-l> <right>
noremap <c-left> :vert resize -5<cr>
noremap <c-right> :vert resize +5<cr>
noremap <c-up> :resize +5<cr>
noremap <c-down> :resize -5<cr>
inoremap jk <esc>
inoremap kj <esc>

" nnoremap Y y$
" inoremap <C-U> <C-G>u<C-U>
" inoremap <C-W> <C-G>u<C-W>
" xnoremap * y/\V<C-R>"<CR>
" xnoremap # y?\V<C-R>"<CR>
" nnoremap & :&&<CR>


" nerdtree
map <silent> <space>1 :NERDTreeToggle<cr>
" map <silent> <space>1 <cmd>FilelistToggle<cr>
" map <silent> <space>1 :Lex<cr>


" vim-fugitive

augroup FugitiveGroup
  au!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

augroup ColorColumn
  au!
  autocmd FileType fugitive,help,nerdtree,startify set colorcolumn=
augroup END

" database
let g:db_ui_use_nerd_fonts = 1
autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
nnoremap <silent> <space>td <cmd>DBUIToggle<cr>

" git status from gitgutter
function! GitStatus()
  let l:ft = ['fugitive', 'startify', 'help']
  if index(l:ft, &ft) >= 0 | return "" | endif
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'modified', 'gitstatus', 'jerry', 'filename' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers']  ],
      \   'right': [ ['close']  ]
      \ },
      \ 'component': {
      \   'jerry': ' Jerry Wang'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'gitstatus': 'GitStatus'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

" vim-startify

let g:startify_change_to_vcs_root=1
let g:startify_change_to_dir=0
let g:startify_files_number=5
let g:startify_enable_special=0
let g:startify_lists = [
      \ { 'type' : 'files', 'header' : [ "   MRU" ] }
      \ ]

try
  let g:startify_custom_header =
        \ startify#center([
        \ '       _                       __          __                  ',
        \ '      | |                      \ \        / /                  ',
        \ '      | | ___ _ __ _ __ _   _   \ \  /\  / /_ _ _ __   __ _    ',
        \ '  _   | |/ _ \ |__| |__| | | |   \ \/  \/ / _| | |_ \ / _` |   ',
        \ ' | |__| |  __/ |  | |  | |_| |    \  /\  / (_| | | | | (_| |   ',
        \ '  \____/ \___|_|  |_|   \__| |     \/  \/ \__|_|_| |_|\__| |   ',
        \ '                         __/ |                         __/ | * @jerrywang1981 github  ',
        \ '                        |___/                         |___/  * https://jerrywang1981.github.io  ',
        \ '                                                             * jerrywang1981@outlook.com ',
        \ '                                                               ',
        \ '                                                               ',
        \ '           .--- . .-. .-. -.--  .-- .- -. --.                  ',
        \ ])

  let g:startify_custom_footer = startify#center([
        \ '春风杨柳万千条, 六亿神州尽舜尧',
        \ '红雨随心翻作浪, 青山着意化为桥',
        \ '天连五岭银锄落, 地动三河铁臂摇',
        \ '借问瘟君欲何往, 纸船明烛照天烧',
        \ '                               七律二首 送瘟神',
        \ ])
catch
endtry

function! GetUniqueSessionName()
  let path = fnamemodify(getcwd(), ':p:~')
  let path = empty(path) ? 'no-project' : path
  let branch = gitbranch#name()
  let branch = empty(branch) ? '' :  branch
  return substitute(substitute(substitute(substitute(path . branch, '^\~\', '', 'g'), '^\~/', '', 'g'), '/', '-', 'g'), '\', '-', 'g') . '.vim'
endfunction

" autocmd User        StartifyReady silent execute 'SLoad '  . GetUniqueSessionName()
" autocmd VimLeavePre *             execute 'SSave! ' . GetUniqueSessionName()

function! s:SessionLoadFunction(files)
  if len(a:files) < 2
    return
  endif

  let l:file = get(a:files, 1)
  if l:file == ''
    echom 'wrong'
  endif

  silent execute 'SLoad '  . l:file
endfunction

function! <SID>SaveSession(...)
  if a:0 == 0
    execute 'SSave! ' . GetUniqueSessionName()
  else
    execute 'SSave! ' . a:1
  endif
endfunction

command! -nargs=? SessionSave call <SID>SaveSession(<f-args>)
command! -nargs=? SessionLoad execute 'SLoad ' . GetUniqueSessionName()
command! -bang -nargs=0 Sessions call fzf#vim#files(
      \ startify#get_session_path(),
      \ {
      \   'sink*': function('s:SessionLoadFunction'),
      \   'options': ['--prompt', 'Sessions>']
      \ },
      \ <bang>0)

" vim-http
" let g:vim_http_split_vertically = 1
" let g:vim_http_right_below = 1
" let g:vim_http_tempbuffer = 1

" lightline-bufferline
let g:lightline#bufferline#show_number = 3
let g:lightline#bufferline#ordinal_number_map = {
      \ 0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
      \ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉' }
let g:lightline#bufferline#enable_devicons = 1
" let g:lightline#bufferline#shorten_path = 1

function <SID>GoToBuffer()
  let l:buf = str2nr(input("Which buffer:"))
  if l:buf > 0
    call lightline#bufferline#go(l:buf)
  endif
endfunction

nmap <space>bb :<c-u>call <SID>GoToBuffer()<cr>

nmap <space>b1 <Plug>lightline#bufferline#go(1)
nmap <space>b2 <Plug>lightline#bufferline#go(2)
nmap <space>b3 <Plug>lightline#bufferline#go(3)
nmap <space>b4 <Plug>lightline#bufferline#go(4)
nmap <space>b5 <Plug>lightline#bufferline#go(5)
nmap <space>b6 <Plug>lightline#bufferline#go(6)
nmap <space>b7 <Plug>lightline#bufferline#go(7)
nmap <space>b8 <Plug>lightline#bufferline#go(8)
nmap <space>b9 <Plug>lightline#bufferline#go(9)
nmap <space>b0 <Plug>lightline#bufferline#go(10)

" vim-highlightedyank
let g:highlightedyank_highlight_duration = 500
" hlyank
let g:hlyank_duration = 500

" editorconfig

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
autocmd FileType gitcommit,nerdtree let b:EditorConfig_disable = 1


" https://github.com/suy/vim-context-commentstring
" the follow code was taken from above website
let g:comment_table = {
      \ 'vue': {
      \   'htmlTag': 's:<!--,m:    ,e:-->',
      \   'vue_typescript': 's1:/*,mb:*,ex:*/,://',
      \   'cssStyle': 's1:/*,mb:*,ex:*/,://',
      \   }
      \ }
let g:commentstring_table = {
      \ 'vue': {
      \   'javaScript'  : '//%s',
      \   'cssStyle'    : '/*%s*/',
      \   'vue_scss'    : '/*%s*/',
      \   }
      \ }

function! <SID>UpdateComments()
  let stack = synstack(line('.'), col('.'))
  call reverse(stack)
  if !empty(stack)
    for name in map(stack, 'synIDattr(v:val, "name")')
      if has_key(g:comment_table[&filetype], name)
        let &l:comments = g:comment_table[&filetype][name]
        return
      endif
    endfor
  endif
  let &l:comments = b:original_comments
endfunction

function! <SID>UpdateCommentString()
  let stack = synstack(line('.'), col('.'))
  if !empty(stack)
    for name in map(stack, 'synIDattr(v:val, "name")')
      if has_key(g:commentstring_table[&filetype], name)
        let &l:commentstring = g:commentstring_table[&filetype][name]
        return
      endif
    endfor
  endif
  let &l:commentstring = b:original_commentstring
endfunction

function! s:setup_comment()
  augroup CommentstringEnabled
    " Clear previous autocommands first in all cases, in case the filetype
    " changed from something in the table, to something NOT in the table.
    autocmd! CursorMoved <buffer>
    if !empty(&filetype) && has_key(g:commentstring_table, &filetype)
      let b:original_commentstring=&l:commentstring
      autocmd CursorMoved <buffer> call <SID>UpdateCommentString()
    endif
    if !empty(&filetype) && has_key(g:comment_table, &filetype)
      let b:original_comments=&l:comments
      autocmd CursorMoved <buffer> call <SID>UpdateComments()
    endif
  augroup END
endfunction

augroup CommentstringBootstrap
  autocmd!
  autocmd FileType vue call s:setup_comment()
augroup END

autocmd FileType vue syntax sync fromstart

function! s:create_editorconfig()
  let l:config = fnamemodify(expand($HOME . '/.editorconfig'), ':p')
  if filereadable(l:config)
    echom "The file " . l:config . " exists."
    return
  endif
  let l:text = [
        \ "# EditorConfig is awesome: https://EditorConfig.org",
        \ "",
        \ "# top-most EditorConfig file",
        \ "root = true",
        \ "",
        \ "# Unix-style newlines with a newline ending every file",
        \ "[*]",
        \ "charset = utf-8",
        \ "indent_style = space",
        \ "end_of_line = lf",
        \ "indent_size = 2",
        \ "insert_final_newline = true",
        \ "trim_trailing_whitespace = true",
        \ "",
        \ "",
        \ "# 4 space indentation",
        \ "[*.py]",
        \ "indent_size = 4",
        \ "",
        \ "[*.java]",
        \ "indent_size = 2",
        \ "",
        \ "[*.rs]",
        \ "indent_size = 4",
        \ "",
        \ "# Tab indentation (no size specified)",
        \ "[Makefile]",
        \ "indent_style = tab",
        \ "",
        \ "# Indentation override for all JS under lib directory",
        \ "[lib/**.js]",
        \ "indent_style = space",
        \ "indent_size = 2",
        \ "",
        \ "# Matches the exact files either package.json or .travis.yml",
        \ "[{package.json,.travis.yml}]",
        \ "indent_style = space",
        \ "indent_size = 2",
        \ ]
  call writefile(l:text, l:config)
  echom "The file " . l:config . " was created"
endfunction

command! -nargs=0 CreateEditorConfig call s:create_editorconfig()

function! s:create_git_config()
  let l:config = fnamemodify(expand($HOME . '/.gitconfig'), ':p')
  if filereadable(l:config)
    echom "The file " . l:config . " exists."
    return
  endif
  let l:text = [
        \ "[user]",
        \ "    name = Jerry Wang",
        \ "    email = jerrywang1981@outlook.com",
        \ "    signingkey = jerrywang1981@outlook.com",
        \ "[commit]",
        \ "    gpgsign = true",
        \ "[tag]",
        \ "    gpgSign = true",
        \ "[pull]",
        \ "    rebase = true",
        \ ]
  call writefile(l:text, l:config)
  echom "The file " . l:config . " was created"
endfunction

command! -nargs=0 CreateGitConfig call s:create_git_config()

" vimscript
autocmd FileType vim nmap <buffer> <leader>= gg=G''

" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,htmlangular,css EmmetInstall

" vim-sneak
let g:sneak#label = 1
let g:sneak#map_netrw = 0
let g:sneak#use_ic_scs = 1

" vim-rooter
let g:rooter_silent_chdir = 1
let g:rooter_patterns = ['.git']

" fzf
nnoremap <silent> <C-p> <cmd>GFiles<CR>
nnoremap <silent> <leader>ff <cmd>Files<CR>
nnoremap <silent> <leader>fgS <cmd>Sessions<CR>
nnoremap <silent> <leader>fgB <cmd>BookmarksFzf<CR>
nnoremap <silent> <leader>fb <cmd>Buffers<CR>
nnoremap <silent> <leader>fh <cmd>History<CR>
nnoremap <silent> <leader>fgg <cmd>RG<CR>
nnoremap <silent> <leader>fgh <cmd>RgAll<CR>
nnoremap <silent> <leader>fg/ <cmd>BLines<CR>
nnoremap <silent> <leader>fq :<c-u>call <SID>FzfQuickfixFilter()<CR>
"nnoremap <silent> <leader>fgw :<c-u>RG <c-r><c-w><CR>

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val  }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit'}

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-q:select-all+accept'

if executable('fd')
  let $FZF_DEFAULT_COMMAND = 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --ignore-file .gitignore'
elseif executable('fdfind')
  let $FZF_DEFAULT_COMMAND = 'fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git --ignore-file .gitignore'
endif

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.95, 'relative': v:true  }  }

let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['up,50%', 'ctrl-/'] " actually in windows it is ctrl+minus


function! RgRunner(...)
  let command = 'rg --column --line-number --no-heading --color=always --smart-case '
  if a:0 == 1
    return command . ' -- ' . a:1
  endif

  let args = copy(a:000)
  let sArgs = split(join(args, ' '), ' -- ')
  if len(sArgs) == 2
    let command = command . sArgs[1] . ' -- ' . sArgs[0]
  else
    let command = command . join(args, ' ')
  endif
  return command
endfunction


if executable('rg')
  command! -bang -nargs=* Rg1 call fzf#vim#grep(RgRunner(<f-args>), fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
  command! -bang -nargs=* RgAll call fzf#vim#grep2("rg --column --line-number --no-heading --color=always --smart-case --no-ignore --hidden -- ", <q-args>, fzf#vim#with_preview(), <bang>0)
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

" neoformat
"let g:neoformat_try_formatprg = 1
let g:neoformat_try_node_exe = 1
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_html = ['prettier']
let g:neoformat_enabled_markdown = ['prettier']
nmap <leader>= <cmd>Neoformat<CR>

" vim-floaterm
"let g:floaterm_wintype = 'vsplit'
let g:floaterm_keymap_new = "<leader>fc"
let g:floaterm_keymap_prev = "<leader>fp"
let g:floaterm_keymap_next = "<leader>fn"
let g:floaterm_keymap_toggle = "<space>4"
let g:floaterm_width = 0.95
let g:floaterm_height = 0.95

nnoremap <silent> <leader>fSl <cmd>FloatermSend<cr>
vnoremap <silent> <leader>fSl <cmd>FloatermSend<cr>

"big files

function! s:check_big_file(uri, bufnr)
  if empty(a:uri) || empty(a:bufnr)
    return
  endif

  let l:bufnr = str2nr(a:bufnr)
  let l:ft = getbufvar(l:bufnr, '&filetype', '')
  if l:ft == 'bigfile'
    return
  endif
  let l:bufname = bufname(l:bufnr)
  if l:bufname != a:uri
    return
  endif
  let l:bigfile = v:false
  let l:size = getfsize(l:bufname)
  if l:size <= 0
    return
  elseif l:size > 1.5 * 1024 * 1024
    let l:bigfile = v:true
  else
    let l:bufinfo = getbufinfo(l:bufname)
    if empty(l:bufinfo)
      return
    endif
    if l:bufinfo[0].linecount > 20000
      let l:bigfile = v:true
    endif
  endif

  if l:bigfile
    let l:answer = input("Do you want to enable bigfile for this buffer? (y/N):")
    if l:answer == "y"
      execute "NoMatchParen"
      call setbufvar(l:bufnr, '&filetype', 'bigfile')
      call setbufvar(l:bufnr, '&syntax', l:ft)
      call setbufvar(l:bufnr, '&foldmethod', 'manual')
      call setbufvar(l:bufnr, '&conceallevel', 0)
      call setbufvar(l:bufnr, '&wrap', v:false)
      call setbufvar(l:bufnr, '&foldenable', v:false)
    endif
  endif
endfunction

augroup bigfile
  au!
  autocmd FileType * call s:check_big_file(expand("<afile>"), expand("<abuf>"))
augroup END

"undotree
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
nnoremap <silent> <space>7 <cmd>UndotreeToggle<cr>

" vim-keystroke
"valid theme: 'default', 'bubble', 'mario', 'sword', 'typewriter'
if has('sound')
  let g:keystroke_theme = 'typewriter'
  autocmd VimEnter * KeyStrokeEnable
endif

"autopairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutToggle=''
let g:AutoPairsShortcutFastWrap=''
let g:AutoPairsShortcutJump=''
let g:AutoPairsMapCh=''
let g:AutoPairsShortcutBackInsert=''

" vim-lsp-settings
let g:lsp_settings = {
      \  'typescript-language-server': {
      \     'root_uri_patterns': ['.git']
      \  },
      \ 'eclipse-jdt-ls': {
      \   'initialization_options': {
      \     'extendedClientCapabilities': { 'classFileContentsSupport': v:true },
      \     'bundles': glob(data_dir . '/plugged/vimspector/gadgets/*/vscode-java-debug/server/com.microsoft.java.debug.plugin-*.jar', 1, 1)
      \     },
      \     'root_uri_patterns': ['.git']
      \   }
      \  }

let g:lsp_settings_filetype_typescript = ["vtsls", "typescript-language-server"]
let g:lsp_settings_filetype_vue = ["volar-server", "vtsls"]

if has('python3')
  " vimspector
  let g:vimspector_enable_mappings = 'HUMAN'
  let g:vimspector_java_hotcodereplace_mode = 'always'

  " for normal mode - the word under the cursor
  nmap <Leader>di <Plug>VimspectorBalloonEval
  " for visual mode, the visually selected text
  xmap <Leader>di <Plug>VimspectorBalloonEval

  nmap <space>Dtb <Plug>VimspectorBreakpoints
  nmap <space>Dtc <cmd>VimspectorShowOutput<cr>

  function! <SID>StartJavaDebug() abort
    let l:command_name =  'vscode.java.startDebugSession'
    let l:server_name = 'eclipse-jdt-ls'
    let l:bufnr = -1
    let l:sync = v:true  "get(a:params, 'sync', v:true)

    " create command.
    let l:command = { 'command': l:command_name }

    let l:servers = lsp#get_allowed_servers()
    " execute command on server.
    if !empty(l:server_name)
      call lsp#send_request(l:server_name, {
            \   'method': 'workspace/executeCommand',
            \   'params': l:command,
            \   'sync': l:sync,
            \   'on_notification': function('s:handle_execute_command', [l:server_name, l:command]),
            \ })
    endif
  endfunction

  function! s:handle_execute_command(server_name, command, data) abort
    if lsp#client#is_error(a:data['response'])
      call lsp#utils#error('Execute command failed on ' . a:server_name . ': ' . string(a:command) . ' -> ' . string(a:data))
    endif
    let l:dap_port = a:data['response']['result']
    call vimspector#Launch(v:false, { 'DAPPort': l:dap_port  },
          \ {
          \    "Java Attach": {
          \      "adapter": "vscode-java",
          \      "filetypes": [
          \        "java"
          \      ],
          \      "configuration": {
          \        "request": "attach",
          \        "hostName": "127.0.0.1",
          \        "port": "5005",
          \        "sourcePaths": [
          \          "${workspaceRoot}/src/main/java",
          \          "${workspaceRoot}/src/test/java"
          \        ],
          \        "breakpoints": {
          \          "exception": {
          \            "caught": "N",
          \            "uncaught": "N"
          \          }
          \        }
          \      }
          \    }
          \}
          \)
  endfunction

  autocmd FileType java nnoremap <silent> <buffer> <leader><F5> :call <SID>StartJavaDebug()<CR>
  " autocmd FileType java nnoremap <silent> <buffer> <F5> :call <SID>StartJavaDebug()<CR>
endif

" vim-filelist
" " Set 1 enable filelist (default: 0)
" let g:filelist_enabled = 1
" " Set 1 autostart filelist (default: 0)
" " let g:filelist_autostart = 1
" " Position of the filelist window: 'left' or 'right' (default: 'left')
" let g:filelist_position = 'left'
" " Width of the filelist window (default: 30)
" let g:filelist_winwidth = 30
" " Default directory to show (default: getcwd())
" let g:filelist_mainpath = getcwd()
" " Set 1 Show hidden files (default: 0)
" let g:filelist_showhide = 0
" " Set Bookmark place (default: $HOME.'/.vim/filelist')
" let g:filelist_datapath = data_dir . '/filelist'

" quickfix window

function! s:qf_delete(line1, line2)
  let l:min = min([a:line1, a:line2])
  if l:min < 1
    echom "line number should be greater than 1"
    return
  endif
  let l:lines = sort([a:line1, a:line2])
  let l:list = copy(getqflist())

  if l:lines[0] == 1
    let l:list = l:list[l:lines[1]:]
  elseif l:lines[1] == len(l:list)
    let l:list = l:list[:l:lines[0]-2]
  else
    let l:list = l:list[:l:lines[0]-2] + l:list[l:lines[1]:]
  endif
  call setqflist(l:list)
  if len(l:list) > 0
    call execute(l:lines[0] > len(l:list) ? len(l:list) : l:lines[0])
  endif
endfunction

function s:Qf_Lambda_filter(k, val)
  return  bufname(a:val["bufnr"]) .. ":" .. a:val["lnum"] .. ":" ..
        \ a:val["col"] .. ":" .. a:val["text"]
endfunction

function! <SID>FzfQuickfixFilter()
  if !exists("*fzf#run") || !exists("*fzf#wrap")
    return
  endif

  let l:qf_list = copy(getqflist())
  if len(l:qf_list) == 0
    return
  endif

  let l:qf_list_source = mapnew(l:qf_list, function('s:Qf_Lambda_filter'))

  function! s:FzfQuickfixFilter_S(lines) closure
    if len(a:lines) == 0
      return
    endif
    call filter(l:qf_list, { _, val ->
          \ index(a:lines, s:Qf_Lambda_filter(1, val)) >= 0
          \ })
    if len(l:qf_list) < 1
      return
    endif
    call setqflist(l:qf_list)

    try
      let l:first = l:qf_list[0]
      execute "buffer " .. l:first["bufnr"]
      execute l:first["lnum"]
      if has_key(l:first, 'col')
        call cursor(0, l:first["col"])
      endif
      normal! zvzz
    catch
    endtry
  endfunction

  call fzf#run(fzf#wrap({
        \ 'source': l:qf_list_source,
        \ 'sink*': function("s:FzfQuickfixFilter_S"),
        \ 'options': ['--ansi', '--multi',
        \ '--prompt', 'Quickfix>',
        \ '--bind', 'ctrl-a:select-all']
        \ }))

endfunction

" command! -nargs=0 Qfilter call <SID>FzfQuickfixFilter()

function! s:on_qf_open() abort
  command! -buffer -range -nargs=0 QfDelete call s:qf_delete(<line1>, <line2>)
  nmap <buffer> dd <cmd>QfDelete<cr>
  map <buffer> gq <cmd>cclose<cr>
endfunction

augroup QuickfixAuGroup
  autocmd!
  autocmd FileType qf call s:on_qf_open()
augroup END


" LSP config
" let g:lsp_diagnostics_enabled = 0         " disable diagnostics support
let g:lsp_fold_enabled = 0
let g:lsp_format_sync_timeout = 1000
" let g:lsp_inlay_hints_enabled = 1
let g:lsp_inlay_hints_mode = {
      \  'normal': ['curline'],
      \}

let g:lsp_document_code_action_signs_hint = {'text': '🚀'}
let g:lsp_diagnostics_signs_error = {'text': '🚨'}
let g:lsp_diagnostics_signs_warning = {'text': '⚠️' }
let g:lsp_diagnostics_signs_hint = {'text': '💡'}
let g:lsp_diagnostics_signs_information = {'text': 'ℹ️'}
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_align = "right"

" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> <c-]> <plug>(lsp-definition)
  nmap <buffer> gd <plug>(lsp-declaration)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> grr <plug>(lsp-references)
  nmap <buffer> gri <plug>(lsp-implementation)
  " nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> grn <plug>(lsp-rename)
  nmap <buffer> gra <plug>(lsp-code-action)
  nmap <buffer> [d <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]d <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)

  let l:servers = filter(lsp#get_allowed_servers(), 'lsp#capabilities#has_document_formatting_provider(v:val)')
  if len(l:servers) != 0
    nmap <buffer> <leader>= <plug>(lsp-document-format)
    vmap <buffer> <leader>= <plug>(lsp-document-range-format)
  endif
  " autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" asyncomplete.vim
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" Force refresh completion
" imap <c-space> <Plug>(asyncomplete_force_refresh)
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


function! s:sort_by_priority_preprocessor(options, matches) abort
  let l:items = []
  for [l:source_name, l:matches] in items(a:matches)
    for l:item in l:matches['items']
      if stridx(l:item['word'], a:options['base']) == 0
        let l:item['priority'] =
              \ get(asyncomplete#get_source_info(l:source_name),'priority',0)
        call add(l:items, l:item)
      endif
    endfor
  endfor

  let l:items = sort(l:items, {a, b -> b['priority'] - a['priority']})

  call asyncomplete#preprocess_complete(a:options, l:items)
endfunction

let g:asyncomplete_preprocessor = [function('s:sort_by_priority_preprocessor')]

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
      \ 'name': 'buffer',
      \ 'allowlist': ['*'],
      \ 'blocklist': ['go'],
      \ 'priority': 100,
      \ 'completor': function('asyncomplete#sources#buffer#completor'),
      \ 'config': {
      \    'max_buffer_size': 5000000,
      \  },
      \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'allowlist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#file#completor')
      \ }))

" disable auto enabled linter
" let g:lsp_ale_auto_enable_linter = v:false
" let g:ale_linters = {
"\ 'javascript': ['vim-lsp', 'eslint'],
"\ 'typescript': ['vim-lsp', 'tslint'],
" \ }


"
" vim-gitgutter
" let g:gitgutter_map_keys = 0


" vim-which-key
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> <space> :<c-u>WhichKey  '<space>'<CR>

let g:which_key_map_leader = {}
let g:which_key_map_leader.h = {
      \'name': '+hunk',
      \'p': 'preview',
      \'s': 'stage',
      \'u': 'undo',
      \ }

let g:which_key_map_leader.e = {
      \'name': '+edit',
      \'v': 'Vim configuation file',
      \'t': 'Todo list',
      \'n': 'Note',
      \}

let g:which_key_map_leader.f = {
      \'name': '+fzf/floaterm',
      \'b': 'Buffers',
      \'f': 'Find files',
      \'h': 'Histories',
      \'q': 'Quickfix',
      \'g': {
      \   'name': '+grep',
      \   'g': 'Git files',
      \   'h': 'all files',
      \   '/': 'Buffer lines',
      \   'S': 'Sessions',
      \   'B': 'Browser Bookmarks',
      \  }
      \}

call which_key#register(',', "g:which_key_map_leader")

let g:which_key_map_space = {
      \ '1': 'File tree',
      \ '4': 'Terminal',
      \ '7': 'Undo tree',
      \ }
let g:which_key_map_space.e = { 'name': '+enable' }
let g:which_key_map_space.d = { 'name': '+disable' }

if has('python3')
  let g:which_key_map_space.D = {
        \ 'name': '+debug',
        \ '<F3>': 'Stop',
        \ '<F4>': 'Restart',
        \ '<F5>': 'Start/Continue',
        \ '<F6>': 'Pause',
        \ '<F8>': 'Add function breakpoint',
        \ '<leader><F8>': 'Run to cursor',
        \ '<F9>': 'Toggle breakpoint',
        \ '<leader><F9>': 'Toggle conditional breakpoint',
        \ '<F10>': 'Step over',
        \ '<F11>': 'Step into',
        \ '<F12>': 'Step out',
        \ }

  let g:which_key_map_space.D.t = {
        \ 'name': '+toggle',
        \ 'b' : 'Breakpoint view',
        \ 'c' : 'Console',
        \ }
endif

let g:which_key_map_space.t = {
      \ 'name': '+toggle',
      \ 'm': 'markdown preview',
      \ 'd': 'database ui',
      \ }

if has('sound')
  nnoremap <silent> <space>tk <cmd>KeyStrokeToggle<cr>
  let g:which_key_map_space.t.k = 'keystroke sound'
endif

let g:which_key_map_space.b = {
      \'name': '+buffers',
      \'b': 'which buffer to go',
      \'1': 'Go to buffer 1',
      \'2': 'Go to buffer 2',
      \'3': 'Go to buffer 3',
      \'4': 'Go to buffer 4',
      \'5': 'Go to buffer 5',
      \'6': 'Go to buffer 6',
      \'7': 'Go to buffer 7',
      \'8': 'Go to buffer 8',
      \'9': 'Go to buffer 9',
      \'0': 'Go to buffer 10',
      \ }

call which_key#register('<Space>', "g:which_key_map_space")

function! <SID>UnmapFormat()
  silent! unmap <leader>=
  silent! unmap <buffer> <localleader>=
endfunction

command! -nargs=0 FormatDisable call <SID>UnmapFormat()

" <space> key map to enable / disable stuff
nnoremap <silent> <space>df <cmd>FormatDisable<cr>
" nnoremap <silent> <space>el <cmd>ALEEnable<cr>
" nnoremap <silent> <space>dl <cmd>ALEDisable<cr>

" <space> key map to toggle stuff

nnoremap <silent> <space>tm <cmd>MarkdownPreviewToggle<cr>

" abbreviation
iab jw Jerry Wang <jerrywang1981@outlook.com>
iab jwi Jerry Wang <jianjunw@cn.ibm.com>
iab jwc  .--- . .-. .-. -.--  .-- .- -. --.

" java debug
" java -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=1808 Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=xx.xx.xxx.xx -Dcom.sun.management.jmxremote.rmi.port=1808 -jar app.jar
"
" java -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005 -jar app.jar
"
" mvn spring-boot:run -D"spring-boot.run.jvmArguments"="-Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=5005,suspend=y"
" jdb -connect com.sun.jdi.SocketAttach:hostname=127.0.0.1,port=5005
"
" vim-lsp-settings
" java 21
" install-eclipse-jdt-ls.cmd
" curl -Lo jdt-language-server-latest.tar.gz "https://download.eclipse.org/jdtls/milestones/1.33.0/jdt-language-server-1.33.0-202402151717.tar.gz"
"
" java 17
" curl -Lo jdt-language-server-latest.tar.gz "https://download.eclipse.org/jdtls/milestones/1.28.0/jdt-language-server-1.28.0-202309281329.tar.gz"
"
