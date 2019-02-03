"-----------------------------------Notes------------------------------------"
"   ctrl+] find origin, ie where a variable, method, etc. was originated
"   ctrl+^ return to from the origin to the instance above
"
"   ctrl+d to page-down
"   h = left, j = down, k = up, l = right
"
"   zz to center the line where the cursor is located
"   y to 'yank' a copy of the selected text
"   yy to 'yank' a copy of the current line
"   
"   u to undo
"   U to redo
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
"   :term to open a terminal in a new horizontal window
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
"   ,ep to open the vim plugins file
"   ,es to open the snippets folder in the vim command
"   ,nt to open up nerd tree file browser
"   ,f to open up the console to search for ctags
"   ctrl+p to search for a file
"   ctrl+r to search for a function or variable
"   ctrl+e to list recently opened files


set nocompatible                                                    "iMproved, required

so ~/.vim/plugins.vim

"syntax enable"

set backspace=indent,eol,start                                      "make backspace work correctly"
let mapleader = ','                                                 "change default leader for custom commands from backslash to a comma"
set number                                                          "line numbers"
set mouse+=a
set noerrorbells visualbell t_vb=                                   "gets rid of mistype error bell noise"
set nofoldenable                                                    "gets rid of folding sections"
set whichwrap+=<,>,h,l,[,]                                          "wrap the cursor at the beggining and end of lines"


"-----------------------------Visuals------------------------------"
set termguicolors
set t_CO=256
"set background=dark
colorscheme srcery-drk 
"molokai, darkdevel, darkblack
"wombat, srcery, srcery-drk

"highlight ColorColumn ctermbg=magenta"
"call matchadd('ColorColumn', '\%81v', 100)     "highlight the 81 character

"---------------Highlight matches when jumping to next-------------"

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    highlight WhiteOnRed ctermfg=white ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

"-------------------------Split management-------------------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

hi LineNr ctermbg=black
hi vertsplit ctermfg=black ctermbg=black

"--------------------------Tab Management--------------------------"
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"-----------------------------Searching----------------------------"
set hlsearch
set incsearch

"------------------------------Aliases-----------------------------"

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

"swap colon to semicolon"
nnoremap ; :

"remap redo to U"
nnoremap U <C-R>

"----------------------------Plugin settings-------------------------"

"CtrlP"
let g:ctrlp_custom_ignore = 'node_modules\, vendor\'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"NERDTree"
let NERDTreeHijackNetrw = 0

"greplace.vim"
set grepprg=ag

"----------------------------Auto Commands ---------------------------"

"Automatically source the vimrc flie on save"
augroup autosourcing
         autocmd!
         autocmd BufWritePost .vimrc source %
augroup END
