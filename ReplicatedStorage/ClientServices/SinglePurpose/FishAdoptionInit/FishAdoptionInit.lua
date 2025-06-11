--// ReplicatedStorage.ClientServices.SinglePurpose.FishAdoptionInit (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("UIManager")
return {
    ["init"] = function()
        task.spawn(function()
            for _, v4 in v_u_2.get("inventory").food do
                if v4.kind == "beach_2024_mahi_spinning_rod_temporary" then
                    v_u_3.apps.BackpackApp:set_item_unique_hidden(v4.unique, "fish_adoption")
                    return
                end
            end
        end)
    end
}