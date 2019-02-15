filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'                 " vim-snipmate dependency
Plugin 'tomtom/tlib_vim'                              " vim-snipmate dependency
" Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'ervandew/supertab'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tobyS/vmustache'                              " pdv dependency
" Plugin 'Valloric/YouCompleteMe'                     " a omnicompletion engine
Plugin 'SirVer/ultisnips'                             " pdv dependency
Plugin 'honza/vim-snippets'                           " snippets for ultisnips
Plugin 'tobyS/pdv'                                    " a php document block generator
Plugin 'itchyny/lightline.vim'                        " a minimalist powerline status-bar
Plugin 'airblade/vim-gitgutter'                       " display git diff in gutter
Plugin 'phpactor/phpactor'                            " a php omnicompletion engine
Plugin 'svermeulen/vim-cutlass'                       " deletion no longer yanks as well
Plugin 'matze/vim-move'                               " move text
Plugin 'ryanoasis/vim-devicons'                       " adds important unicode icons
Plugin 'tpope/vim-commentary'                         " quickly comment out selection or gaps

call vundle#end()            " required
filetype plugin indent on    " required
