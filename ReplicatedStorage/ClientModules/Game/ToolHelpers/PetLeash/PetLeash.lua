--// ReplicatedStorage.ClientModules.Game.ToolHelpers.PetLeash (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("StateManagerClient")
local v_u_5 = v1("ToolDBHelper")
local v_u_6 = v1("UIManager")
return {
    ["use"] = function(_)
        local v7 = v_u_2.get("state_manager")
        if v7 then
            if v_u_4.has_state(v7, "ParentWalkingPet") then
                v_u_3.get("PetAPI/UnequipPetLeash"):FireServer()
            else
                v_u_5.choose_pet_and_then(function(p8)
                    local v9 = (v_u_2.get("equip_manager") or {}).toys[1]
                    local v10 = v_u_3.get("PetAPI/EquipPetLeash"):InvokeServer(v9.unique, p8.char)
                    if not v10 then
                        v_u_6.apps.HintApp:hint({
                            ["text"] = "You can\'t do that right now!",
                            ["overridable"] = true,
                            ["length"] = 2.5,
                            ["yields"] = false
                        })
                    end
                    return v10
                end)
            end
        else
            return
        end
    end,
    ["unequipped"] = function(_)
        v_u_3.get("PetAPI/UnequipPetLeash"):FireServer()
    end
}