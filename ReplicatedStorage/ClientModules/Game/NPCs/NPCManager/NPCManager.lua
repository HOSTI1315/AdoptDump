--// ReplicatedStorage.ClientModules.Game.NPCs.NPCManager (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("NonFurnitureNPC")
local v3 = v1("Signal")
local v_u_4 = v1("package:Promise")
local v_u_9 = {
    ["focus_changed"] = v3.new(),
    ["create"] = function(...)
        return v_u_2.new(...)
    end,
    ["take_focus"] = function(p5, p6, p7)
        if not v_u_9.is_focused() then
            local v8 = p5:take_focus(p6)
            v_u_9.focus_changed:Fire()
            v_u_4.try(p7):catch(warn):await()
            v8()
            v_u_9.focus_changed:Fire()
        end
    end,
    ["is_focused"] = function()
        return v_u_2.get_focused_npc() ~= nil
    end
}
return v_u_9