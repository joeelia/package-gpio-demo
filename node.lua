gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

local font = resource.load_font "font.ttf"

util.data_mapper{
    local counter = function(counter)
    end,
}

function node.render()
    gl.clear(0,0,0,1)
    font:write(250, 300, tostring(counter), 64, 1,1,1,1) -- use the CONFIG value
end
