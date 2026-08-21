-- Utility functions module

-- useful function to split a string in twain.
--- @param txt string
--- @param sep string
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
