-- game
require("config")
require("door")
require("map")
require("particles")
require("player")
require("resources")
require("util")

-- states
require("ingame")

-- 3rd party libraries
require("libraries/AnAL")

WIDTH = 256
HEIGHT = 200
MAPW = 41*16
MAPH = 16*16
show_debug = false

function love.load(dt)
    loadConfig()
    love.graphics.setBackgroundColor(0,0,0)
    loadResources()

    state = 1
    level = 1;
    ingame.enter(level)
end

function love.update(dt)
    ingame.update(dt)
end

function love.draw()
    -- Draw border and enable scissoring for fullscreen
    love.graphics.push()
    setZoom()
    ingame.draw()
    love.graphics.pop()
    love.graphics.setScissor()
end

function setZoom()
    if config.fullscreen == 1 then
        local sw = love.graphics.getWidth()/WIDTH/config.scale
        local sh = love.graphics.getHeight()/HEIGHT/config.scale
        love.graphics.scale(sw,sh)
    elseif config.fullscreen == 2 then
        local sw = love.graphics.getWidth()/WIDTH/config.scale
        local sh = love.graphics.getHeight()/HEIGHT/config.scale
        local tx = (love.graphics.getWidth() - WIDTH*config.scale*sh)/2
        love.graphics.translate(tx, 0)
        love.graphics.scale(sh, sh)
        love.graphics.setScissor(tx, 0, WIDTH*config.scale*sh, love.graphics.getHeight())
    elseif config.fullscreen == 3 then
        love.graphics.translate(fs_translatex,fs_translatey)
        love.graphics.setScissor(fs_translatex, fs_translatey, WIDTH*config.scale, HEIGHT*config.scale)
    end
end

function love.keypressed(k, uni)
    ingame.keypressed(k, uni)
end
