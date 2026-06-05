-- PlantUML support configuration

require 'nix'
local nix = Nix:new()

-- bundling requirements
vim.env['PATH'] = vim.env['PATH'] .. ':' .. nix:path("plantuml", "/bin")

-- plugin config
require 'plantuml'.setup {
    renderer = { type = "text" },
    options = { split_cmd = "vsplit" },
    render_on_write = true
}
