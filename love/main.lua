require 'math'
require 'os'
require 'leaf'
inspect = require 'inspect'

-- Aliases
fs      = leaf.fs
Object  = leaf.Object
Context = leaf.Context
app     = leaf.app

function love.load()
    -- Seed
    math.randomseed(os.time()); math.random()

    -- Register love callbacks
    app.bindLove()

    -- Run game
    local game = require 'game'
    app.pushContext(game)
end
