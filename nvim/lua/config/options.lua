
--                                  _   _
--                       ___  _ __ | |_(_) ___  _ __  ___      __       _
--                      / _ \| '_ \| __| |/ _ \| '_ \/ __|    / / ___ _(_)_ __
--                     | (_) | |_) | |_| | (_) | | | \__ \   / / ' \ V / | '  \
--                      \___/| .__/ \__|_|\___/|_| |_|___/  /_/|_||_\_/|_|_|_|_|
--                           |_|
--  ===============================================================================================
--  TITLE : Neovim options
--  ABOUT : Basic settings native to Neovim
--  ===============================================================================================
    local o = vim.opt

    -- Optionele handmatige configuratie
    vim.lsp.config('bashls', {
        -- Voeg hier extra instellingen toe indien nodig
        -- cmd = { 'bash-language-server', 'start' },
        filetypes = { 'sh', 'bash' },
    })
    -- En daarna inschakelen
    vim.lsp.enable('bashls')
--  ---[ Basic settings   ]----------------------------------------------------------------------///
    o.number = true		    --  print the line number in front of each line
    --  o.relativenumber = true 	      --  show relative line number in front of each line
    --  o.numberwidth = 6               --  number of columns used for the line number
    o.cursorcolumn = true           --  highlight the screen column of the cursor
    o.cursorline = true 		    --  highlight the screen line of the cursor
    o.spelllang = { "en", "nl" }    --  language(s) to do spell checking for
    o.wrap = true		    --  lines wrap and continue on the next line
    o.linebreak = true  --  wrap long lines at a blank
    o.showbreak = "└ "        --  string to use at the start of wrapped lines
    o.breakindent = true            --  wrapped line repeats indent
    o.breakindentopt = "shift:4"--  settings for 'breakindent'
    o.scrolloff = 12		    --  minimum nr. of lines above and below cursor
    --  o.sidescrolloff		      --  min. nr. of columns to left and right of cursor
    o.cmdheight = 1        	    --  number of lines to use for the command-line
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Tabbing / Indentation ]-----------------------------------------------------------------///
    o.tabstop = 4           --  number of spaces that <Tab> in file uses
    o.shiftwidth = 4        --  number of spaces to use for (auto)indent step
    o.softtabstop = 4       --  number of spaces that <Tab> uses while editing
    o.autoindent = true     --  take indent for new line from previous line
    o.smartindent = true    --  smart autoindenting for C programs
    o.expandtab = true      --  use spaces when <Tab> is inserted
    o.grepprg = "rg, --vimgrep"     --  program to use for ":grep"
    o.grepformat = "%f:%1:%c:%m"    --  format of 'grepprg' output
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Search Setiings  ]----------------------------------------------------------------------///
    o.smartcase = true     --  no ignore case when pattern has uppercase
    o.ignorecase = true    --  ignore case in search patterns
    o.hlsearch = false     --  highlight matches with last search pattern
    o.incsearch = true     --  highlight match while typing search pattern
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Visual Setiings  ]----------------------------------------------------------------------///
   o.termguicolors = true    --  enable 24-bit RGB color in the TUI
    o.signcolumn = yes        --  when and how to display the sign column
