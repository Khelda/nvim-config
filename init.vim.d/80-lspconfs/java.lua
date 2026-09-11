-- Java LSP configuration

require 'nix'
local nix = Nix:new()

-- Fetches JDTLS working cache path
--- @return string
local function jdtls_cache_dir()
    return vim.fn.stdpath('cache') .. '/jdtls'
end

-- Fetches workspace data path
--- @return string
local function jdtls_workspace_dir()
    return jdtls_cache_dir() .. '/workspace'
end

-- Fetches configuration path
--- @return string
local function jdtls_config_dir()
    return jdtls_cache_dir() .. '/config'
end

-- extra settings for JDTLS
--- @return table
local function jdtls_get_jvm_args()
    local env = os.getenv("JDTLS_JVM_ARGS")
    local args = {}
    for arg_str in string.gmatch((env or ""), "%S+") do
        local arg = string.format("--jvm-arg=%s", arg_str)
        table.insert(args, arg)
    end
    return args -- FIXME turn this into a string
end

-- LSP config
vim.lsp.config('jdtls', {
    cmd = function(dispatchers, config)
        -- ensure correct dirs are fetched
        local data_dir = jdtls_workspace_dir()
        if config.root_dir then
            data_dir = data_dir .. '/'
                .. vim.fn.fnamemodify(config.root_dir, ':p:h:t')
        end

        -- define launch command
        local config_cmd = nix:shell('jdt-language-server', {
            'jdtls',
            '-configuration', jdtls_config_dir(),
            '-data', data_dir,
            '-Dlog.level=ERROR >&2 /dev/null',
            jdtls_get_jvm_args()
        })

        -- launch
        return vim.lsp.rpc.start(config_cmd, dispatchers, {
            cwd = config.cmd_cwd,
            env = config.cmd_env,
            detached = config.detached
        })
    end,
    -- extra settings
    filetypes = { 'java' },
    root_markers = { 'pom.xml', 'build.gradle', '.git' },

    -- lsp stfu handlers
    handlers = {
        ['$/progress'] = function(_, _, _) end, -- annoying popup on keystroke
        ['language/status'] = function(_, _, _) end,
        ['window/logMessage'] = function(_, _, _) end
    }
})

-- Enable config
vim.lsp.enable('jdtls')
