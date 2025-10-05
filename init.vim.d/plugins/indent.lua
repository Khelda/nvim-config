-- Indent settings

local hooks = require 'ibl.hooks'

-- Normal indent
require 'ibl'.setup {
    indent = { char = '┊' },
    exclude = { filetypes = {
        "startify",
        "NvimTree", "vista_kind", "vista", "Trouble", "coq-goals"
    } }
}
