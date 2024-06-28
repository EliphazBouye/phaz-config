vim9script

# Set leader
g:mapleader = " "

# Enble syntax highlighting
syntax on

# Line number
set number

# Use relative number
set relativenumber

# Use cursorline
set cursorline

# Change colorscheme
colorscheme  retrobox

# Change background color
set background=dark

# Keep undo history
set undofile

# Display completion matches in status line
set wildmenu

# Show @@@ in the last line if it is truncated
set display=truncate

# Display matched for the search pattern
set incsearch

# Higlight search result
set hlsearch

# Unload hidden buffer
set hidden

# Tab related settings
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

# Scroll off limit
set scrolloff=8


# Auto Command
# Disable cursorline in insert mode
autocmd InsertEnter,InsertLeave * set cursorline!

# Mappings
# Disable highlighting after search
nmap <Leader>s :nohlsearch<CR>

# Useful mapping
map \c i{<Esc>ea}<Esc>
map \q  i'<Esc>ea'<Esc>
map \dq i"<Esc>ea"<Esc>

# Plugins
# Match html tags and if,endif,...
packadd! matchit

# Editor config plugin for edit config to use when coding
packadd! editorconfig 

# Add lsp plugin
packadd lsp

var lspServers = [
  {
    name: 'pyright-langserver',
    filetype: ['python'],
    path: '/home/eliphaz/Programming/nodejs/current/node-v22.3.0-linux-x64/bin/pyright-langserver',
    args: ['--stdio'],
    workspaceConfig: {
        python: {
          analysis: {
            autoSearchPaths: true,
            diagnosticMode: 'workspace',
            useLibraryCodeForTypes: true,
          },
        },
      },
    customNotificationHandlers: {
      'pyright/beginProgress': (_, _) => true,
      'pyright/reportProgress': (_, _) => true,
      'pyright/endProgress': (_, _) => true,
    },
  },
  {
    name: 'tsserver',
    filetype: ['typescript', 'javascript'],
    path: '/home/eliphaz/Programming/nodejs/current/node-v22.3.0-linux-x64/bin/typescript-language-server',
    args: ['--stdio'],
    debug: v:true,
    workspaceConfig: {
        javascript: {
          analysis: {
            autoSearchPaths: true,
            diagnosticMode: 'workspace',
            useLibraryCodeForTypes: true,
          },
        },
      },
  }
]

# LSP options
var lspOpts = {
  autoComplete: v:true,
  autoHighlight: v:false,
  autoHighlightDiags: v:true,
  diagSignErrorText: 'E>',
  diagSignHintText: 'H>',
  diagSignInfoText: 'I>',
  diagSignWarningText: 'W>',
  showDiagInBalloon: v:true,
  showDiagInPopup: v:true,
  showDiagOnStatusLine: v:false,
  showDiagWithSign: v:true,
  showDiagWithVirtualText: v:true,
  completionTextEdit: v:false,
  diagVirtualTextAlign: 'after',
  diagVirtualTextWrap: 'wrap',
  noNewlineInCompletion: v:true,
  useQuickfixForLocations: v:true,
}

g:LspOptionsSet(lspOpts)
g:LspAddServer(lspServers)

noremap gD :LspGotoDeclaration<CR>
noremap gd :LspGotoDefinition<CR>
noremap <leader>rn :LspRename<CR>

#set cmdheight=2

inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
