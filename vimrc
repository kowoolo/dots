" Author: kowoolo ( antonito.ayala21 )

" [[ Before anything ]]

    " [ key -> Leader ]  [ <Space> ]
    " NOTICE: set this before any mappings.
    let mapleader = "\<Space>"
    
    " [ separate configs for clean vimrc ]
    " for f in split(glob('~/.vim/vimrc/*.vim'), '\n')
    "     exe 'source' f
    " endfor
    
    " [ compatible ]
    set nocompatible " not vim compatible. mnust be the first one, will affect other options

" [[ Vim Settings ]]

    " [ filetype ]
    filetype plugin indent off

    " [ search ]
    " searching hilight
    set incsearch       "Lookahead as search pattern is specified
    set ignorecase      "Ignore case in all searches...
    set smartcase       "...unless uppercase letters used
    
    "Search Things better
    set hlsearch
    highlight clear Search
    highlight       Search    ctermfg=0     ctermbg=2
    highlight       IncSearch ctermfg=White ctermbg=1 cterm=bold
    
    " Absolute direction for n and N...
    nnoremap  <silent><expr> n  'Nn'[v:searchforward] . ":call HLNext()\<CR>"
    nnoremap  <silent><expr> N  'nN'[v:searchforward] . ":call HLNext()\<CR>"
    
    "Delete in normal mode to switch off highlighting till next search and clear messages...
    nnoremap <silent> <BS> :call HLNextOff() <BAR> :nohlsearch <CR> 

    " [ match ]
    set showmatch
    set matchpairs+=(:),{:},[:],<:>
    set matchpairs+=':'
    set matchtime=5

    " [ format ]
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    au FileType * set fo-=c fo-=r fo-=o

    " [ swapfile ]
    set noswapfile

" [[ Plugged ]]

call plug#begin('~/.vim/plugged')
    " [ File management ] 
        " fzf 
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        Plug 'pbogut/fzf-mru.vim'
        Plug 'mileszs/ack.vim' " to search through files
        
        " NERD 
        Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
        Plug 'scrooloose/nerdcommenter'
        
    
    " [ Movement manipulation ] 
        " improve movement 
        Plug 'easymotion/vim-easymotion' "Better vim movement
        
        " disable movement 
        Plug 'wikitopian/hardmode' "Disables jkhl keys
        
    
    " [ Improvements ] 
        " Terminal 
        Plug 'wincent/terminus' "Better terminal experience
        
        " Delimiters 
        Plug 'jiangmiao/auto-pairs'
        
        " Snippets 
        "Plug 'SirVer/ultisnips'
        "Plug 'garbas/vim-snipmate'
        "Plug 'honza/vim-snippets'

    " [ Dependencies ] 
        Plug 'tomtom/tlib_vim'
        Plug 'MarcWeber/vim-addon-mw-utils'
        Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    
    " [ Language specific ]
        " Java
        "Plug 'artur-shaik/vim-javacomplete2'
        "autocmd FileType java setlocal omnifunc=javacomplete#Complete
        Plug 'ervandew/supertab'
       "Plug 'dansomething/vim-eclim' 
       set runtimepath+=~/dev/eclim
       let g:SuperTabDefaultCompletionType = 'context'
       set completeopt-=preview
call plug#end()

" [[ Plugin Settings and Mappings ]] 

    " [ File management ] 
    "
        " ((FZF))
        "GENERAL
        let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
          \ 'bg':      ['bg', 'Normal'],
          \ 'hl':      ['fg', 'Comment'],
          \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
          \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
          \ 'hl+':     ['fg', 'Statement'],
          \ 'info':    ['fg', 'PreProc'],
          \ 'border':  ['fg', 'Ignore'],
          \ 'prompt':  ['fg', 'Conditional'],
          \ 'pointer': ['fg', 'Exception'],
          \ 'marker':  ['fg', 'Keyword'],
          \ 'spinner': ['fg', 'Label'],
          \ 'header':  ['fg', 'Comment'] }

        "KEYS
        nnoremap <silent>,f :Buffs<CR>
        nnoremap <silent>,c :Colors<CR>
        nnoremap <silent>,j :FZF<CR>
        nnoremap <silent>,, :FZF ~/<CR>
        nnoremap <silent>,m :FZFMru<CR>

        " ((NERD))
        "GENERAL
        let NERDTreeChDirMode = 2
        let NERDTreeShowBookmarks = 1
        let NERDTreeShowHidden=1
        let NERDTreeMinimalUI = 1
        let NERDTreeQuitOnOpen = 1
        "KEYS
        nnoremap ,n :NERDTreeToggle<Enter>

    " [ Movement manipulation ] 
    "
        " ((EASYMOTION))  
        "easy motion key <Leader> not <Leader><Leader>
        map <Leader> <Plug>(easymotion-prefix)
        
        " hardmode  
        "Start hard mode! good luck...
        "autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
        "
    " [ Improvements ] 
    "
        "  terminus
        "GENERAL
        "- 0: block shape
        "- 1: bar shape
        "- 2: underline shape
        let g:TerminusNormalCursorShape=0
        let g:TerminusInsertCursorShape=0
        let g:TerminusMouse=0

        "KEYS
        " NONE

        "  snippets
        "GENERAL
        "KEYS
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<c-b>"
        let g:UltiSnipsJumpBackwardTrigger="<c-z>"
        
    
    " [ dependencies ] 
        " NONE
    

