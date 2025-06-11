--// ReplicatedStorage.new.modules.SpawnSequenceClient.SpawnSequenceDB.StudioSpawnSequence (ModuleScript)

local v1 = require(script.Parent.Parent.BaseSpawnSequence)
local v_u_2 = require(script.Parent.Parent.SpawnSequenceHelper)
local v_u_3 = require(script.Parent.Parent.Parent.LegacyLoad)("Flags")
local v_u_4 = game:GetService("RunService")
local v5 = {}
v5.__index = v5
setmetatable(v5, v1)
v5.priority = 100
function v5.is_valid()
    local v6 = v_u_4:IsStudio()
    if v6 then
        v6 = v_u_3.studio_override_spawn_sequence
    end
    return v6
end
function v5.run(p7)
    v_u_2.preload_house()
    v_u_2.exit_loading_screen(p7, function()
        v_u_2.enter_house()
    end)
    v_u_2.connect_apps()
    v_u_2.enable_house_exit()
    v_u_2.show_minigame_popups()
    task.wait(0.5)
    v_u_2.finish_sequence()
end
return v5