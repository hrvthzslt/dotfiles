set nocompatible

" enable syntax highlighting
syntax enable
filetype plugin on

" Set tab settings
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Highlight search results
set hlsearch

" Enable smartindent
set smartindent

" Disable text wrapping
set nowrap

" Show line numbers and relative line numbers
set number
set relativenumber

" Search subfolders
set path=**

" Set wildmode
set wildmenu
set wildoptions=pum
set wildmode=longest:full,full
set wildignorecase
set wildignore=tags

" Set completion options
set completeopt=menuone,longest,preview,noselect,noinsert
set complete=.,t,w,b,u
function! OpenCompletion()
    try
        if !pumvisible()
            call feedkeys("\<C-n>", "n")
        endif
    catch
    endtry
endfunction
autocmd InsertCharPre * call OpenCompletion()

" Set ignorecase and smartcase
set ignorecase
set smartcase

" Move cursor with split
set splitbelow
set splitright

" Set scrolloff and sidescrolloff
set scrolloff=8
set sidescrolloff=5

" Confirm before writing or abandoning a modified buffer
set confirm

" Set colorcolumn
set colorcolumn=120

" Disable folding by default
set nofoldenable

" Status bar
set laststatus=2

" Colors
hi Pmenu ctermbg=white guibg=white
hi PmenuSel ctermbg=yellow guibg=yellow

" Set leader and local leader
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Map k and j to move by terminal rows
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain cursor position when yanking a visual selection
vnoremap y y`]

" Paste replace visual selection without copying it
vnoremap p "_dP

" Clear search highlighting
nnoremap <leader>k :nohlsearch<CR>

" Close buffers
nnoremap <leader>q :bd<CR>
nnoremap <leader>Q :%bd<CR>

" Save buffers
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wa<CR>

" Search and tags
nnoremap <leader>sb :b<Space>
nnoremap <leader>sf :find<Space>
nnoremap <leader>sg :vimgrep // **<Left><Left><Left><Left>
nnoremap gr :grep! --binary-files=without-match --exclude=tags --exclude-dir=.git -s "\<<cword>\>" . -r<CR>:copen<CR>

function! GoToTagOrDefinition()
    try
        execute 'tag ' . expand('<cword>')
    catch
        execute 'normal! gd'
    endtry
endfunction
nnoremap gd :call GoToTagOrDefinition()<CR>

nnoremap <leader>t :execute '!ctags -R .'<CR><CR>:echo "Tags regenerated"<CR>

" Run/lint files by filetype
autocmd FileType sh setlocal makeprg=shellcheck\ -x\ %

" Map <leader>lr
nnoremap <silent> <leader>lr :call RunFileByType()<CR><CR>

function! RunFileByType()
    if &filetype ==# 'vim'
        execute 'source %'
    else
        execute 'make'
    endif
endfunction

" Format files by filetype
autocmd FileType sh nnoremap <buffer> <leader>lf :call FormatWithCursor('shfmt -i 2 -ci')<CR>
autocmd FileType sh vnoremap <buffer> <leader>lf :call FormatWithCursor('shfmt -i 2 -ci')<CR>
autocmd FileType c nnoremap <buffer> <leader>lf :call FormatWithCursor('clang-format')<CR>
autocmd FileType c vnoremap <buffer> <leader>lf :call FormatWithCursor('clang-format')<CR>

function! FormatWithCursor(cmd) range
    let l:save_cursor = getpos(".")
    if a:firstline == a:lastline
        execute '%!' . a:cmd
    else
        execute a:firstline . ',' . a:lastline . '!' . a:cmd
    endif
    call setpos('.', l:save_cursor)
endfunction

" Fixlist
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprev<CR>
nnoremap <leader>c :copen<CR>

" Open quickfixlist after search
augroup searchlist
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost make cwindow
augroup END

" Marks
nnoremap <leader>U mU
nnoremap <leader>I mI
nnoremap <leader>O mO
nnoremap <leader>Z mZ

nnoremap <leader>u 'U
nnoremap <leader>i 'I
nnoremap <leader>o 'O
nnoremap <leader>z 'Z

" Open explorer
nnoremap - :Explore<CR>

" Registers and clipboard
"
" Use system clipboard
set clipboard+=unnamed

" Diff
nnoremap <leader>ff :windo diffthis<CR>
nnoremap <leader>fo :windo diffoff<CR>

" Mapping for "c" and "C"
nnoremap c "cc
vnoremap c "cc
nnoremap C "cC
vnoremap C "cC

" Mapping for "d" and "D"
nnoremap d "dd
vnoremap d "dd
nnoremap D "dD
vnoremap D "dD

" Mapping for "x" and "X"
nnoremap x "xx
vnoremap x "xx
nnoremap X "xX
vnoremap X "xX

" Mapping for "s" and "S"
nnoremap s "ss
vnoremap s "ss
nnoremap S "sS
vnoremap S "sS

" Should not do it but it annoys me
set noswapfile

" Do not prompt with 'Press ENTER...' after shell commands
set shortmess+=F

" Man page
nnoremap K K<CR>
vnoremap K K<CR>
