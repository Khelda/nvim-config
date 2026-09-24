-- Jupyter configuration for Neovim

-- configure the plugin
require 'nvim-jupyter-client'.setup {
    template = {
        cells = {
            {
                cell_type = "code",
                execution_count = nil,
                source = { "# Custom template cell\n" }
            }
        }
    }
}