" [[ Mappings ]] 

    " [ misc ]
    nmap ; :
    xmap ; :
    vnoremap ,y "+y
    nnoremap <leader><space> za
    inoremap jj <esc>
    nmap ,ee :w<CR>
    
" [[ Looks ]]

    " [ basic ]
    set lazyredraw

    " [ listchars ]
        " use `:digraphs` command in vim to display.
        " vert: \|, \┆, \│, \ ,
        " fold: ┄, -,
        " diff: -, ×,
        " stl: \ ,
        " stlnc: \ ,
        " tab: \┆\ , »·, ⇥, >-, \␣, \⋮\ ,
        " tail: \·,
        " extends: \«, ◂,
        " precedes: \», ▸,
        " nbsp: \✖,
        " conceal: ≠,
        " eol: ↵, ¶
        " showbreak: "↪ ", "> ", "+++ ",
        " ------------------------------------------
    set fillchars=vert:│,fold:┄,diff:-
    set list
    set listchars=tab:\ \ , " use whitespace to hide tab.
                \trail:\·, " trailing line whitespaces
                \extends:\◂,
                \precedes:\▸,
                \nbsp:\✖, " non-breakable space.
                \conceal:≠ " conceal symbol.
    set showbreak="↪ " " string at start of lines that have been wrapped.

    " {{{ [ listchars continued ] experimental
    " use listchars tab flag to show tab vertical line.
    " toggle fold level vertical lines before line number.
    " FIXME
    fun! TabIndentLineToggle(toggle_vertline)
        if (a:toggle_vertline == 1)
            let g:TabIndentLine = 1
            hi SpecialKey      ctermfg=237 ctermbg=NONE cterm=none
            set noexpandtab
            set listchars+=tab:\┆\ ,
            " TODO detect IndentGuides here.
            if exists('g:indent_guides_enable_on_vim_startup')
                let g:indent_guides_enable_on_vim_startup = 0
                :IndentGuidesDisable
            endif
        else
            let g:TabIndentLine = 0
            set expandtab
            set listchars+=tab:\ \ ,
            if exists('g:indent_guides_enable_on_vim_startup')
                let g:indent_guides_enable_on_vim_startup = 1
                :IndentGuidesEnable
            endif
        endif
    endfunction
    fun! ListModeToggle()
        set invlist list?
    endfun
    " autocmd FileType *      call TabIndentLineToggle(1)
    " autocmd FileType python call TabIndentLineToggle(0)
    nnoremap <silent> <Leader>lc :set invlist list?<CR>
    "}}}

    " [ tabs ]
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set autoindent
    set breakindent
    set smartindent
    set expandtab
    set equalalways

    " [ folds ]
    set foldmethod=marker
    set foldcolumn=1
    set foldlevel=0
    set modelines=1

    " [ colorscheme ]
    " Helpers 
    let s:running_windows=has('win16') || has('win32') || has('win64')
    let s:colorful_term=(&term=~?'xterm') || (&term=~?'screen')
    
    " Nofrils 
    let g:nofrils_strbackgrounds=0
    " to turn off highlighted string backgrounds
    let g:nofrils_heavycomments=1 " bright comments off
    let g:nofrils_heavylinenumbers=0 " heavy line numbers off

    colorscheme nofrils-dark
    "if s:running_windows
        "colo nofrils-light
    "else " MacOSX/Linux
        "if executable('date')
            "" EST is -5 from UTC so
            "" EST 19:00 to 7:00 is 01:00 to 
            "let s:curhour=system('date +%H')
            "if s:curhour <# 8
                "colo nofrils-dark
            "elseif s:curhour ># 21
                "colo nofrils-dark
            "else
                "colo nofrils-acme
            "endif
        "else
            "colo nofrils-sepia
        "endif
    "endif

    " [ syntax ]
    syntax off "what for right?

    " [ line number ]
    set number
    set numberwidth=2

    " [ current line ]
    " Plugin --> cursorlinecurrentwindow???
    set cursorline



    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    au FileType * set fo-=c fo-=r fo-=o
