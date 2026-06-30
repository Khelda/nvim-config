-- MesonLSP configuration

require 'nix'
local nix = Nix:new()

-- aux function
local function meson_matcher(_, path)
    local pattern = "meson.build"
    local f = vim.fn.glob(table.concat({ path, pattern }, '/'))
    -- pre-emptive check
    if f == '' then
        return false
    end
    -- checking for meson
    for line in io.lines(f) do
        -- skip comments
        if not line:match '^%s*#.*' then
            local str = line:gsub('%s+', '')
            if str ~= '' then
                return true
            else
                break
            end
        end
    end
    -- failsafe return
    return false
end

-- configuring lsp
vim.lsp.config('mesonlsp', {
    cmd = nix:shell("mesonlsp", { "mesonlsp", "--lsp" }),
    -- core LSP options
    filetypes = { "meson" },
    root_dir = function(bufnr, on_dir)
        on_dir(vim.fs.root(bufnr, meson_matcher) or vim.fs.root(bufnr, '.git'))
    end
})

-- activating lsp
vim.lsp.enable("mesonlsp")
