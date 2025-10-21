-- Custom notification popups

local vnotify = require 'notify'

-- Notification setup
vnotify.setup {
    background_colour = "#262626"
}

-- Notification call
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings")
    then
        return -- also known as a stfu handler
    end

    vnotify(msg, ...)
end
