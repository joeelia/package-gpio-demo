gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

local font = resource.load_font "font.ttf"
local count = 0

util.data_mapper{
    counter = function(counter)
        count = counter
    end,
}

function node.render()
    gl.clear(0,0,0,1)
    font:write(30, 10, "Motion Detected", 100, .5,.5,.5,1)
    countStr = tostring(count)
    font:write(250, 300, countStr, 64, 1,1,1,1) -- use the CONFIG value
end
