-- Git conflict markers
require 'git-conflict'.setup {
    default_mappings = false,
    disable_diagnostics = true
}

-- Visual git setup
require 'vgit'.setup {}

-- vgit usage
local function _git(args)
    if args.button == "l" then
        vim.cmd("VGit buffer_hunk_preview")
    elseif args.button == "m" then
        vim.cmd("VGit buffer_hunk_reset")
    elseif args.button == "r" then
        vim.cmd("VGit buffer_hunk_stage")
    end
end

-- Diagnostic function
local function _diag(args)
    if args.button == "m" then
        vim.cmd("CodeActionMenu")
    else
        require 'statuccol.builtin'.diagnostic_click(args)
    end
end

-- definition
require 'statuscol'.setup {
    relculright = false,
    clickhandlers = {
        DiagnosticSignError = _diag,
        DiagnosticSignHint = _diag,
        DiagnosticSignInfo = _diag,
        DiagnosticSignWarn = _diag,
        GitSignsTopdelete = _git,
        GitSignsUntracked = _git,
        GitSignsAdd = _git,
        GitSignsChange = _git,
        GitSignsChangeDelete = _git,
        GitSignsDelete = _git,
        gitsigns_extmark_signs_ = _git
    }
}
