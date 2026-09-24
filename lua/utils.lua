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

-- Turns the current buffer name into its matching launcher name.
--- @param name string
--- @return string|nil
function _G.launcher_name(name)
    local launchers = {
        ["init.vim"] = "nvim",
        ["goyo.vim"] = "goyo",
    }
    -- fetch
    return launchers[name] or nil
end
