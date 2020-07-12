set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Automatic (smart) closing for quotes, parenthesis, brackets etc
" This is what causes deleting to be slow!
" (This plugin makes the cursor turn into a block for a split second every
" time you hit backspace)
" Plugin 'raimondi/delimitmate'

" Gruvbox color scheme
Plugin 'morhetz/gruvbox'

" Color scheme for plugins goyo and limelight
Plugin 'https://github.com/junegunn/seoul256.vim'

" For nicer writing:
Plugin 'https://github.com/junegunn/limelight.vim'
Plugin 'https://github.com/junegunn/goyo.vim'

" For commenting stuff out/in
Plugin 'scrooloose/nerdcommenter'

" For better syntax highlighting and indentation in javascript
Plugin 'pangloss/vim-javascript'

" For highlighting and indentation in JSX (depends on the plugin above!)
Plugin 'mxw/vim-jsx'

" Apparently, to enable syntax highlighting for .tsx files, I need to download
" a typescript syntax highlighter first.
Plugin 'leafgarland/typescript-vim'

" And then, I need to add this:
Plugin 'peitalin/vim-jsx-typescript'

" I wrote lots of Python code w/o running it and this seems like a 
" faster way of finding bugs.
"Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" START (of my own, non-plugin settings)

" Without this, you cannot hit backspace to delete stuff you wrote after you
" ":w" (save)
set backspace=2

" Set the color scheme to seoul256
" colo seoul256

" Literally syntax highlighting
syntax on

" Make the search (/) results be highlighted
set hlsearch

" Make line-numbers appear
set nu

" Shows the commands you are typing
set showcmd

" Sets the line numbers as far to the left as they will go
set numberwidth=1

" This enables spell check
" set spell spelllang=en_us
" Shortcut for turning on spell check
nnoremap <C-h> :setlocal spell! spelllang=en_us<CR>

" This makes it so that vim copies and pastes to/from the system clipboard
set clipboard=unnamed

" Make j and k go by visual lines
map j gj
map k gk

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <C-i> :nohl<CR>

" Move one space to the left (for escaping parenthesis)
inoremap <C-e> <C-o>l

" Vim cursor behavior-- let vim cursor go one character beyond last letter of
" line
set virtualedit+=onemore

" Stuff to break lines up nice.
set breakindent
let &showbreak = '↳'

" This is what makes the cursor be a vertical bar in insert mode and a box in
" command mode (in Vim). You must have the default cursor be a box (in the
" iTerm2 settings).
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Makes writing comfortable
" To use, ":Write"
function SetWritingSettings()
	Goyo 60
	colo seoul256
	set linebreak
	" Limelight 0.9 // Limelight doesn't seem to be working right now
endfunction

command Write echom SetWritingSettings()

" Turn off Esc delay when exiting Visual mode
set timeoutlen=1000 ttimeoutlen=0

" Makes it so that you can scroll in vim using mouse
set mouse=a

" This makes vim display last line instead of a bunch of @@@ and empty space
set display+=lastline

" Makes it so that "x" in normal mode does not copy the character it deletes
nnoremap x "_x

" Set colorscheme to gruvbox and make sure it's the dark alternative
silent! colo gruvbox
set background=dark

" Make it so that searches ("/") do not automatically open folds
set fdo-=search

" Make tabs be 2 spaces wide when editing javascript
" You can use `set filetype?` while editing a file to see the
" type that it detected
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2
autocmd Filetype css setlocal tabstop=2 shiftwidth=2
autocmd Filetype html setlocal tabstop=2 shiftwidth=2
autocmd Filetype java setlocal tabstop=2 shiftwidth=2
autocmd Filetype typescript.tsx setlocal tabstop=2 shiftwidth=2

" This is for saving and loading Vim folds. These views are saved to
" .vim/views and are NOT automatically deleted when you delete a text file
" that contained folds.
" DISABLED FOR NOW ON MAC
"augroup AutoSaveFolds
	"autocmd!
	"autocmd BufWinLeave * mkview
	"autocmd BufWinEnter * silent loadview
"augroup END

" Code to enable persistent
" guard for distributions lacking the persistent_undo feature.
if has('persistent_undo')
    " define a path to store persistent_undo files.
    let target_path = expand('~/.vim/undodir/')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif

    " point Vim to the defined undo directory.
    let &undodir = target_path

    " finally, enable undo persistence.
    set undofile
endif
