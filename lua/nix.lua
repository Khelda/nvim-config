-- Global references to ensure Lua linking
local has_nix = false
Nix = {}

-- Quickfix for wonky profiles, harmless if dir doesn't exist
vim.env['PATH'] = vim.env['PATH'] .. ':/nix/var/nix/profiles/default/bin'

-- Check for Nix installation beforehand
local f = io.open('/nix')
if f then
    f:close()
    has_nix = true
end

-- Nix fetcher function. Returns the current Nix reference for further calls.
function Nix:new()
    if _G.nix then
        return _G.nix -- Invoke global instance
    end
    local t = { conf_root = "", fetchlist = {} }
    t.conf_root = vim.api.nvim_list_runtime_paths()[1]
    setmetatable(t, { __index = self })
    _G.nix = t -- Pin global instance
    return t
end

-- Changes execution PATH to include a Nix-fetched binary.
--- @param pkg  string
--- @param path table
function Nix:path(pkg, path)
    if has_nix
    then
        table.insert(self.fetchlist, pkg)
        local drv = io.popen(
            "nix --extra-experimental-features 'nix-command flakes' build --quiet --no-link --print-out-paths " ..
            self.conf_root .. "#" .. pkg):read()
        return drv .. path
    else
        return ""
    end
end

-- Uses nix shell to bundle a binary in a command. Useful for LSPs.
--- @param pkg  string
--- @param cmd  table
function Nix:shell(pkg, cmd)
    if has_nix and (vim.call('executable', cmd[1]) == 0)
    then -- Generate nix shell wrapper
        table.insert(self.fetchlist, pkg)
        local cmdl = { "nix", "--extra-experimental-features", "nix-command flakes", "shell", self.conf_root ..
        "#" .. pkg, "-c" }
        for _, el in pairs(cmd) do
            table.insert(cmdl, el)
        end
        return cmdl
    else
        return cmd
    end
end

-- Prefetch LSPs before use.
function _G.nixsh_prefetch()
    local op = { title = "LSP Servers over Nix" }
    if not has_nix then
        vim.notify("Auto-installing language servers requires Nix.", "error", op)
        return
    end
    local args = { "--extra-experimental-features", "nix-command flakes", "build", "--quiet", "--no-link" }
    for _, value in pairs(_G.nix.fetchlist) do
        table.insert(args, _G.nix.conf_root .. '#' .. value)
    end
    vim.notify("Prefetching language servers, hang tight...", "info", op)
    vim.loop.spawn("nix", { args = args }, function()
        vim.notify("Done!", "info", op)
    end)
end
