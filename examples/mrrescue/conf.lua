function love.conf(t)
    t.identity = "mrrescue"
    t.version = "0.10.0"
    t.console = false
    t.accelerometerjoystick = true
    t.gammacorrect = false
 
    t.window.title = "Mr. Rescue"
    t.window.icon = nil
    t.window.width = 256*3
    t.window.height = 200*3
    t.window.borderless = false
    t.window.resizable = false
    t.window.minwidth = 1
    t.window.minheight = 1
    t.window.fullscreen = false
    t.window.fullscreentype = "desktop"
    t.window.vsync = true
    t.window.msaa = 0
    t.window.display = 1
    t.window.highdpi = false
    t.window.x = nil
    t.window.y = nil
 
    t.modules.audio = true
    t.modules.event = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.joystick = true
    t.modules.keyboard = true
    t.modules.math = true
    t.modules.sound = true
    t.modules.system = true
    t.modules.timer = true
    t.modules.window = true
    t.modules.thread = true

    t.modules.mouse = false
    t.modules.physics = false
    t.modules.touch = false
    t.modules.video = false
end
