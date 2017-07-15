ingame = {}

local lg = love.graphics
INGAME_ACTIVE, INGAME_FADE_IN, INGAME_NEXTLEVEL_OUT, INGAME_FALL_OUT, INGAME_PRESCREEN,
INGAME_GAMEOVER_OUT, INGAME_GAMEOVER, INGAME_WON, INGAME_COUNTDOWN, INGAME_COUNTDOWN_IN = 0,1,2,3,4,5,6,7,8,9

COMBO_TIME = 4

function ingame.enter()
	state = STATE_INGAME
	translate_x, translate_y = 0,0
	ingame.newGame()
end

function ingame.newGame()
	transition_time = 0
	warning_frame = 0
	time = 0
	local startx, starty = 100, 100;
	player = Player.create(startx,starty,level)
end

function ingame.update(dt)

	updateKeys()

	if love.keyboard.isDown('escape') then
		love.event.push('quit')
	end

	-- INGAME STATE
	--if ingame_state == INGAME_ACTIVE then
		time = time + dt

		-- Update entities
		player:update(dt)
	--end
end

function ingame.draw()

	-- Draw player
	player:draw()

	if player.state == PS_DEAD then
		player:draw()
	end
end


--- Updates keystates of ingame keys.
--  Should only be called when ingame, as it
--  makes call to Player
function updateKeys()
	-- Check keyboard keys
	for action, key in pairs(config.keys) do
		if love.keyboard.isDown(key) then
			keystate[action] = true
		else
			keystate[action] = false
		end
	end
end

function ingame.keypressed(k,uni)

	if k == "escape" then
		ingame_menu.enter()
	else
		for a, key in pairs(config.keys) do
			if k == key then

				print(a)

				player:action(a)
			end
		end
	end
end

