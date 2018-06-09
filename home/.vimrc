" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'

Plug 'valloric/youcompleteme'   " Auto-completion
                                " error on install.py

Plug 'scrooloose/nerdtree'      " File tree

Plug 'altercation/vim-colors-solarized' " Solarized color-scheme

"Plug 'pangloss/vim-javascript'  " JavaScript Plugins

Plug 'scrooloose/syntastic'     " Syntax checker

Plug 'SirVer/ultisnips'         " UltiSnip engine
Plug 'honza/vim-snippets'       " Snippets themselves

Plug 'ervandew/supertab'        " Use <tab> for all insert compl

Plug 'briancollins/vim-jst'     " Highlight JST / EJS syntax

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" >>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" >>>>>>>>>>>>>>>>>>>> Plugin settings <<<<<<<<<<<<<<<<<<<<
" >>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" Spaces instead of tabs
filetype plugin indent on
set tabstop=4		" show existing tab with 4 sp width
set shiftwidth=4	" '>' indent use 4 sp width
set expandtab		" on tab, insert 4 sp

": Enable Solarized Dark
syntax enable
let g:solarized_termcolors=256
let g:solarized_bold=1
let g:solarized_italic=1
let g:solarized_underline=1
let g:solarized_contrast="high"
set background=dark
colorscheme solarized

" NERDTree alias
:command T NERDTree

" Turn off YCM diagnostic display / syntax checking
let g:ycm_show_diagnostics_ui = 0

" Syntastic default settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Autocompletion with UtiliSnips and YouCompleteMe
" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

" >>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" >>>>>>>>>>>>>>>>>>>>> Misc settings <<<<<<<<<<<<<<<<<<<<<
" >>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
set number
set wrap!

" Status Line
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
" jamessan's
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" Filetype overrides
if has("autocmd")
    au BufNewFile,BufRead *.ejs set filetype=html
endif
