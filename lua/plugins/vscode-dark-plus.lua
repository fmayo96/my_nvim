-- VS Code Dark+ colorscheme, implemented locally so it needs no extra plugin.
local function apply()
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.background = "dark"
  vim.g.colors_name = "vscode-dark-plus"

  local colors = {
    bg = "#1e1e1e",
    bg_dark = "#181818",
    bg_light = "#252526",
    border = "#3e3e42",
    fg = "#d4d4d4",
    muted = "#808080",
    comment = "#6a9955",
    blue = "#569cd6",
    light_blue = "#9cdcfe",
    bright_blue = "#4fc1ff",
    cyan = "#4ec9b0",
    green = "#b5cea8",
    orange = "#ce9178",
    yellow = "#dcdcaa",
    tan = "#d7ba7d",
    regex = "#d16969",
    red = "#f44747",
    purple = "#c586c0",
  }

  local set = vim.api.nvim_set_hl
  local function hi(group, spec)
    set(0, group, spec)
  end
  local function link(group, target)
    hi(group, { link = target })
  end

  -- Editor and window chrome.  Keep the terminal wallpaper visible through
  -- Neovim while retaining the existing Dark+ foreground colors.
  hi("Normal", { fg = colors.fg, bg = "NONE" })
  hi("NormalNC", { fg = colors.fg, bg = "NONE" })
  hi("NormalFloat", { fg = colors.fg, bg = "NONE" })
  hi("SignColumn", { bg = "NONE" })
  hi("FoldColumn", { fg = colors.muted, bg = "NONE" })
  hi("EndOfBuffer", { fg = colors.bg_dark, bg = "NONE" })
  hi("CursorLine", { bg = "NONE" })
  hi("CursorColumn", { bg = "NONE" })
  hi("ColorColumn", { bg = "NONE" })
  hi("LineNr", { fg = colors.muted, bg = "NONE" })
  hi("CursorLineNr", { fg = colors.fg, bg = "NONE", bold = true })
  hi("Visual", { bg = "#264f78" })
  hi("Search", { fg = colors.bg, bg = "#613315" })
  hi("IncSearch", { fg = colors.bg, bg = colors.orange })
  hi("MatchParen", { bg = "#515c6a", bold = true })
  hi("StatusLine", { fg = colors.fg, bg = colors.bg_light })
  hi("StatusLineNC", { fg = colors.muted, bg = colors.bg_light })
  hi("TabLine", { fg = colors.muted, bg = "NONE" })
  hi("TabLineFill", { bg = "NONE" })
  hi("TabLineSel", { fg = colors.fg, bg = "NONE", bold = true })
  hi("WinSeparator", { fg = colors.border })
  hi("VertSplit", { fg = colors.border })
  hi("FloatBorder", { fg = colors.border, bg = "NONE" })
  hi("Pmenu", { fg = colors.fg, bg = "NONE" })
  hi("PmenuSel", { fg = "#ffffff", bg = "#094771" })
  hi("PmenuSbar", { bg = colors.border })
  hi("PmenuThumb", { bg = colors.muted })
  hi("Whitespace", { fg = "#404040" })
  hi("NonText", { fg = "#404040" })
  hi("Directory", { fg = colors.blue })
  hi("Title", { fg = colors.cyan, bold = true })

  -- Floating windows and Telescope panels should be transparent as well.
  hi("TelescopeNormal", { link = "NormalFloat" })
  hi("TelescopeBorder", { link = "FloatBorder" })
  hi("TelescopePromptNormal", { link = "TelescopeNormal" })
  hi("TelescopePromptBorder", { link = "TelescopeBorder" })
  hi("TelescopeResultsNormal", { link = "TelescopeNormal" })
  hi("TelescopeResultsBorder", { link = "TelescopeBorder" })
  hi("TelescopePreviewNormal", { link = "TelescopeNormal" })
  hi("TelescopePreviewBorder", { link = "TelescopeBorder" })
  hi("TelescopePromptTitle", { fg = colors.blue, bg = "NONE", bold = true })
  hi("TelescopeResultsTitle", { fg = colors.blue, bg = "NONE", bold = true })
  hi("TelescopePreviewTitle", { fg = colors.blue, bg = "NONE", bold = true })
  hi("TelescopeSelection", { fg = colors.fg, bg = "#264f78" })

  -- Other common floating interfaces inherit the same transparent surface.
  hi("NeoTreeNormal", { fg = colors.fg, bg = "NONE" })
  hi("NeoTreeNormalNC", { fg = colors.fg, bg = "NONE" })
  hi("NeoTreeFloatNormal", { fg = colors.fg, bg = "NONE" })
  hi("NeoTreeFloatBorder", { fg = colors.border, bg = "NONE" })

  -- Vim syntax groups, following VS Code's bundled Dark+ token colors.
  hi("Comment", { fg = colors.comment })
  hi("Constant", { fg = colors.bright_blue })
  hi("String", { fg = colors.orange })
  hi("Character", { fg = colors.orange })
  hi("Number", { fg = colors.green })
  hi("Boolean", { fg = colors.blue })
  hi("Float", { fg = colors.green })
  hi("Identifier", { fg = colors.light_blue })
  hi("Function", { fg = colors.yellow })
  hi("Statement", { fg = colors.blue })
  hi("Keyword", { fg = colors.blue })
  hi("Conditional", { fg = colors.purple })
  hi("Repeat", { fg = colors.purple })
  hi("Operator", { fg = colors.fg })
  hi("Exception", { fg = colors.purple })
  hi("Label", { fg = "#c8c8c8" })
  hi("PreProc", { fg = colors.blue })
  hi("Define", { fg = colors.blue })
  hi("Macro", { fg = colors.blue })
  hi("Type", { fg = colors.cyan })
  hi("Structure", { fg = colors.cyan })
  hi("StorageClass", { fg = colors.blue })
  hi("Typedef", { fg = colors.cyan })
  hi("Special", { fg = colors.tan })
  hi("SpecialChar", { fg = colors.tan })
  hi("Tag", { fg = colors.blue })
  hi("Todo", { fg = colors.bg, bg = colors.yellow, bold = true })
  hi("Delimiter", { fg = colors.fg })

  -- Treesitter captures. More specific captures must be explicit because a
  -- single Vim group cannot represent all of Dark+'s TextMate scopes.
  link("@comment", "Comment")
  link("@comment.documentation", "Comment")
  link("@string", "String")
  link("@string.documentation", "String")
  hi("@string.regexp", { fg = colors.regex })
  hi("@string.escape", { fg = colors.tan })
  hi("@string.special", { fg = colors.orange })
  hi("@string.special.symbol", { fg = colors.blue })
  link("@character", "Character")
  hi("@character.special", { fg = colors.tan })
  link("@number", "Number")
  link("@number.float", "Float")
  link("@boolean", "Boolean")
  hi("@constant", { fg = colors.bright_blue })
  hi("@constant.builtin", { fg = colors.blue })
  hi("@constant.macro", { fg = colors.blue })
  hi("@variable", { fg = colors.light_blue })
  hi("@variable.parameter", { fg = colors.light_blue })
  hi("@variable.member", { fg = colors.light_blue })
  hi("@variable.builtin", { fg = colors.blue })
  hi("@module", { fg = colors.cyan })
  hi("@module.builtin", { fg = colors.cyan })
  link("@function", "Function")
  link("@function.call", "Function")
  link("@function.builtin", "Function")
  link("@function.method", "Function")
  link("@function.method.call", "Function")
  hi("@function.macro", { fg = colors.blue })
  hi("@constructor", { fg = colors.cyan })
  link("@keyword", "Keyword")
  hi("@keyword.coroutine", { fg = colors.purple })
  hi("@keyword.function", { fg = colors.blue })
  hi("@keyword.import", { fg = colors.purple })
  hi("@keyword.type", { fg = colors.blue })
  hi("@keyword.modifier", { fg = colors.blue })
  hi("@keyword.repeat", { fg = colors.purple })
  hi("@keyword.return", { fg = colors.purple })
  hi("@keyword.debug", { fg = colors.purple })
  hi("@keyword.exception", { fg = colors.purple })
  hi("@keyword.conditional", { fg = colors.purple })
  hi("@keyword.conditional.ternary", { fg = colors.fg })
  hi("@keyword.directive", { fg = colors.blue })
  hi("@keyword.directive.define", { fg = colors.blue })
  link("@operator", "Operator")
  hi("@keyword.operator", { fg = colors.blue })
  link("@type", "Type")
  hi("@type.builtin", { fg = colors.blue })
  link("@type.definition", "Type")
  hi("@attribute", { fg = colors.cyan })
  hi("@attribute.builtin", { fg = colors.cyan })
  hi("@property", { fg = colors.light_blue })
  link("@punctuation.delimiter", "Delimiter")
  link("@punctuation.bracket", "Delimiter")
  hi("@punctuation.special", { fg = colors.blue })
  hi("@tag", { fg = colors.blue })
  hi("@tag.builtin", { fg = colors.blue })
  hi("@tag.attribute", { fg = colors.light_blue })
  hi("@tag.delimiter", { fg = colors.muted })
  hi("@markup.heading", { fg = colors.blue, bold = true })
  hi("@markup.strong", { fg = colors.blue, bold = true })
  hi("@markup.italic", { fg = colors.purple, italic = true })
  hi("@markup.quote", { fg = colors.comment })
  hi("@markup.link.label", { fg = colors.light_blue })
  hi("@markup.link.url", { fg = colors.orange, underline = true })
  hi("@markup.raw", { fg = colors.orange })
  hi("@markup.list", { fg = "#6796e6" })
  hi("@diff.plus", { fg = colors.green })
  hi("@diff.minus", { fg = colors.orange })
  hi("@diff.delta", { fg = colors.blue })

  -- LSP semantic tokens take precedence over Treesitter in Neovim. These
  -- mirror Dark+'s semantic categories so LSP-enabled buffers stay consistent.
  hi("@lsp.type.namespace", { fg = colors.cyan })
  hi("@lsp.type.type", { fg = colors.cyan })
  hi("@lsp.type.class", { fg = colors.cyan })
  hi("@lsp.type.enum", { fg = colors.cyan })
  hi("@lsp.type.interface", { fg = colors.cyan })
  hi("@lsp.type.struct", { fg = colors.cyan })
  hi("@lsp.type.typeParameter", { fg = colors.cyan })
  hi("@lsp.type.parameter", { fg = colors.light_blue })
  hi("@lsp.type.variable", { fg = colors.light_blue })
  hi("@lsp.type.property", { fg = colors.light_blue })
  hi("@lsp.type.enumMember", { fg = colors.bright_blue })
  hi("@lsp.type.event", { fg = colors.light_blue })
  hi("@lsp.type.function", { fg = colors.yellow })
  hi("@lsp.type.method", { fg = colors.yellow })
  hi("@lsp.type.macro", { fg = colors.blue })
  hi("@lsp.type.keyword", { fg = colors.blue })
  hi("@lsp.type.comment", { fg = colors.comment })
  hi("@lsp.type.string", { fg = colors.orange })
  hi("@lsp.type.number", { fg = colors.green })
  hi("@lsp.type.regexp", { fg = colors.regex })
  hi("@lsp.type.operator", { fg = colors.fg })
  hi("@lsp.type.decorator", { fg = colors.cyan })

  -- Diagnostics and version-control signs.
  hi("DiagnosticError", { fg = colors.red })
  hi("DiagnosticWarn", { fg = colors.yellow })
  hi("DiagnosticInfo", { fg = colors.blue })
  hi("DiagnosticHint", { fg = colors.cyan })
  hi("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
  hi("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
  hi("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
  hi("DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyan })
  hi("DiffAdd", { fg = colors.cyan, bg = "#263d2a" })
  hi("DiffChange", { fg = colors.yellow, bg = "#3b3620" })
  hi("DiffDelete", { fg = colors.red, bg = "#4b2525" })
  hi("DiffText", { fg = colors.fg, bg = "#4b4b20" })
  hi("GitSignsAdd", { fg = colors.cyan })
  hi("GitSignsChange", { fg = colors.yellow })
  hi("GitSignsDelete", { fg = colors.red })
  hi("ErrorMsg", { fg = colors.red })
  hi("WarningMsg", { fg = colors.yellow })
  hi("ModeMsg", { fg = colors.cyan })

  vim.g.terminal_color_0 = "#000000"
  vim.g.terminal_color_1 = "#cd3131"
  vim.g.terminal_color_2 = "#0dbc79"
  vim.g.terminal_color_3 = "#e5e510"
  vim.g.terminal_color_4 = "#2472c8"
  vim.g.terminal_color_5 = "#bc3fbc"
  vim.g.terminal_color_6 = "#11a8cd"
  vim.g.terminal_color_7 = "#e5e5e5"
  vim.g.terminal_color_8 = "#666666"
  vim.g.terminal_color_9 = "#cd3131"
  vim.g.terminal_color_10 = "#0dbc79"
  vim.g.terminal_color_11 = "#e5e510"
  vim.g.terminal_color_12 = "#2472c8"
  vim.g.terminal_color_13 = "#bc3fbc"
  vim.g.terminal_color_14 = "#11a8cd"
  vim.g.terminal_color_15 = "#ffffff"
end

-- This is a local config module rather than a plugin dependency.  Applying
-- once now and once after lazy.nvim startup makes it the final default even
-- when an older theme spec is still present in this directory.
apply()
vim.schedule(apply)

return {}
