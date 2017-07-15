local lg = love.graphics

img = {}  	-- global Image objects
quad = {}	-- global Quads
font = {}   -- global Fonts
local snd = {}	-- sound Sources

local IMAGE_FILES = {

	"tiles", "door",

	"player_gun", "player_throw", "player_climb_down",
	"player_climb_up", "player_running", "player_death",

	"stream", "water", "shards",

}

local BACKGROUND_FILES = { "mountains", "night" }

local SOUND_FILES = {}

NUM_ROOMS = { [10] = 6, [11] = 6, [17] = 6, [24] = 6 }

--- Returns size of an Image as two return values
-- Saves some typing when creating quads
function getSize(img)
	return img:getWidth(), img:getHeight()
end

--- Load all resources including images, quads sound effects etc.
function loadResources()
	-- Create canvas for lighting effects
	canvas = lg.newCanvas(256,256)
	canvas:setFilter("nearest","nearest")

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

	-- Set special image attributes
	img.stream:setWrap("repeat", "clamp")

	-- Create quads
	quad.player_gun = {}
	for i=0,4 do
		quad.player_gun[i] = lg.newQuad(i*12,0,12,18, getSize(img.player_gun))
	end

	quad.door_normal  = lg.newQuad( 0,0, 8,48, getSize(img.door))
	quad.door_damaged = lg.newQuad(16,0, 8,48, getSize(img.door))

	quad.water_out = {}
	quad.water_out[0] = lg.newQuad(0,0, 8,15, getSize(img.water))
	quad.water_out[1] = lg.newQuad(16,0, 8,15, getSize(img.water))

	quad.water_end = {}
	quad.water_end[0] = lg.newQuad(32,0, 16,15, getSize(img.water))
	quad.water_end[1] = lg.newQuad(48,0, 16,15, getSize(img.water))

	quad.water_hit = {}
	for i=0,2 do
		quad.water_hit[i] = lg.newQuad(i*16, 16, 16, 19, getSize(img.water))
	end

	quad.shard = {}
	for i=0,7 do
		quad.shard[i] = lg.newQuad(i*8,0,8,8, getSize(img.shards))
	end

	quad.tile = {}
	local id = 1
	for iy = 0,15 do
		for ix = 0,15 do
			quad.tile[id] = lg.newQuad(ix*16, iy*16, 16, 16, getSize(img.tiles))
			id = id + 1
		end
	end

	quad.player_death_up   = lg.newQuad( 0, 0, 16, 24, getSize(img.player_death))
	quad.player_death_down = lg.newQuad(16, 0, 16, 24, getSize(img.player_death))
	quad.player_death_suit = lg.newQuad(32, 0, 16, 10, getSize(img.player_death))
end
