gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

util.no_globals()

local on = false

util.data_mapper{
    state = function(state)
        counter = counter
    end,
}

function node.render()
    font:write(250, 300, "Hello World", 64, 1,1,1,1)
end
