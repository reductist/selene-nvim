--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

local cols = {
  greylo = hsl("#10130F"),
  greylohi = hsl("#20231F"),
  greymidlo = hsl("#6c6a74"),
  greymidhi = hsl("#bcbac4"),
  greyhi = hsl("#e2e2df"),
  redlo = hsl("#330f08"),
  redmed = hsl("#ac063b"),
  redhi = hsl("#fa709c"),
  orangelo = hsl("#714b05"),
  orangemed = hsl("#f67e23"),
  orangehi = hsl("#fbcba7"),
  purplelo = hsl("#2b1d30"),
  purplemed = hsl("#7d4990"),
  purplehi = hsl("#ce9fdf"),
  bluedesatlo = hsl("#385365"),
  bluedesatmed = hsl("#8296a5"),
  bluedesathi = hsl("#b3c3d1"),
  bluesatlo = hsl("#052a7a"),
  bluesatmed = hsl("#2366f6"),
  bluesathi = hsl("#bacffc"),
  greenlo = hsl("#066f35"),
  greenmed = hsl("#60d76c"),
  greenhi = hsl("#a2fbab"),
  yellowlo = hsl("#2e2d28"),
  yellowmedlo = hsl("#807a7c"),
  yellowmedhi = hsl("#c2bab7"),
  yellowhi = hsl("#f2eae7"),
}


-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
-- @diagnostic disable: undefined-global
local theme = lush(function(injected_functions)

  local sym = injected_functions.sym

  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    -- ColorColumn  { }, -- Columns set with 'colorcolumn'
    Conceal      { fg = cols.yellowlo }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = cols.yellowlow, }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = cols.orangehi }, -- Directory names (and other special names in listings)
    DiffAdd      { fg = cols.greenhi.lighten(40) }, -- Diff mode: Added line |diff.txt|
    DiffChange   { fg = cols.greenhi }, -- Diff mode: Changed line |diff.txt|
    DiffDelete   { fg = cols.redhi.lighten(30) }, -- Diff mode: Deleted line |diff.txt|
    DiffText     { fg = cols.redhi }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer  { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    -- ErrorMsg     { }, -- Error messages on the command line
    -- VertSplit    { }, -- Column separating vertically split windows
    Folded       { fg = cols.orangehi }, -- Line used for closed folds
    FoldColumn   { }, -- 'foldcolumn'
    SignColumn   { }, -- Column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr       { fg = cols.greymidlo }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = cols.bluehi }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = cols.orangemed.lighten(30) }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { fg = cols.greyhi.lighten(40) }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|
    NonText      { fg = cols.purplehi }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = cols.yellowhi, bg = cols.greylo }, -- Normal text
    -- Cursor       { fg = Normal.bg.lighten(10), bg = Normal.fg.lighten(10) }, -- Character under the cursor
    -- lCursor      { fg = Normal.bg.lighten(10), bg = Normal.fg.lighten(10) }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    NormalFloat  { fg = Normal.fg.darken(20), bg = Normal.bg.darken(20) }, -- Normal text in floating windows.
    NormalNC     { fg = Normal.fg.darken(10), bg = Normal.bg.darken(20) }, -- normal text in non-current windows
    Pmenu        { fg = Normal.fg.darken(20), bg = cols.greylo.darken(30) }, -- Popup menu: Normal item.
    PmenuSel     { fg = Normal.fg.lighten(20), bg = cols.greylo.lighten(5) }, -- Popup menu: Selected item.
    -- PmenuSbar    { }, -- Popup menu: Scrollbar.
    PmenuThumb   { fg = Normal.fg.darken(10) }, -- Popup menu: Thumb of the scrollbar.
    -- Question     { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { fg = cols.bluesatmed.rotate(-30) }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine   { bg = cols.yellowlo.darken(10) }, -- Status line of current window
    -- StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- Tab pages line, not active tab page label
    -- TabLineFill  { }, -- Tab pages line, where there are no labels
    -- TabLineSel   { }, -- Tab pages line, active tab page label
    Title        { fg = cols.bluesatmed }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { fg = Normal.bg, bg = Normal.fg }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = cols.orangemed.lighten(40) }, -- Warning messages
    Whitespace   { fg = cols.yellowlo.lighten(15) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu     { fg = cols.greenmed }, -- Current match in 'wildmenu' completion

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = cols.greymidlo, gui = "italic" }, -- Any comment

    Constant       { fg = cols.bluesatmed.rotate(-20) }, -- (*) Any constant
    String         { fg = cols.bluesatmed.lighten(40) }, --   A string constant: "this is a string"
    Character      { fg = cols.bluedesathi }, --   A character constant: 'c', '\n'
    Number         { fg = cols.yellowhi.lighten(20) }, --   A number constant: 234, 0xff
    Float          { fg = cols.yellowhi.lighten(20) }, --   A floating point constant: 2.3e10
    Boolean        { fg = cols.bluesathi.rotate(-50) }, --   A boolean constant: TRUE, false

    Identifier     { fg = cols.yellowhi }, -- (*) Any variable name
    Function       { fg = cols.bluedesathi.lighten(20) }, --   Function name (also: methods for classes)

    Statement      { fg = cols.orangemed.rotate(20).lighten(80) }, -- (*) Any statement
    Conditional    { fg = cols.orangemed.lighten(40) }, --   if, then, else, endif, switch, etc.
    Repeat         { fg = cols.orangemed.lighten(20) }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    Operator       { fg = cols.orangehi.darken(5) }, --   "sizeof", "+", "*", etc.
    Keyword        { fg = cols.orangemed.lighten(60) }, --   any other keyword
    Exception      { fg = cols.redhi.lighten(30) }, --   try, catch, throw

    PreProc        { fg = cols.purplehi }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = cols.greenhi }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { fg = cols.orangehi.lighten(50) }, -- (*) Any special symbol
    SpecialChar    { fg = cols.orangehi }, --   Special character in a constant
    Tag            { fg = cols.orangehi }, --   You can use CTRL-] on this
    Delimiter      { fg = cols.orangehi.lighten(40) }, --   Character that needs attention
    SpecialComment { fg = Comment.fg.lighten(40).rotate(90) }, --   Special things inside a comment (e.g. '\n')
    Debug          { fg = cols.orangemed.lighten(40) }, --   Debugging statements

    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { }, -- Any erroneous construct
    Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { fg =  cols.redmed.lighten(10) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = WarningMsg.fg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = cols.bluesathi.darken(5) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = cols.bluesathi.lighten(5) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError { fg = cols.redhi } , -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn  { fg = WarningMsg.fg } , -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo  { fg = DiagnosticInfo.fg } , -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint  { fg = DiagnosticHint.fg } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    sym"@text.literal"      { fg = String.fg }, -- Comment
    sym"@text.reference"    { fg = Identifier.fg }, -- Identifier
    sym"@text.title"        { fg = Special.fg }, -- Title
    sym"@text.uri"          { fg = String.fg.lighten(40) }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    sym"@text.todo"         { fg = Type.fg }, -- Todo
    sym"@comment"           { fg = Comment.fg }, -- Comment
    sym"@punctuation"       { fg = Delimiter.fg }, -- Delimiter
    sym"@constant"          { fg = Constant.fg }, -- Constant
    sym"@constant.builtin"  { fg = Special.fg }, -- Special
    sym"@constant.macro"    { fg = Constant.fg }, -- Define
    sym"@define"            { fg = Type.fg }, -- Define
    sym"@macro"             { fg = Type.fg }, -- Macro
    sym"@string"            { fg = String.fg }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
