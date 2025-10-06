-- Light/dark theme watch
require 'fwatch'.watch(os.getenv("XDG_RUNTIME_DIR") .. "/theme", {
    on_event = function()
        vim.defer_fn(vim.fn.SetColor, 10)
    end
})
