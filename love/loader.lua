-- Asset namespaces
local loader = Context()

local progress = 0
local finished = function() end
local thread = nil

function loader.load(f)
    -- Start loading thread
    finished = f
    thread = coroutine.create(function()
        -- Load Stuff
    end)
end

function loader.update(dt)
    if not coroutine.resume(thread) then
        finished()
    end
end

function loader.draw()
    local padding = 150
    love.graphics.printf('LOADING', 0, scrh()/2, scrw(), 'center')
    love.graphics.rectangle('line', padding, scrh() * 2 / 3,
                                    scrw() - padding * 2, 100)
    love.graphics.rectangle('fill', padding, scrh() * 2 / 3,
                                    (scrw() - padding * 2) * progress, 100)
end

return loader
