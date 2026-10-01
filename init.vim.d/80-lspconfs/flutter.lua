-- Flutter  support and tools

require 'nix'
local nix = Nix:new()

-- tweaking path to add Flutter
vim.env['PATH'] = vim.env["PATH"] .. ":" .. nix:path("flutter", "/bin")

-- extra configurations
require 'telescope'.load_extension("flutter")

-- main config
require 'flutter-tools'.setup {
    -- core options
    flutter_path = "flutter",
    root_patterns = { ".git" },
    -- language server settings
    lsp = {
        -- core settings
        capabilities = {
            cmd = nix:shell("dart", { "dart", "language-server" }),
            filetypes = { "dart" },
            root_markers = { ".git" }
        },
        -- load colorimetrics
        on_attach = function(ev)
            vim.lsp.document_color.enable(true, { bufnr = ev.buf })
        end
    }
    -- TODO emulators config
    -- TODO extra interface settings
}
