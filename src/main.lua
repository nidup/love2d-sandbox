require("config")
require("resources")
require("ingame")
require("player")
require("util")

-- 3rd party libraries
require("libraries/AnAL")

gamestates = {[0]=splash, [1]=ingame, [2]=mainmenu}

debug = true

function love.load(dt)
    loadConfig()
    love.graphics.setBackgroundColor(0,0,0)
    loadResources()

    state = 1
    level = 1;
    ingame.enter(level)
end

function love.update(dt)

--    print(gamestates[state])

--    gamestates[state].update(dt)

    ingame.update(dt)
end

function love.draw()
    ingame.draw(dt)
--    gamestates[state].draw()
end

function love.keypressed(k, uni)
    --    gamestates[state].keypressed(k, uni)
    ingame.keypressed(k, uni)
end
