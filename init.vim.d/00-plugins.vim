"
" Vim-plug plugins install
"

set nocompatible              " be iMproved, required
set expandtab
set tabstop=4
set shiftwidth=4

" set the runtime path to include Vim-Plug and initialize
call plug#begin(stdpath('config').'/bundle')

" Vim-Plug auto-updater
Plug 'junegunn/vim-plug'

" Color scheme and other color utilities
Plug 'Khelda/vimthemes'
Plug 'eero-lehtinen/oklch-color-picker.nvim'

" File listener for color scheme changer
Plug 'rktjmp/fwatch.nvim'

" Distraction-free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Super-fast statusbar and tab bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'romgrk/barbar.nvim'

" Scrollback buffer integration for kitty
Plug 'mikesmithgh/kitty-scrollback.nvim'

" Floating box for search stuff
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/noice.nvim'

" Secure per-project exrc
Plug 'MunifTanjim/exrc.nvim'

" Support for Rust
Plug 'mattn/webapi-vim',        { 'for': 'rust' }
Plug 'rust-lang/rust.vim',      { 'for': 'rust' }

" Fancy notifications system
Plug 'rcarriga/nvim-notify'

" Fabulous contextual complete system
Plug 'ncm2/float-preview.nvim'
Plug 'kevinhwang91/nvim-bqf'

" TreeSitter integration
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'

" File tree (and Git plugin)
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" LSP configs and semantics
Plug 'neovim/nvim-lspconfig'

" Completion engine and code actions
Plug 'saghen/blink.cmp',        { 'tag': '*' }
Plug 'rachartier/tiny-code-action.nvim'

" Fuzzy-finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Frameworks
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'

" Diagnostics panel
Plug 'folke/trouble.nvim'

" Semantic highlight
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Color for LSP warnings
Plug 'folke/lsp-colors.nvim'

" Smart status column
Plug 'luukvbaal/statuscol.nvim'

" Image copy/paste and drag-n-drop handling
Plug 'HakonHarnes/img-clip.nvim'

" Jupyter integration
Plug 'benlubas/molten-nvim',    { 'do': ':UpdateRemotePlugins' }

" Debugging JDTls extension
Plug 'mfussenegger/nvim-jdtls'

" Start screen
Plug 'mhinz/vim-startify'

" Tag bar for navigating data types
Plug 'liuchengxu/vista.vim'

" The Silver Searcher integration
Plug 'gabesoft/vim-ags'

" direnv integration
Plug 'direnv/direnv.vim'

" HTTP request syntax and executor
Plug 'nicwest/vim-http'

" LaTeX support
Plug 'vim-latex/vim-latex'

" Non-plain text document decoder
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'Khelda/Vim-EPUB'

" CSV editor
Plug 'chrisbra/csv.vim'

" Cucumber/Gherkin syntax
Plug 'tpope/vim-cucumber'

" Nix config syntax
Plug 'LnL7/vim-nix'

" Justfile syntax
Plug 'NoahTheDuke/vim-just'

" Git integration
Plug 'nvim-lua/plenary.nvim'
Plug 'tanvirtin/vgit.nvim'

" Git conflict markers
Plug 'akinsho/git-conflict.nvim'

" Indent lines
Plug 'lukas-reineke/indent-blankline.nvim'

" Syntax for Jinja2
Plug 'Glench/Vim-Jinja2-Syntax'

" Syntax for GNU assembler
Plug 'Shirk/vim-gas'

" Syntax for ACME C64 assembler
Plug 'leissa/vim-acme'

" Add multiple cursors
Plug 'mg979/vim-visual-multi'

" Support for JSonnet
Plug 'google/vim-jsonnet'

" Support for PureScript
Plug 'purescript-contrib/purescript-vim'

" Support for Coq formal proof language
Plug 'whonore/Coqtail'
Plug 'tomtomjhj/coq-lsp.nvim'

" Support for y86 assembly
Plug 'wilt00/vim-y86-syntax'

" Support for gcov files
Plug 'm42e/vim-gcov-marker'

" Support for Menhir (yacc in OCaML)
Plug 'ELLIOTTCABLE/vim-menhir'

" Support for OpenCL language
Plug 'petRUShka/vim-opencl'

" Support for ACPI ASL language
Plug 'martinlroth/vim-acpi-asl'

" Icons on NERDTree (and others)
Plug 'ryanoasis/vim-devicons'

" Fold with markers AND syntax
Plug 'Jorengarenar/vim-syntaxMarkerFold'

call plug#end()
