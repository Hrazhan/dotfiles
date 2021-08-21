"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.vim/autoload/plug.vim')


if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'tpope/vim-surround'
Plug 'chrisbra/vim-diff-enhanced'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Snippets
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Theme & Icons 
" Plug 'sainnhe/gruvbox-material'
Plug 'ghifarit53/tokyonight-vim'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
" Plug 'iamcco/coc-angular', {'do': 'yarn install --frozen-lockfile'}

""*****************************************************************************
"" Custom bundles
"*****************************************************************************

" typescript
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'pangloss/vim-javascript'    " JavaScript support
" Plug 'leafgarland/typescript-vim' " TypeScript syntax
" Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
" Plug 'jparise/vim-graphql'        " GraphQL syntax

" go 
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" Required
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
set nocompatible 
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. 
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Map leader to ,
let mapleader=','

"" Edit & Resource .vimrc
nnoremap <leader>rc : vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>


"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif


" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1

" set background=dark

set termguicolors

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 0

colorscheme tokyonight

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10
set cursorline
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"" work around for emulators showing this weird thing ">4;2m"
let &t_TI = ""
let &t_TE = ""

let g:CSApprox_loaded = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

  
"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif



"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall






" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>n :call RenameFile()<cr>

set autoread





"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>


" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" install tstags for typescript
" npm install --global git+https://github.com/Perlence/tstags.
let g:tagbar_type_typescript = {                                                  
  \ 'ctagsbin' : 'tstags',                                                        
  \ 'ctagsargs' : '-f-',                                                           
  \ 'kinds': [                                                                     
    \ 'e:enums:0:1',                                                               
    \ 'f:function:0:1',                                                            
    \ 't:typealias:0:1',                                                           
    \ 'M:Module:0:1',                                                              
    \ 'I:import:0:1',                                                              
    \ 'i:interface:0:1',                                                           
    \ 'C:class:0:1',                                                               
    \ 'm:method:0:1',                                                              
    \ 'p:property:0:1',                                                            
    \ 'v:variable:0:1',                                                            
    \ 'c:const:0:1',                                                              
  \ ],                                                                            
  \ 'sort' : 0                                                                    
\ }

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>



"*****************************************************************************
"" Custom configs
"*****************************************************************************

" typescript
let g:yats_host_keyword = 1


"*****************************************************************************
"" Coc configs
"*****************************************************************************
" use eslint & prettier if they are in node_modules
" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif

" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"   let g:coc_global_extensions += ['coc-eslint']
" endif


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
    
inoremap silent><<expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use Tab>< and S-Tab>< to navigate the completion list:>>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" user <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" To make <cr> select the first completion item and confirm the completion when no item has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

 " make coc.nvim format your code on <cr>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" close the preview window when the completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use `[r and `]r` to navigate diagnostics
nmap <silent> [r <Plug>(coc-diagnostic-prev)
nmap <silent> ]r <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" preformaing code actions
nmap <leader>do <Plug>(coc-codeaction)
" renaming a symbol
nmap <leader>rn <Plug>(coc-rename)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current


"" Coc-list
" show diagnostics list
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

" grep current word in current buffer
nnoremap <silent> <space>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>


let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
