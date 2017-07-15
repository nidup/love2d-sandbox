default_config = {
    scale = 3,
    keys = {
        up = "up", down = "down", left = "left", right = "right", jump = "s", shoot = "d", action = "a"
    },
    joykeys = {
        jump = 1, shoot = 3, action = 2, pause = 8
    }
}

keynames = {"up", "down", "left", "right", "jump", "shoot", "action"}

keystate = {
    up = false, down = false, left = false, right = false,
    jump = false, shoot = false, action = false
}

stats = { 0, 0, 0, 0, 0, 0 }

function loadConfig()
    -- Read default settings first
    config = {}
    for i,v in pairs(default_config) do
        if type(v) == "table" then
            config[i] = {}
            for j,w in pairs(v) do
                config[i][j] = w
            end
        else
            config[i] = v
        end
    end
end

function defaultKeys()
    for i,v in pairs(default_config.keys) do
        config.keys[i] = v
    end
end
