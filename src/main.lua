debug = true

player = { x = 200, y = 710, speed = 150, img = nil }
canShoot = true
canShootTimerMax = 0.2
canShootTimer = canShootTimerMax

bulletImg = nil
bullets = {}

function love.load(dt)
    player.img = love.graphics.newImage("assets/plane.png")
    bulletImg = love.graphics.newImage('assets/bullet.png')
end

function love.update(dt)
    -- escape
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

    -- player moves
    if love.keyboard.isDown('left','a') then
        if player.x > 0 then
            player.x = player.x - (player.speed*dt)
        end
    elseif love.keyboard.isDown('right','d') then
        if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
            player.x = player.x + (player.speed*dt)
        end
    end

    -- player shoots
    canShootTimer = canShootTimer - (1 * dt)
    if canShootTimer < 0 then
        canShoot = true
    end

    if love.keyboard.isDown(' ') and canShoot then
        newBullet = { x = player.x + (player.img:getWidth()/2), y = player.y, img = bulletImg }
        table.insert(bullets, newBullet)
        canShoot = false
        canShootTimer = canShootTimerMax
    end

    -- update the positions of bullets
    for i, bullet in ipairs(bullets) do
        bullet.y = bullet.y - (250 * dt)

        if bullet.y < 0 then -- remove bullets when they pass off the screen
            table.remove(bullets, i)
        end
    end
end

function love.draw(dt)
    love.graphics.draw(player.img, player.x, player.y)

    for i, bullet in ipairs(bullets) do
        love.graphics.draw(bullet.img, bullet.x, bullet.y)
    end
end
