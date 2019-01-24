"---------------Notes---------------"
"   ctrl+] find origin, ie where a variable, method, etc. was originated
"   ctrl+^ return to from the origin to the instance above
"
"   ctrl+d to page-down
"   h = left, j = down, k = up, l = right
"
"   zz to center the line where the cursor is located
"   yy to 'yank' a copy of the selected text
"   
"   u to undo
"   i for insert
"
"   di+( delete text inside of parenthesis
"   da+( to delete the parenthesis and the text inside
"   
"   vi+[ to select the text inside of the brackets
"   va+[ to select the brackets and the text inside
"
"   ci+" to change the text inside the quotes
"   ca+" replace the quotes and text
"
"   :sp to split the window horizontally
"   :vsp to split the window vertically
"   ctrl+h to switch to the left window
"
"   :Gsearch do a grep search
"       select text, :s text_to_replace/new_text
"       now :Greplace to replace each instance of the text_to_replace in all
"       files
"       a to replace all instances
"       :wa to write all files
"
"   ------------------Custom Macros----------------
"   ,ev to edit the .vimrc
"   ,nt to open up nerd tree file browser
"   ,f to open up the console to search for ctags
"   ctrl+p to search for a file
"   ctrl+r to search for a function or variable
"   ctrl+e to list recently opened files




set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim
 
syntax enable


set backspace=indent,eol,start                  "make backspace work correctly"
let mapleader = ','                             "change default leader for custom commands from backslash to a comma"
set number                                      "line numbers"
se mouse+=a
set noerrorbells visualbell t_vb=               "gets rid of mistype error bell noise"
 

"----------------Visuals----------------"
"colorscheme atom-dark-256"
"set t_CO=256"
"note when changing back to them change cterm to gui below
hi LineNr ctermbg=black
hi vertsplit ctermfg=black ctermbg=black

"----------------Split management----------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"----------------Searching----------------"
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"----------------Searching----------------"
set hlsearch
set incsearch

"-----------------Aliases----------------"

"Open vimrc"
nmap <Leader>ev :e $MYVIMRC<cr>

"Open vim/plugins.vim"
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>

"create snippet"
nmap <Leader>es :e ~/.vim/snippets/

"Add simple highlight removal"
nmap <Leader><space> :nohlsearch<cr>

"Toggle NERD Tree"
nmap <Leader>nt :NERDTreeToggle<cr>

"ctrl p find variable or function"
nmap <c-R> :CtrlPBufTag<cr>

"ctrl p most recent used files"
nmap <c-E> :CtrlPMRUFiles<cr>

"ctags shortcut"
nmap <Leader>f :tag<space>

"----------------Plugin settings---------------"

"CtrlP"
let g:ctrlp_custom_ignore = 'node_modules\'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"NERDTree"
let NERDTreeHijackNetrw = 0

"greplace.vim"
set grepprg=ag

"----------------Auto Commands ---------------"

"Automatically source the vimrc flie on save"
augroup autosourcing
         autocmd!
         autocmd BufWritePost .vimrc source %
augroup END
