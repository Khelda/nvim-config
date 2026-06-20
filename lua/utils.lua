-- useful function to split a string in twain.
function _G.split(txt, sep)
    if sep == nil then
        sep = "%s"
    end
    local shards = {}
    for str in string.gmatch(txt, "([^" .. sep .. "]+)") do
        table.insert(shards, str)
    end
    return shards
end