--    o.colorcolumn = "4,38,62,100"    --  columns to highlight
    o.showmatch = true        --  briefly jump to matching bracket if insert one
    o.matchtime = 2           --  tenths of a second to show matching paren
    o.completeopt = "menuone,noinsert,noselect"    --  options for Insert mode completion
    o.showmode = false        --  message on status line to show current mode
    o.pumheight = 10          --  maximum number of items to show in the popup menu
    o.pumblend = 10
    o.winblend = 0
    o.conceallevel = 2        --  whether concealable text is shown or hidden
    o.lazyredraw = false      --  don't redraw while executing macros
    o.redrawtime = 10000      --  timeout for 'hlsearch' and |:match| highlighting
    o.maxmempattern = 20000   --  maximum memory (in Kbyte) used for pattern search
    o.synmaxcol = 300         --  maximum column to find syntax items
    o.background = "dark"     --  "dark" or "light", used for highlight colors
    o.statusline = "%R%=%f   %P   %l/%c  "  --  custom format for the status line
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ File Handling    ]----------------------------------------------------------------------///
    o.backup = false         --  keep backup file after overwriting a file
    o.writebackup = false    --  make a backup before overwriting a file
    o.swapfile = false       --  whether to use a swapfile for a buffer
    o.undofile = true        --  save undo information in a file
    o.updatetime = 300       --  after this many milliseconds flush swap file
    o.timeoutlen = 500       --  time out time in milliseconds
    o.ttimeoutlen = 0        --  time out time for key codes in milliseconds
    o.autoread = true        --  autom. read file when changed outside of Vim
    o.autowrite = false      --  automatically write file if changed
    o.diffopt:append("vertical")              --  options for using diff mode
    o.diffopt:append("algorithm:patience")    --  options for using diff mode
    o.diffopt:append("linematch:60")          --  options for using diff mode
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Undo Directory   ]----------------------------------------------------------------------///
    local undodir = "~/.local/share/nvim/undodir"    -- Undo directory path
    o.undodir = vim.fn.expand(undodir)               -- Expand to full path
    local undodir_path = vim.fn.expand(undodir)      -- ----------
    if vim.fn.isdirectory(undodir_path) == 0 then    --          |
        vim.fn.mkdir(undodir_path, "p")              --          |
    end					             -- Make the path if not exists
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Behavior Settings ]---------------------------------------------------------------------///
    o.errorbells = false   --  ring the bell for error messages
    o.backspace = "indent,eol,start"    --  how backspace works at start of line
    o.autochdir = false    --  change directory to the file in the current window
    o.iskeyword:append("-")             --  characters included in keywords
    o.path:append("**")    --  list of directories searched with "gf" et.al.
    o.selection = "inclusive"           --  what type of selection to use
    o.mouse = "a"          --  the use of mouse clicks
    o.clipboard:append("unnamedplus")   --  use the clipboard as the unnamed register
    o.modifiable = true    --  changes to the text are not possible
    o.encoding = "UTF-8"   --  encoding used internally
    o.wildmenu = true      --  use menu for command line completion
    o.wildmode = "longest:full,full"    --  mode for 'wildchar' command-line expansion
    o.wildignorecase = true             --  ignore case when completing file names
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Cursor Setiings  ]----------------------------------------------------------------------///
    o.guicursor = {
        "n-v-c:block",      -- Normal, Visual, Command-line
    	"i-ci-ve:block",    -- Insert, Command-line Insert, Visual-exclusive
	    "r-cr:hor20",       -- Reaplce, Command-line Replace
	    "o:hor50",          -- Operator-pending
	    "a:blinkwait700-blinkoff400-blinkon250-Cursor/1Cursor",    -- All modes: blinking & highlight groups
	    "sm:block-blinkwait175-blinloff150-blinkon175",            -- Showmatch mode
    }
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Fold Settings    ]----------------------------------------------------------------------///
    o.foldmethod = "marker"    --  folding type
    --    o.foldexpr = "v:lua.vim.treesitter.foldexpr()"    --  expression used when 'foldmethod' is "expr"
    o.foldlevel = 0             --  close folds with a level higher than this
    o.foldtext = ""
    o.foldmarker = '///,\\\\\\'             --  markers used when 'foldmethod' is "marker"
--  ---[ Split Behavior   ]----------------------------------------------------------------------///
    o.splitbelow = true               --  new window from split is below the current one
    o.splitright = true               --  new window is put right of the current one
--  ---------------------------------------------------------------------------------------------\\\

