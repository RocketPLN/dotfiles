call plug#begin()

" Plugin manager
Plug 'junegunn/vim-plug'

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" File explorer
Plug 'preservim/nerdtree'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Commenting code
Plug 'tpope/vim-commentary'

" Automatic linting
Plug 'dense-analysis/ale'

" Snippets
Plug 'SirVer/ultisnips'

" Surround text objects
Plug 'tpope/vim-surround'

" Syntax checking
Plug 'scrooloose/syntastic'

call plug#end()

" Utwórz skrót klawiszowy dla NERDTree
nnoremap <C-k><C-o> :NERDTreeToggle<CR>

" Utwórz skrót klawiszowy dla FZF
nnoremap <C-p> :FZF<CR>

" Utwórz skrót klawiszowy dla komentowania/odkomentowania linii
nnoremap <C-c> :Commentary<CR>

" Otwórz terminal
nnoremap <C-t> :botright vsplit term://bash<CR>
" Zamknij terminal
" tnoremap <Esc> <c-\><c-n>:q<CR>


" Ustaw języki dla CoC
let g:coc_global_extensions = ['coc-python', 'coc-html', 'coc-css', 'coc-prettier', 'coc-go']

" Ustaw języki dla Syntastic
let g:syntastic_python_checkers = ['python']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['html_tidy']
let g:syntastic_css_checkers = ['css']
let g:syntastic_go_checkers = ['golint']

" Ustaw języki dla UltiSnips
let g:UltiSnipsSnippetDirectories=["my_snippets"]
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<C-j>"

" Ustaw języki dla ALE
let g:ale_linters = {
      \ 'python': ['flake8'],
      \ 'html': ['tidy'],
      \ 'javascript': ['eslint'],
      \ 'css': ['stylelint'],
      \ 'go': ['golint']
      \ }
let g:ale_fixers = {
      \ 'python': ['yapf'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'css': ['stylelint'],
      \ 'html': ['tidy'],
      \ 'go': ['gofmt']
      \ }

" Define the choose function
function! Choose(choices)
  let idx = inputlist(a:choices)
  if idx <= 0
    return ''
  endif
  return a:choices[idx - 1]
endfunction

" Define the template menu function
function! TemplateMenu()
  " Define the template options
  let options = ['Python', 'CSS', 'HTML', 'Go']

  " Display the template options in a menu
  let choice = Choose(options)

  " Load the selected template
  if choice == 'Python'
    execute '0r ~/.config/nvim/templates/python_template.py'
  elseif choice == 'CSS'
    execute '0r ~/.config/nvim/templates/css_template.css'
  elseif choice == 'HTML'
    execute '0r ~/.config/nvim/templates/html_template.html'
  elseif choice == 'Go'
    execute '0r ~/.config/nvim/templates/go_template.go'
  endif
endfunction

" Map the template menu function to Ctrl-m
nnoremap <silent> <C-m> :call TemplateMenu()<CR>



colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha "
