
call plug#begin('~/.local/share/nvim/plugged')
" Autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'maxmx03/solarized.nvim'
" File browsing
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons' " For file icons
Plug 'm4xshen/autoclose.nvim'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'rose-pine/neovim'
Plug 'folke/tokyonight.nvim'
Plug 'andymass/vim-matchup'
Plug 'josethz00/neovim-like-vscode'
Plug 'tomasiser/vim-code-dark'
call plug#end()

" Enable filetype plugins
filetype plugin on
syntax on

" Enable line numbers
set relativenumber
set number
set shiftwidth=6
set clipboard+=unnamedplus

" For nvim-cmp
lua << EOF
local cmp = require'cmp'
cmp.setup({
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }
})
EOF

" For Nvim-Tree"
lua << EOF
require'nvim-tree'.setup {
  -- your configuration here
}
EOF
lua << EOF
local lspconfig = require'lspconfig'
lspconfig.ccls.setup {}  -- replace 'ccls' with your preferred C++ language server
lspconfig.tsserver.setup{}
EOF
" Map F3 to toggle nvim-tree"
nnoremap <F3> :NvimTreeToggle<CR>

" Enable icons in nvim-tree"
let g:webdevicons_enable_nerdfont = 1
set background=dark
" let g:tokyonight_style = 'storm'"
let g:rose_pine_variant = 'moon'
colorscheme tokyonight
" After setting the colorscheme, add the following:
highlight cType guifg=#ebbcba
highlight cVariable guifg=#ebbcba
highlight cFunction guifg=#31748f
highlight cClass guifg=#eb6f92
highlight Operator guifg=#ebbcba
highlight Delimiter guifg=#31748f"


let g:matchup_matchparen_offscreen = {'method': 'status'}
set showmatch

