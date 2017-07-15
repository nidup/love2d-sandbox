local lg = love.graphics

img = {}  	-- global Image objects
quad = {}	-- global Quads
font = {}   -- global Fonts
local snd = {}	-- sound Sources

local IMAGE_FILES = {
	"player_gun", "player_throw", "player_climb_down",
	"player_climb_up", "player_running", "player_death",
}

local BACKGROUND_FILES = {}

local SOUND_FILES = {}

--- Returns size of an Image as two return values
-- Saves some typing when creating quads
function getSize(img)
	return img:getWidth(), img:getHeight()
end

--- Load all resources including images, quads sound effects etc.
function loadResources()

	-- Load all images
	for i,v in ipairs(IMAGE_FILES) do
		img[v] = lg.newImage("data/"..v..".png")
	end
	for i,v in ipairs(BACKGROUND_FILES) do
		img[v] = lg.newImage("data/backgrounds/"..v..".png")
	end
	-- Load all sound files
	for i,v in ipairs(SOUND_FILES) do
		snd[v] = love.audio.newSource("data/sfx/"..v..".wav","static")
		snd[v]:addTags("sfx")
	end

	img.human_run = { img.human_1_run, img.human_2_run, img.human_3_run, img.human_4_run }
	img.human_carry_left = { img.human_1_carry_left, img.human_2_carry_left, img.human_3_carry_left, img.human_4_carry_left }
	img.human_carry_right = { img.human_1_carry_right, img.human_2_carry_right, img.human_3_carry_right, img.human_4_carry_right }
	img.human_fly = { img.human_1_fly, img.human_2_fly, img.human_3_fly, img.human_4_fly }
	img.human_burn = { img.human_1_burn, img.human_2_burn, img.human_3_burn, img.human_4_burn }
	img.human_panic = { img.human_1_panic, img.human_2_panic, img.human_3_panic, img.human_4_panic }

	-- Create quads
	quad.player_gun = {}
	for i=0,4 do
		quad.player_gun[i] = lg.newQuad(i*12,0,12,18, getSize(img.player_gun))
	end
end
