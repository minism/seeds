require 'math'
require 'os'

function love.load()
    -- Seed randomness
    math.randomseed(os.time()); math.random()
end

