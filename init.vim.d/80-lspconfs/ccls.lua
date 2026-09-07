-- C language server config

require 'nix'
local nix = Nix:new()

-- other imports
local fwatch = require 'fwatch'
local path = require 'plenary.path'
local pscan = require 'plenary.scandir'
local util = require 'lspconfig/util'

-- Cmake utility variable
local lsp_cmake_sessions = {}

-- Cmake autobuild
--- @return string|unknown
local function setupCmakeIntegration()
    -- variable setup
    local op = { title = "CMake build lists integration" }
    local ppr = util.root_pattern('.ccls', '.git')(vim.fn.expand('%:p'))
    local bdir = "!!INVALID!!"
    local mybuf = vim.api.nvim_get_current_buf()

    if ppr == nil then
        return ""
    elseif lsp_cmake_sessions[ppr] ~= nil then
        return lsp_cmake_sessions[ppr]
    elseif path.new(ppr .. "/CMakeLists.txt"):exists() then
        local cmls = pscan.scan_dir(ppr, {
            respect_gitignore = true,
            add_dirs = false,
            search_pattern = "CMakeLists.txt"
        })
        local bdrs = pscan.scan_dir(ppr, {
            respect_gitignore = false,
            add_dirs = false,
            search_pattern = "CMakeCache.txt"
        })

        -- ensuring scan passed
        if bdrs[1] == nil then
            bdir = io.popen("mktemp -d --suffix=.cmake"):read()
        else
            bdir = bdrs[1]
            bdir = bdir:match("(.*/)")
        end

        -- define make commad
        local cmakecmd = "2>&1 >" .. bdir .. "/cmake.log " ..
            "cmake -B " .. bdir ..
            " -DCMAKE_EXPORT_COMPILE_COMMANDS=ON" .. ppr

        -- check compile commands
        for _, el in pairs(cmls) do
            fwatch.watch(el, {
                on_event = function()
                    -- rebuild CMake then restart ccls
                    io.popen(cmakecmd)
                    vim.notify("Reloaded compile commands, restarting LSP...", "info", op)
                    vim.schedule(function()
                        vim.lsp["ccls"].launch(mybuf)
                    end)
                end
            })
        end

        -- perform first CMake build
        io.popen(cmakecmd)
        lsp_cmake_sessions[ppr] = bdir
        return bdir
    else
        lsp_cmake_sessions[ppr] = ppr
        return ppr
    end
end

-- Config definition for ccls
vim.lsp.config('ccls', {
    cmd = nix:shell("ccls", { "ccls" }),
    init_options = {
        highlight = { lsRanges = true },
        compilationDatabaseDirectory = setupCmakeIntegration()
    },
    filetypes = {
        "c", "cpp", "objc", "objcpp",
        "cuda", "c.doxygen", "cpp.doxygen", "cuda.doxygen"
    }
})

-- CMakelsp config
vim.lsp.config('cmake', {
    cmd = nix:shell("cmake-language-server", { "cmake-language-server" })
})

-- Enabling configurations
vim.lsp.enable('ccls')
vim.lsp.enable('cmake')
