--// ReplicatedStorage.ClientDB.PotionEffects.PotionEffectsDBHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("MinigameForcedState")
local v_u_3 = v1("InventoryDB")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("ObbyM")
return {
    ["can_use_potions"] = function()
        local v6 = v_u_2.can_use_potions()
        if v6 then
            v6 = not v_u_5.is_in_obby()
        end
        return v6
    end,
    ["create_post_consume_hint"] = function(p_u_7, p_u_8)
        return function()
            local v9 = v_u_3.food[p_u_7].name
            local v10 = p_u_8 or "Drink more %ss for a stronger effect!"
            v_u_4.apps.HintApp:hint({
                ["text"] = v10:format(v9),
                ["length"] = 9,
                ["yields"] = false
            })
        end
    end,
    ["create_validation_failed_dialog"] = function(p_u_11, p_u_12)
        return function()
            local v13 = v_u_3.food[p_u_11].name
            local v14 = p_u_12 or "Drinking another %s is too dangerous!"
            v_u_4.apps.DialogApp:dialog({
                ["text"] = v14:format(v13),
                ["button"] = "Okay"
            })
        end
    end
}