require 'math'
require 'os'
inspect = require 'inspect'

-- Import leaf aliases
require 'leaf'
fs      = leaf.fs

-- Global handles
gameState = {}
scrw = love.graphics.getWidth
scrh = love.graphics.getHeight

function love.load()
    math.randomseed(os.time())
    math.random() -- Dumbass OSX fix

    -- Start loading sequence
    local loader = require 'loader'
    gameState = loader
    loader.load(function()
        -- Start game
        gameState = require 'game'
    end)
end

-- Wrap gamestate functions
for i, func in ipairs{'update', 'draw', 'keypressed', 'mousepressed', 'mousereleased', 'quit'} do
    love[func] = function (...)
        if gameState[func] and type(gameState[func] == 'function') then 
            gameState[func](...)
        end
    end
end
