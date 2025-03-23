--
-- Salesforce Agent plugin configuration file
--

require 'nix'
local nix = Nix:new()

-- nix pathing to add sf command
vim.env['PATH'] = vim.env['PATH'] .. ':' .. nix:path('sf', '/bin')

-- actual configuration
require 'salesforce'.setup {
    debug = {
        to_file = false,
        to_command_line = false -- no need for that kind of debug
    },
    popup = {
        -- Popup dimensions and style
        width = 60,
        height = 40,
        borderchars = { '-', '|', '-', '|', '╭', '╮', '╯', '╰' }
    },
    file_manager = {
        -- this shouldn't cause further problems
        ignore_conflicts = false
    },
    org_manager = {
        default_org_indicator = ""
        -- TODO check other mandatory settings
    }
}
