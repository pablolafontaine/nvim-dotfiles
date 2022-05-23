local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[
packadd packer.nvim

set relativenumber
set encoding=UTF-8
let g:airline_theme='monochrome'

map <silent> <TAB> :NERDTreeToggle<CR>
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

let g:rustfmt_autosave = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1
]]

return require('packer').startup(function(use)
     use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
     use { 'dense-analysis/ale' }
     use { 'yuezk/vim-js' }
     use { 'jxnblk/vim-mdx-js' }
     use { 'maxmellon/vim-jsx-pretty' }
     use { 'pangloss/vim-javascript' }
     use { 'rust-lang/rust.vim' }
     use { 'neoclide/coc.nvim', branch = 'release' }
     use { 'preservim/nerdtree' }
     use { 'tpope/vim-fugitive' }
     use { 'ryanoasis/vim-devicons' }
     use { 'romgrk/barbar.nvim',
  	   requires = {'kyazdani42/nvim-web-devicons'}
	}
     use { 'tiagofumo/vim-nerdtree-syntax-highlight' }
     use { 'vim-airline/vim-airline' }
     use { 'vim-airline/vim-airline-themes' }

end)
