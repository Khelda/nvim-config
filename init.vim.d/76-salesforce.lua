--
-- Salesforce Agent plugin configuration file
--

require 'nix'
local nix = Nix:new()

-- TODO nix pathing to add sf command
vim.env['PATH'] = vim.env['PATH'] .. ':' .. nix:path('sf', '/bin')

require 'salesforce'.setup {
    debug = {
        to_file = false,
        to_command_line = false
    },
    popup = {
        -- Popup dimensions and style
        width = 100,
        height = 40,
        borderchars = { '-', '|', '-', '|', '╭', '╮', '╯', '╰' }
    },
    file_manager = {
        -- this shouldn't cause further problems
        ignore_conflicts = false
    }
    -- TODO org settings
}
