require 'math'
require 'os'

function love.load()
	math.randomseed(os.time())
	math.random() -- Dumbass OSX fix
end

function love.update(dt)
    --
end

function love.draw()
    --
end 

function love.keypressed(key, unicode)
    --
end

function love.mousepressed(x, y, button)
    --
end

function love.mousereleased(x, y, button)

end

function love.quit()
    --
end
