set nocompatible                " choose no compatibility with legacy vi
syntax enable
if !has('nvim')
  set encoding=utf-8  " Set default encoding to UTF-8
endif
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set matchpairs+=<:>             " Highlight angle brackets like other bracket types
set scrolloff=5                 " Always show 5 lines above/below the cursor
nnoremap Q @q                   " quick recording using qq
"" Disable automatic visual mode with mouse
set mouse-=a
"" Don't display status line
set laststatus=1