--    o.bufhidden                                         --  what to do when buffer is no longer in window
--    o.buflisted                                         --  whether the buffer shows up in the buffer list
--    o.buftype                                           --  special type of buffer
--    o.casemap                                           --  specifies how case of letters is changed
--    o.cdhome                                            --  change directory to the home directory by ":cd"
--    o.cedit                                                     --  used to open the command-line window
--    o.cdpath                                            --  list of directories searched with ":cd"
--    o.charconvert               --  expression for character encoding conversion
--    o.cindent                   --  do C program indenting
--    o.cinkeys                   --  keys that trigger indent when 'cindent' is set
--    o.cinoptions                --  how to do indenting when 'cindent' is set
--    o.cinscopedecls     --  words that are recognized by 'cino-g'
--    o.cinwords          --  words where 'si' and 'cin' add an indent
--    o.cmdwinheight      --  height of the command-line window
--    o.columns                   --  number of columns in the display
--    o.comments          --  patterns that can start a comment line
--    o.commentstring     --  template for comments; used for fold marker
--    o.complete          --  specify how Insert mode completion works
--    o.completefunc      --  function to be used for Insert mode completion
--    o.completeopt               --  options for Insert mode completion
--    o.completeslash     --  like 'shellslash' for completion
--    o.concealcursor     --  whether concealable text is hidden in cursor line
--    o.confirm                   --  ask what to do about unsaved/read-only files
--    o.copyindent                --  make 'autoindent' use existing indent structure
--    o.cpoptions         --  flags for Vi-compatible behavior
--    o.cursorbind                --  move cursor in window as it moves in other windows
--    o.cursorlineopt     --  settings for 'cursorline'
--    o.debug                     --  to "msg" to see all error messages
--    o.define                    --  pattern to be used to find a macro definition
--    o.delcombine                --  delete combining characters on their own
--    o.dictionary                --  list of file names used for keyword completion
--    o.diff                      --  diff mode for the current window
--    o.diffexpr          --  expression used to obtain a diff file
--    o.digraph                   --  enable the entering of digraphs in Insert mode
--    o.directory         --  list of directory names for the swap file
--    o.eadirection               --  in which direction 'equalalways' works
--    o.display                   --  list of flags for how to display text
--    o.endoffile         --  write CTRL-Z at end of the file
--    o.endofline         --  write <EOL> for last line in file
--    o.equalalways               --  windows are automatically made the same size
--    o.equalprg          --  external program to use for "=" command
--    o.errorfile             --  name of the errorfile for the QuickFix mode
--    o.errorformat            --  description of the lines in the error file
--    o.eventignore           --  autocommand events that are ignored
--    o.eventignorewin        --  autocommand events that are ignored in a window
--    o.exrc                  --  read init files in the current directory
--    o.fileencoding  --  file encoding for multibyte text
--    o.fileencodings     --  automatically detected character encodings
--    o.fileformat                --  file format used for file I/O
--    o.fileformats               --  automatically detected values for 'fileformat'
--    o.fileignorecase    --  ignore case when using file names
--    o.filetype          --  type of file, used for autocommands
--    o.fillchars         --  characters to use for displaying special items
--    o.findfunc          --  function to be called for the |:find| command
--    o.fixendofline      --  make sure last line in file has <EOL>
--    o.foldclose         --  close a fold when the cursor leaves it
--    o.foldcolumn                --  width of the column used to indicate folds
--    o.foldenable                --  set to display all folds open
--    o.foldignore                --  ignore lines when 'foldmethod' is "indent"
--    o.foldlevelstart    --  'foldlevel' when starting to edit a file
--    o.foldminlines      --  minimum number of lines for a fold to be closed
--    o.foldnestmax               --  maximum fold depth
--    o.foldopen          --  for which commands a fold will be opened
--    o.foldtext          --  expression used to display for a closed fold
--    o.formatexpr                --  expression used with "gq" command
--    o.formatlistpat     --  pattern used to recognize a list header
--    o.formatoptions     --  how automatic formatting is to be done
--    o.formatprg         --  name of external program used with "gq" command
--    o.fsync                     --  whether to invoke fsync() after file write
--    o.gdefault          --  the ":substitute" flag 'g' is default on
--    o.guifont                   --  GUI: Name(s) of font(s) to be used
--    o.guifontwide               --  list of font names for double-wide characters
--    o.guioptions                --  GUI: Which components and options are used
--    o.guitablabel               --  GUI: custom label for a tab page
--    o.guitabtooltip     --  GUI: custom tooltip for a tab page
--    o.helpfile          --  full path name of the main help file
--    o.helpheight                --  minimum height of a new help window
--    o.helplang          --  preferred help languages
--    o.hidden                    --  don't unload buffer when it is |abandon|ed
--    o.history                   --  number of command-lines that are remembered
--    o.icon                      --  Vim set the text of the window icon
--    o.iconstring                --  to use for the Vim icon text
--    o.imcmdline         --  use IM when starting to edit a command line
--    o.imdisable         --  do not use the IM in any mode
--    o.iminsert          --  use :lmap or IM in Insert mode
--    o.imsearch          --  use :lmap or IM when typing a search pattern
--    o.include                   --  pattern to be used to find an include file
--    o.includeexpr               --  expression used to process an include line
--    o.indentexpr                --  expression used to obtain the indent of a line
--    o.indentkeys                --  keys that trigger indenting with 'indentexpr'
--    o.infercase         --  adjust case of match for keyword completion
--    o.isfname                   --  characters included in file names and pathnames
--    o.isident                   --  characters included in identifiers
--    o.isprint                       --  printable characters
--    o.joinspaces            --  two spaces after a period with a join command
--    o.jumpoptions           --  specifies how jumping is done
--    o.keymap                        --  name of a keyboard mapping
--    o.keymodel              --  enable starting/stopping selection with keys
--    o.keywordprg                --  program to use for the "K" command
--    o.langmap                   --  alphabetic characters for other language mode
--    o.langmenu          --  language to be used for the menus
--    o.langremap         --  do apply 'langmap' to mapped characters
--    o.laststatus                --  tells when last window has status lines
--    o.linebreak     = true  --  wrap long lines at a blank
--    o.lines                     --  of lines in the display
--    o.linespace         --  number of pixel lines to use between characters
--    o.lisp                      --  indenting for Lisp
--    o.lispoptions               --  changes how Lisp indenting is done
--    o.lispwords         --  words that change how lisp indenting works
--    o.list                      --  <Tab> and <EOL>
--    o.listchars         --  characters for displaying in list mode
--    o.loadplugins               --  load plugin scripts when starting up
--    o.magic                     --  special characters in search patterns
--    o.makeef                    --  name of the errorfile for ":make"
--    o.makeencoding      --  encoding of external make/grep commands
--    o.makeprg                   --  program to use for the ":make" command
--    o.matchpairs                --  pairs of characters that "%" can match
--    o.maxcombine                --  maximum nr of combining characters displayed
--    o.maxfuncdepth      --  maximum recursive depth for user functions
--    o.maxmapdepth               --  maximum recursive depth for mapping
--    o.menuitems         --  maximum number of items in a menu
--    o.mkspellmem                --  memory used before |:mkspell| compresses the tree
--    o.modeline          --  recognize modelines at start or end of file
--    o.modelineexpr      --  allow setting expression options from a modeline
--    o.modelines         --  number of lines checked for modelines
--    o.modified          --  buffer has been modified
--    o.more                      --  listings when the whole screen is filled
--    o.mousefocus = true             --  keyboard focus follows the mouse
--    o.mousehide         --  hide mouse pointer while typing
--    o.mousemodel                --  changes meaning of mouse buttons
--    o.mousemoveevent    --  report mouse moves with <MouseMove>
--    o.mousescroll = "1,2"               --  to scroll by when scrolling with a mouse
--    o.mouseshape                --  shape of the mouse pointer in different modes
--    o.mousetime         --  max time between mouse double-click
--    o.nrformats         --  number formats recognized for CTRL-A command
--    o.omnifunc          --  function for filetype-specific completion
--    o.opendevice                --  allow reading/writing devices on MS-Windows
--    o.operatorfunc      --  function to be called for |g@| operator
--    o.packpath          --  list of directories used for packages
--    o.paragraphs                --  nroff macros that separate paragraphs
--    o.patchexpr         --  expression used to patch a file
--    o.patchmode         --  keep the oldest version of a file
--    o.preserveindent    --  preserve the indent structure when reindenting
--    o.previewheight     --  height of the preview window
--    o.previewwindow     --  identifies the preview window
--    o.pumwidth          --  minimum width of the popup menu
--    o.pyxversion                --  Python version used for pyx* commands
--    o.quoteescape               --  escape characters used in a string
--    o.readonly          --  disallow writing the buffer
--    o.regexpengine      --  default regexp engine to use
--    o.report                    --  for reporting nr. of lines changed
--    o.revins                    --  inserting characters will work backwards
--    o.rightleft         --  window is right-to-left oriented
--    o.rightleftcmd      --  commands for which editing works right-to-left
--    o.ruler = true          --  show cursor line and column in the status line
--    o.rulerformat               --  custom format for the ruler
--    o.runtimepath               --  list of directories used for runtime files
--    o.scroll                    --  lines to scroll with CTRL-U and CTRL-D
--    o.scrollbind                --  scroll in window as other windows scroll
--    o.scrolljump                --  minimum number of lines to scroll
--    o.scrollopt         --  how 'scrollbind' should behave
--    o.sections          --  nroff macros that separate sections
--    o.secure                    --  mode for reading .vimrc in current dir
--    o.selection         --  what type of selection to use
--    o.selectmode                --  when to use Select mode instead of Visual mode
--    o.sessionoptions    --  options for |:mksession|
--    o.shada                     --  use |shada| file upon startup and exiting
--    o.shell                     --  name of shell to use for external commands
--    o.shellcmdflag      --  flag to shell to execute one command
--    o.shellpipe         --  string to put output of ":make" in error file
--    o.shellquote                --  quote character(s) for around shell command
--    o.shellredir                --  string to put output of filter in a temp file
--    o.shellslash                --  use forward slash for shell file names
--    o.shelltemp         --  whether to use a temp file for shell commands
--    o.shellxescape      --  characters to escape when 'shellxquote' is (
--    o.shellxquote               --  like 'shellquote', but include redirection
--    o.shiftround = true             --  round indent to multiple of shiftwidth
--    o.shortmess         --  list of flags, reduce length of messages
--    o.showbreak         --  string to use at the start of wrapped lines
--    o.showcmd                   --  show (partial) command somewhere
--    o.showcmdloc                --  where to show (partial) command
--    o.showfulltag               --  show full tag pattern when completing tag
--    o.showtabline               --  tells when the tab pages line is displayed
--    o.sidescroll                --  minimum number of columns to scroll horizontal
--    o.sidescrolloff     --  min. nr. of columns to left and right of cursor
--    o.smarttab = true               --  use 'shiftwidth' when inserting <Tab>aa
--    o.smoothscroll = true   --  scroll by screen lines when 'wrap' is set
--    o.spell                     --  spell checking
--    o.spellcapcheck     --  pattern to locate end of a sentence
--    o.spellfile         --  files where |zg| and |zw| store words
--    o.spelloptions      --  options for spell checking
--    o.spellsuggest      --  method(s) used to suggest spelling corrections
--    o.splitkeep         --  determines scroll behavior for split windows
--    o.startofline               --  commands move cursor to first non-blank in line
--    o.statuscolumn      --  custom format for the status column
--    o.suffixes          --  suffixes that are ignored with multiple match
--    o.suffixesadd               --  suffixes added when searching for a file
--    o.switchbuf         --  sets behavior when switching to another buffer
--    o.syntax                    --  syntax to be loaded for current buffer
--    o.tabclose          --  which tab page to focus when closing a tab
--    o.tabline                   --  custom format for the console tab pages line
--    o.tabpagemax                --  maximum number of tab pages for |-p| and "tab all"
--    o.tagbsearch                --  use binary searching in tags files
--    o.tagcase                   --  how to handle case when searching in tags files
--    o.tagfunc                   --  function to get list of tag matches
--    o.taglength         --  number of significant characters for a tag
--    o.tagrelative               --  file names in tag file are relative
--    o.tags                      --  list of file names used by the tag command
--    o.tagstack          --  push tags onto the tag stack
--    o.term                      --  of the terminal
--    o.termbidi          --  terminal takes care of bi-directionality
--    o.textwidth = 80                --  maximum width of text that is being inserted
--    o.thesaurus         --  list of thesaurus files for keyword completion
--    o.thesaurusfunc     --  function to be used for thesaurus completion
--    o.tildeop                   --  tilde command "~" behaves like an operator
--    o.timeout                   --  time out on mappings and key codes
--    o.title                     --  Vim set the title of the window
--    o.titlelen          --  of 'columns' used for window title
--    o.titleold          --  title, restored when exiting
--    o.titlestring               --  to use for the Vim window title
--    o.ttimeout          --  out on mappings
--    o.ttytype                   --  alias for 'term'
--    o.undodir                   --  where to store undo files
--    o.undolevels                --  maximum number of changes that can be undone
--    o.undoreload                --  max nr of lines to save for undo on a buffer reload
--    o.updatecount               --  after this many characters flush swap file
--    o.varsofttabstop    --  a list of number of spaces when typing <Tab>
--    o.vartabstop                --  a list of number of spaces for <Tab>s
--    o.verbose                   --  give informative messages
--    o.verbosefile               --  file to write messages in
--    o.viewdir                   --  directory where to store files with :mkview
--    o.viewoptions               --  specifies what to save for :mkview
--    o.virtualedit               --  when to use virtual editing
--    o.visualbell                --  use visual bell instead of beeping
--    o.warn                      --  for shell command when buffer was changed
--    o.whichwrap         --  allow specified keys to cross line boundaries
--    o.wildchar          --  command-line character for wildcard expansion
--    o.wildcharm         --  like 'wildchar' but also works when mapped
--    o.wildignore                --  files matching these patterns are not completed
--    o.wildoptions               --  specifies how command line completion is done
--    o.winaltkeys                --  when the windows system handles ALT keys
--    o.window                    --  nr of lines to scroll for CTRL-F and CTRL-B
--    o.winfixbuf         --  keep window focused on a single buffer
--    o.winfixheight      --  keep window height when opening/closing windows
--    o.winfixwidth               --  keep window width when opening/closing windows
--    o.winheight         --  minimum number of lines for the current window
--    o.winhighlight      --  window-local highlighting
--    o.winminheight      --  minimum number of lines for any window
--    o.winminwidth               --  minimal number of columns for any window
--    o.winwidth          --  minimal number of columns for current window
--    o.wrapmargin                --  chars from the right where wrapping starts
--    o.wrapscan          --  searches wrap around the end of the file
--    o.write                     --  to a file is allowed
--    o.writeany          --  write to file with no need for "!" override
--    o.writedelay                --  delay this many msec for each char (for debug)

