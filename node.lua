gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

util.no_globals()

local font = resource.load_font "font.ttf"
local on = false
local counter = "hello"

util.data_mapper{
    state = function(state)
        counter = "hi"
    end,
}

function node.render()
    gl.clear(0,0,0,1)
    font:write(250, 300, counter, 64, 1,1,1,1) -- use the CONFIG value
end
