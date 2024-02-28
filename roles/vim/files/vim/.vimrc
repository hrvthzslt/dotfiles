" Set tab settings
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Enable smartindent
set smartindent

" Disable text wrapping
set nowrap

" Show line numbers and relative line numbers
set number
set relativenumber

" Set wildmode
set wildmode=longest:full,full

" Set completion options
set completeopt=menuone,longest,preview

" Enable setting the title of window to the value of 'titlestring'
set title

" Enable mouse in all modes
set mouse=a

" Set ignorecase and smartcase
set ignorecase
set smartcase

" Enable splitbelow and splitright
set splitbelow
set splitright

" Set scrolloff and sidescrolloff
set scrolloff=8
set sidescrolloff=5

" Confirm before writing or abandoning a modified buffer
set confirm

" Set signcolumn
set signcolumn=number

" Set colorcolumn
set colorcolumn=120

" Enable undofile and backup
set undofile
set backup

" Set backupdir
set backupdir-=.

" Set spelllang and spelloptions
set spelllang=en_us,hu

" Disable folding by default
set nofoldenable

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

" Open current file in default program
nnoremap <leader>x :!xdg-open %<CR><CR>

" Source file
nnoremap <leader>S :so<CR>

" Open explorer
nnoremap <leader>f :Explore<CR>

" Navigation shortcuts
nnoremap ú }
nnoremap ő {
nnoremap Ú ]m
nnoremap Ő [m
