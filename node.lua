gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

local font = resource.load_font "font.ttf"
local count

util.data_mapper{
    counter = function(counter)
        counts = counter == '2'
    end,
}

function node.render()
    gl.clear(0,0,0,1)
    font:write(30, 10, "Bitcoin", 100, .5,.5,.5,1)
    font:write(250, 300, 'count', 64, 1,1,1,1) -- use the CONFIG value
    if counts then
        gl.clear(0, 1, 0, 1) -- green
    else
        gl.clear(1, 0, 0, 1) -- red
    end
end
