call plug#begin()
" Aesthetics
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" Programming
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'michaeljsmith/vim-indent-object'
Plug 'PeterRincker/vim-argumentative'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
" Plug 'mhinz/vim-signify'
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
set rtp+=/opt/homebrew/opt/fzf
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" LSPs
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Filetype-specific
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
call plug#end()

let mapleader = " "

" Global status line
set laststatus=3

" Block cursor in insert mode
set guicursor=i:block

" Show line numbers
set number
set relativenumber

" Wrapping
set nowrap
set textwidth=80

" Tab behaviour
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Cursor motion
set scrolloff=12

" Show the command
set noshowmode

" Searching
set ignorecase
set smartcase
set showmatch

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬,space:•

" Search with ripgrep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m

" Color scheme
autocmd vimenter * ++nested colorscheme gruvbox

" ================ NON-PLUGIN REMAPS =================

nnoremap Y y$
nnoremap <leader>vw :set list!<CR>
nnoremap <leader>w <C-w>w
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
nmap <leader>[ [b
nmap <leader>] ]b

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <leader>t :TagbarToggle<CR>

nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

nmap <leader>cac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

nnoremap <silent><nowait> <leader>ld  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>le  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <leader>lc  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <leader>lo  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <leader>ls  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <leader>lj  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <leader>lk  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <leader>ll  :<C-u>CocListResume<CR>

nnoremap <leader>sf :GFiles<CR>
nnoremap <leader>st :Tags<CR>
nnoremap <leader>sp :RG<CR>
nnoremap <leader>sP :Rg<CR>

" =========== PLUGIN SETTINGS AND REMAPS =================

" == coc-prettier ==
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" == neovide ==
let g:neovide_refresh_rate=120
let g:neovide_transparency=0.95
let g:neovide_fullscreen=v:true
let g:neovide_cursor_animation_length=0.05
set guifont=FiraCode\ NF:h22

" == vim-gutentags ==
let g:gutentags_file_list_command = "rg --files"

" == vim-commentary ==
autocmd FileType toml setlocal commentstring=#\ %s

" == gruvbox ==
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox

" == vim-airline ==
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" == vim-signify ==
set updatetime=100
let g:signify_sign_add = ''
let g:signify_sign_delete = ''
let g:signify_sign_change = ''

" == fzf.vim ==
command! -bang -nargs=? GFiles
    \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --hidden --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--reverse', '--preview-window', 'wrap', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
