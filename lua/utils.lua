-- Utility functions module

require 'colors'

-- useful function to split a string in twain.
--- @param txt string
--- @param sep string
--- @return table
function _G.split(txt, sep)
    if sep == nil then
        sep = "%s"
    end
    -- parse the given string
    local shards = {}
    for str in string.gmatch(txt, "([^" .. sep .. "]+)") do
        table.insert(shards, str)
    end
    return shards
end

-- Visual multi tweaks
function _G.get_visual_multi()
    local result = vim.fn["VMInfos"]()
    local ratio = result.ratio
    return "󱢓 " .. ratio
end

-- builds the theme for the lualine
--- @return table
function _G.bubbles_theme()
    local colors = colors()
    return {
        normal = {
            a = { fg = colors.black, bg = colors.sand },
            b = { fg = colors.white, bg = colors.darker },
            c = { fg = colors.black, bg = colors.black },
        },

        insert = {
            a = { fg = colors.black, bg = colors.sand },
            c = { fg = "NONE", bg = colors.black }
        },

        visual = { a = { fg = colors.black, bg = colors.rsand } },
        replace = {
            -- Warning sign
            a = { fg = colors.black, bg = colors.blue },
            b = { fg = colors.white, bg = colors.darker },
            c = { fg = colors.black, bg = colors.black },
        },
        terminal = { a = { fg = colors.white, bg = colors.sand } },

        inactive = {
            a = { fg = colors.black, bg = colors.grey },
            b = { fg = colors.black, bg = "NONE" },
            c = { fg = colors.black, bg = "NONE" },
        }
    }
end
