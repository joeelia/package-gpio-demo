gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

local json = require "json"
local clients = {}

-- If a new TCP client connects, see if it tries to connect to the
-- "proof-of-play" path and if so, same a reference to it in the 
-- clients table.
node.event("connect", function(client, path)
    if path == "proof-of-play" then
        clients[client] = true
    end
end)

-- Client disconnected? Then remove our reference
node.event("disconnect", function(client)
   clients[client] = nil
end)

-- This is the function used above which sends events to a locally
-- running progam on your Pi.
local function save_proof_of_play(event)
    -- encode event to JSON
    local data = json.encode(event)
    
    -- send it to all connected clients
    for client, _ in pairs(clients) do
        node.client_write(client, data)
    end
end
