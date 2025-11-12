-- Kotlin language server configuration

require 'nix'
local nix = Nix:new()

local root_files = {
    'build.gradle', 'build.gradle.kts',       -- Gradle build
    'settings.gradle', 'settings.gradle.kts', -- Gradle tweaks
    'pom.xml', 'build.xml',                   -- Other toolchains
    '.git'                                    -- extra markers
}

-- LSP settings
vim.lsp.config('kotlin_language_server', {
    cmd = nix:shell("kotlin-language-server", { "kotlin-language-server" }),
    -- filter settings
    filetypes = { 'kotlin' },
    root_markers = root_files,
    -- launch options
    init_options = {
        storagePath = vim.fs.root(vim.fn.expand '%:p:h', root_files)
    }
})

-- Enabling LSP
vim.lsp.enable('kotlin_language_server')
