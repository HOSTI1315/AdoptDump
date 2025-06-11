--// ReplicatedStorage.new.modules.SpawnSequenceClient.SpawnSequenceDB.AfkZoneSpawnSequence (ModuleScript)

local v1 = require(script.Parent.Parent.BaseSpawnSequence)
local v_u_2 = require(script.Parent.Parent.SpawnSequenceHelper)
local v3 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_4 = v3("InteriorsM")
local v_u_5 = v3("ThemedServersHelper")
local v6 = {}
v6.__index = v6
setmetatable(v6, v1)
v6.priority = 10
function v6.is_valid()
    return v_u_5.is_afk_place()
end
function v6.run(p7)
    v_u_2.exit_loading_screen(p7, function()
        v_u_2.enter_starting_interior(function()
            v_u_4.enter("AFKZone", "MainDoor")
        end)
    end)
    v_u_2.connect_apps()
    task.wait(0.5)
    v_u_2.finish_sequence()
end
return v6