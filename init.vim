set nocompatible
let mapleader = ','
inoremap jk <Esc>
nnoremap <space> :
set mouse=a
set nu rnu
set showmatch
set smartindent
set clipboard=unnamed
set laststatus=2
set tabstop=4
"set autowrite
set ruler                   " open status column
set cursorline              " highlight current line
set fdm=syntax
set termguicolors
nnoremap L $
nnoremap H 0
vnoremap L $
vnoremap H 0

nnoremap <leader>ww <c-w><c-w>
nnoremap <leader>wh <c-w><c-h>
nnoremap <leader>wj <c-w><c-j>
nnoremap <leader>wk <c-w><c-k>
nnoremap <leader>wl <c-w><c-l>
" nnoremap <leader>d <c-d>
" nnoremap <leader>u <c-u>

"set magic                   " set magic
let g:loaded_perl_provider = 0
"set t_Co=8
"set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
"set fileencoding=utf-8
"colo base16-dracula
" begin!
call plug#begin()

" 1. airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'cormacrelf/vim-colors-github'
" 2. onedark
"Plug 'joshdick/onedark.vim'
Plug 'navarasu/onedark.nvim'
" Plug 'chriskempson/base16-vim'
" 3. coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 4. indentLine
Plug 'Yggdroot/indentLine'
" 5. highlight
"Plug 'jackguo380/vim-lsp-cxx-highlight'
" 6. vimspector
Plug 'puremourning/vimspector'
" 7. autopairs
Plug 'jiangmiao/auto-pairs'
" 8. python-fold
Plug 'tmhedberg/simpylfold'
" 9. C++ - fold
"Plug 'luchermitte/vimfold4c'
" 10. highlight
Plug 'sheerun/vim-polyglot'
" 11. comment 
Plug 'tomtom/tcomment_vim'
" 12 terminal
Plug 'skywind3000/vim-terminal-help'

" 13 markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

"let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" 1. airline themes
let g:airline_theme='bubblegum'

" 2. onedark
" dark draker cool cooler deep warm warmer 
let g:onedark_config = {
    \ 'style': 'deep',
\}

set background=dark
colorscheme onedark

" hi Normal ctermfg=NONE
" highlight NonText ctermfg=NONE
" hi Normal guibg=NONE



" 3. coc.nvim
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
"set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" "
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" "
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" " " "" "" "" "" ""
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ CheckBackspace() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
"
" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
" " 
" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" " " "" "" "" "" ""

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
"
nnoremap <silent><nowait> <space>aa  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>ee  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>oo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>ss  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>jj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>kk  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>pp  :<C-u>CocListResume<CR>
" coc-market
nnoremap <silent><nowait> <space>mm  :<C-u>CocList marketplace<CR>



" 3.1 coc-explorer
" coc-explorer
nnoremap <leader>e :CocCommand explorer<CR>
"let which_key_map2.p ='file tree'
function! s:coc_list_current_dir(args)
	let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
	execute 'cd ' . fnamemodify(node_info['fullpath'], ':h')
	execute 'CocList ' . a:args
endfunction

function! s:init_explorer(bufnr)
	call setbufvar(a:bufnr, '&winblend', 50)
endfunction

function! s:enter_explorer()
	if !exists('b:has_enter_coc_explorer') && &filetype == 'coc-explorer'
		" more mappings
		nmap <buffer> <Leader>fg :call <SID>coc_list_current_dir('-I grep')<CR>
		nmap <buffer> <Leader>fG :call <SID>coc_list_current_dir('-I grep -regex')<CR>
		nmap <buffer> <C-p> :call <SID>coc_list_current_dir('files')<CR>
		let b:has_enter_coc_explorer = v:true
	endif
	" statusline
	setl statusline=coc-explorer
endfunction

augroup CocExplorerCustom
	autocmd!
	autocmd BufEnter call <SID>enter_explorer()
augroup END

" hook for explorer window initialized
function! CocExplorerInited(filetype, bufnr)
	" transparent
	call setbufvar(a:bufnr, '&winblend', 10)
endfunction

" 3.2 coc-highlight
"autocmd CursorHold * silent call CocActionAsync('highlight')


" 3.3 coc-markdown
" nnoremap <leader>op :CocCommand markdown-preview-enhanced.openPreview<cr>
nnoremap <leader>op :CocCommand markdown-preview-enhanced.openPreview<cr> \ <cr>

" 4. indext
let g:indent_guides_guide_size =1
let g:indent_guides_start_level =2

" 5. fold
nnoremap <leader><leader> ggVGzO
nnoremap <leader>. ggVGzC

" 5. lsp -cxx -highlight
"
" 6. vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" F5: start and Continue debug  
"
" shift + F5: Stop debug 
"
" ctrl + shift + F5: Restart debug
"
" , + n: Step over
nmap <leader>m <Plug>VimspectorStepOver

" , + ni: Step into
nmap <leader>ni <Plug>VimspectorStepInto

" , + no: Step out
nmap <leader>no <Plug>VimspectorStepOut

nnoremap <silent><nowait><leader>vv :<C-u>VimspectorReset<cr>
"VISUAL_STUDIO
"packadd! vimspector
"" for normal mode - the word under the cursor
nmap <leader>bi <Plug>VimspectorBalloonEval
""" for visual mode, the visually selected text
xmap <leader>bi <Plug>VimspectorBalloonEval
"nmap <leader><F11> <Plug>VimspectorUpFrame
"nmap <leader><F12> <Plug>VimspectorDownFrame
"nmap <leader>B     <Plug>VimspectorBreakpoints
"nmap <leader>D     <Plug>VimspectorDisassemble
"
"
" suseLibraryCodeForTypes"
"
" 11. comment 
let g:tcomment_textobject_inlinecomment = ''
nmap <leader>cn g>c
vmap <leader>cn g>
nmap <leader>cu g<c
vmap <leader>cu g<

"
" markdown highlight
augroup vimrcEx
    autocmd!

    "特定文件的语法高亮
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    "启用Markdown拼写检查
    autocmd FileType markdown setlocal spell
    "一行只显示80个字符
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END
