gl.setup(10, 56)

local json = require "json"
local clients = { 
    asset_id = "55555", -- What are we playing
    duration = "15", -- .. for how long
    start = os.time(), -- unix timestamp of when playback started
    device = sys.getenv "SERIAL" -- the serial number of the device
}

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
