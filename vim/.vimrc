" vim: set sw=4 ts=4 sts=4 et foldmarker={{{,}}} foldmethod=marker fdl=10
" fdls=99:
if &compatible
    set nocompatible
endif

set rtp+=~/.vim/dein/repos/github.com/Shougo/dein.vim

let g:dein#enable_name_conversion = 1

if dein#load_state(expand('~/.vim/dein'))
    call dein#begin(expand('~/.vim/dein'))

    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/denite.nvim', {'if': has('python3') || has('nvim')})

    call dein#add('tpope/vim-unimpaired')
    call dein#add('tpope/vim-sensible')
    call dein#add('tpope/vim-surround')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('ciaranm/securemodelines')
    call dein#add('editorconfig/editorconfig-vim')

    call dein#add('tpope/vim-fugitive')

    call dein#add('tpope/vim-repeat')

    call dein#add('jeetsukumaran/vim-buffergator')
    call dein#add('easymotion/vim-easymotion')
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('godlygeek/tabular')
    call dein#add('mileszs/ack.vim')
    call dein#add('terryma/vim-expand-region')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('haya14busa/incsearch.vim')

    call dein#add('Valloric/YouCompleteMe', {'build': './install.py', 'if': !dein#tap('denite')})

    call dein#add('lifepillar/vim-solarized8')
    call dein#add('rakr/vim-one')
    call dein#add('jnurmine/Zenburn')
    call dein#add('dracula/vim', {'name': 'dracula'})
    "call dein#add('flazz/vim-colorschemes')
    call dein#add('morhetz/gruvbox')
    call dein#add('mhartington/oceanic-next')
    call dein#add('KeitaNakamura/neodark.vim')

    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')

    "{{{ Language support
    "call dein#add('aliva/vim-fish', {'on_ft': 'fish'})
    call dein#add('fatih/vim-go')
    call dein#add('arbelt/vim-fish', {'on_ft': 'fish'})
    call dein#add('cespare/vim-toml', {'on_ft': 'toml'})

    call dein#add('jalvesaq/Nvim-R')
    call dein#add('python-mode/python-mode', {'on_ft': 'python'})

    call dein#add('hashivim/vim-terraform')
    call dein#add('b4b4r07/vim-hcl')
    call dein#add('pearofducks/ansible-vim')
    call dein#add('elzr/vim-json')
    call dein#add('Chiel92/vim-autoformat')
    call dein#add('stephpy/vim-yaml')
    call dein#add('saltstack/salt-vim')

    "}}}

    call dein#end()
    call dein#save_state()
end

filetype plugin indent on
syntax enable

"{{{ Utility functions
silent function! HasGUI()
    return has('gui_running')
endfunction
"}}}
"{{{ vimrc.local
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
"}}}
"{{{ Ack.vim
if !exists('g:ackprg')
    if executable('rg')
        let g:ackprg = "rg --vimgrep"
    elseif executable('ag')
        let g:ackprg = "ag --vimgrep"
    end
end
"}}}

set fdl=5
set fdls=5
set wildmenu              " Show menu on completion
set wildchar=<TAB>        " Use tab key
set wildmode=list:longest
set modeline
set modelines=5

set hidden

set cmdheight=2         " Prevents ENTER to continue messages

if has('mouse')
    set mouse=a
end

silent function! CheckTrueColor()
    if has('gui') || has('gui_vimr')
        return 1
    elseif !has('nvim')
        return 0
    elseif has('mac') " Is running locally
        return 1
    elseif executable('is_mosh')
        silent !is_mosh
        if v:shell_error
            return 1
        else
            return 0
        end
    else
        return 0
    end
endfunction

" True color if available
if has('termguicolors') && CheckTrueColor()
    set termguicolors
end

set tabstop=4           " 4 spaces for tab
set shiftwidth=4        " 4 spaces for indent
set softtabstop=4
set expandtab           " Use spaces by default
set smarttab

set ignorecase          " Case insensitive matching
set smartcase           " Case sensitive when caps present

"{{{ Leader keys
if !exists('mapleader')
    let mapleader = ","
end

if !exists('maplocalleader')
    let maplocalleader = "_"
end
"}}}
"{{{ Airline
if !exists('g:airline_powerline_fonts')
    let g:airline_powerline_fonts = 1
end
"}}}
"{{{ Secure modelines
if !exists('g:secure_modelines_verbose')
    let g:secure_modelines_verbose = 0
end
"}}}
"{{{ incsearch
if dein#tap('incsearch')
    let g:incsearch#auto_nohlsearch = 1
    map / <Plug>(incsearch-forward)
    map ? <Plug>(incsearch-back)

    " auto nohlsearch mappings: causes highlight to disappear after cursor
    " motion
    map g/ <Plug>(incsearch-stay)
    map n <Plug>(incsearch-nohl-n)
    map N <Plug>(incsearch-nohl-N)
    map * <Plug>(incsearch-nohl-*)
    map # <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)
end
"}}}
"
if dein#tap('terraform')
    let g:terraform_align=1
end

let g:vim_json_syntax_conceal = 0

" Key bindings {{{
if dein#tap('nerdtree')
    map <C-t> :NERDTreeToggle<CR>
end
"}}}

