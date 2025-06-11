--// ReplicatedStorage.SharedModules.ServerType (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("SharedConstants")
local v3 = v_u_1("Flags")
local v_u_4 = game:GetService("RunService")
local v_u_5 = v3.force_production_behavior
local v_u_6 = v3.force_test_lab_behavior
local v_u_7 = game.GameId == v2.production_game_id
local v_u_8 = game.GameId == v2.staging_game_id
local v_u_9 = game.GameId == v2.test_lab_game_id
local v_u_10 = game.GameId == v2.demo_game_id
local v_u_11 = game.GameId == v2.roblox_staff_game_id
local v_u_12 = game.GameId == 6786925795
local v_u_18 = {
    ["is_vip_server"] = function()
        if not v_u_4:IsServer() then
            return v_u_1("ClientData").get("is_vip_server")
        end
        local v13 = v_u_1("DataM").get_global_store()
        local v14 = v13:get("is_vip_server")
        if v14 == nil then
            if game.PrivateServerId == "" then
                v14 = false
            else
                v14 = game.PrivateServerOwnerId ~= 0
            end
            v13:set("is_vip_server", v14)
        end
        return v14
    end,
    ["is_reserved_server"] = function()
        local v15 = v_u_4:IsServer()
        assert(v15, "server only")
        local v16
        if game.PrivateServerId == "" then
            v16 = false
        else
            v16 = game.PrivateServerOwnerId == 0
        end
        return v16
    end,
    ["use_production_behavior"] = function()
        return (v_u_7 or v_u_8) and true or (v_u_5 and true or false)
    end,
    ["is_production"] = function()
        return v_u_7
    end,
    ["is_test_lab"] = function()
        return v_u_9
    end,
    ["error_if_not_development_branch"] = function()
        return v_u_7 and true or false
    end,
    ["use_test_lab_behavior"] = function()
        if v_u_18.use_production_behavior() then
            return false
        else
            return (v_u_9 or v_u_6) and true or false
        end
    end,
    ["use_non_resettable_storage"] = function()
        return v_u_7
    end,
    ["current_place_is_demo_place"] = function()
        return v_u_10
    end,
    ["current_place_is_roblox_staff_place"] = function()
        return v_u_11
    end,
    ["current_place_is_rthro_enabled"] = function()
        return v_u_12
    end,
    ["allow_everyone_to_join"] = function()
        return v_u_7 or v_u_9
    end,
    ["use_released_translations_only"] = function()
        return v_u_7
    end,
    ["use_instant_file_lock_overrides"] = function()
        local v17 = not v_u_7
        if v17 then
            v17 = v_u_4:IsStudio()
        end
        return v17
    end
}
return v_u_18