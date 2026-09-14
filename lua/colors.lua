-- color-setting function for both regular nvim and goyo
--- @return table
function _G.colors()
    if vim.o.background == "light" then
        return {
            blue   = '#80a0ff',
            cyan   = '#79dac8',
            black  = '#0f2228',
            white  = '#c6c6c6',
            red    = '#ff5189',
            yellow = '#e6db74',
            grey   = '#777777',
            silver = '#a0a0a0',
            -- Custom colors
            sand   = '#eadecc',
            rsand  = '#875f5f',
            darker = '#8aa3a2'
        }
    else -- dark colorscheme
        return {
            blue   = '#80a0ff',
            cyan   = '#79dac8',
            black  = '#292b2f',
            white  = '#c6c6c6',
            red    = '#ff5189',
            yellow = '#e6db74',
            grey   = '#777777',
            silver = '#a0a0a0',
            -- Custom colors
            sand   = '#918154',
            rsand  = '#875f5f',
            darker = '#4f4545'
        }
    end
end
