local M = {}

function M.setup(theme_name)
	local theme = theme_name or _G.theme or "paradise"

	local ok, base16 = pcall(require, "base16-colorscheme")
	if not ok then
		vim.notify("base16-colorscheme not found!", vim.log.levels.ERROR)
		return
	end

	local ok2, color = pcall(require, "colors." .. theme)
	if not ok2 or type(color) ~= "table" then
		vim.notify("Theme '" .. theme .. "' not found or invalid, falling back to paradise", vim.log.levels.WARN)
		local ok3, fallback = pcall(require, "colors.paradise")
		if not ok3 or type(fallback) ~= "table" then
			vim.notify("Failed to load fallback theme 'paradise'", vim.log.levels.ERROR)
			return
		end
		color = fallback
	end

	base16.setup(color)

	local function hl(group, fg, bg, attrs)
		fg = fg or "none"
		bg = bg or "none"
		attrs = attrs or ""
		vim.cmd(string.format("hi %s guifg=%s guibg=%s %s", group, fg, bg, attrs))
	end

	hl("Normal", nil, "none")
	hl("StatusNormal")
	hl("StatusLineNC", color.base03)
	hl("StatusActive", color.base05)
	hl("StatusLine", color.base02)
	hl("StatusReplace", color.base08)
	hl("StatusInsert", color.base0B)
	hl("StatusCommand", color.base0A)
	hl("StatusVisual", color.base0D)
	hl("StatusTerminal", color.base0E)
	hl("StatusLine", nil, color.base01)

	hl("NvimTreeFolderName", color.base05)
	hl("NvimTreeOpenedFolderName", color.base05)
	hl("NvimTreeEmptyFolderName", color.base05)
	hl("NvimTreeFolderIcon", color.base03)
	hl("NvimTreeGitDirty", color.base08)
	hl("NvimTreeGitNew", color.base0B)
	hl("NvimTreeGitDeleted", color.base08)
	hl("NvimTreeGitRenamed", color.base0A)
	hl("NvimTreeGitExecFile", color.base0B)
	hl("NvimTreeSpecialFile", color.base0E)
	hl("NvimTreeImageFile", color.base0C)
	hl("NvimTreeWindowPicker", color.base05, color.base01)
	hl("NvimTreeIndentMarker", color.base03)
	hl("NvimTreeWinSeparator", color.base01, nil)

	hl("TelescopePromptBorder", color.base01, color.base01)
	hl("TelescopePromptNormal", nil, color.base01)
	hl("TelescopePromptPrefix", color.base08, color.base01)
	hl("TelescopeSelection", nil, color.base01)

	hl("GitSignsAdd", color.base0B)
	hl("GitSignsChange", color.base03)
	hl("GitSignsDelete", color.base08)
	hl("GitSignsChangedelete", color.base08)
	hl("GitSignsTopdelete", color.base08)
	hl("GitSignsUntracked", color.base03)

	hl("Pmenu", nil, color.base01)
	hl("PmenuSbar", nil, color.base01)
	hl("PmenuThumb", nil, color.base01)
	hl("PmenuSel", nil, color.base02)

	hl("CmpItemAbbrMatch", color.base05)
	hl("CmpItemAbbrMatchFuzzy", color.base05)
	hl("CmpItemAbbr", color.base03)
	hl("CmpItemKind", color.base0E)
	hl("CmpItemMenu", color.base0E)
	hl("CmpItemKindSnippet", color.base0E)

	hl("CursorLine", nil, color.base01)
	hl("CursorLineNR", nil, color.base01)
	hl("LineNr", color.base03)
end

return M
