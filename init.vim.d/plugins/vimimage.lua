-- Image.nvim configuration

require 'nix'
local nix = Nix:new()

-- Image display settings
require 'image'.setup {
    backend = "kitty",
    max_width = 300,
    max_height = 50,
    max_height_window_percentage = math.huge,
    max_width_window_percentage = math.huge,
    window_overlap_clear_enabled = true,
    integrations = { markdown = {
        enabled = true,
        clear_in_insert_mode = true,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { "markdown", "vimwiki", "pandoc" }
    } }
}

-- WM checks
vim.env['PATH'] = vim.env['PATH'] .. ':' .. nix:path("wl-clipboard-x11", "/bin")

-- img-clip config
require 'img-clip'.setup {
    pandoc = {
        url_encode_path = true,
        template = "![$CURSOR]($FILE_PATH)",
        drag_and_drop = { download_images = false }
    }
}
