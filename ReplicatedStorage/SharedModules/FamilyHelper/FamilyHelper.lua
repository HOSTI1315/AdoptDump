--// ReplicatedStorage.SharedModules.FamilyHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("SettingsHelper")
local v_u_3 = v_u_1("package:Sift")
local v_u_4 = game:GetService("Players")
local v_u_5 = game:GetService("RunService")
local v_u_47 = {
    ["on_friends_no_longer_behave_as_family"] = function(p6)
        local v7 = v_u_1("CharacterWrapper")
        local v8 = v_u_1("StateManager")
        local v9 = v_u_1("DataM")
        local v10 = v_u_47.get_non_family_friends_set(p6)
        local v11 = v8.get(p6.Character)
        if v11 then
            local v12 = v11:get_chars_connected_to_me()
            local v13 = { (v11:get_connected_to_char()) }
            for _, v14 in v_u_3.List.concat(v12, v13) do
                if v10[v7.get(v14).player] then
                    v11:exit_states({ "ParentHold", "BabyConnection" })
                    break
                end
            end
        end
        local v15 = v9.get_store(p6)
        if v15 then
            v15 = v15:get("house_manager")
        end
        if v15 then
            v15:force_players_out_if_locked(v10)
        end
    end,
    ["get_non_family_friends_set"] = function(p16)
        local v17 = v_u_5:IsServer()
        assert(v17, "This API can only be called on the server.")
        local v18 = {}
        for _, v19 in v_u_4:GetPlayers() do
            if v_u_47.are_family_because_friends(p16, v19, true) and not v_u_47.are_family(p16, v19) then
                v18[v19] = true
            end
        end
        return v18
    end,
    ["get_family"] = function(p20)
        local v21 = v_u_5:IsServer()
        assert(v21, "This API can only be called on the server.")
        return v_u_1("DataM").get(p20, "family_list")
    end,
    ["are_family"] = function(p22, p23)
        local v24 = v_u_5:IsServer()
        assert(v24, "This API can only be called on the server.")
        local v25 = v_u_1("DataM")
        local v26 = v25.get(p22, "family_list") or {}
        if table.find(v26, p23) == nil then
            return false
        end
        local v27 = v25.get(p23, "family_list") or {}
        return table.find(v27, p22) ~= nil
    end,
    ["are_friends_or_family"] = function(p28, p29)
        local v30 = v_u_5:IsServer()
        assert(v30, "This API can only be called on the server.")
        return v_u_47.are_family_because_friends(p28, p29) or v_u_47.are_family(p28, p29)
    end,
    ["are_friends_family"] = function(p31, p32)
        if not v_u_5:IsServer() then
            return v_u_2.get_setting_server({
                ["player"] = p31,
                ["setting_id"] = "friends_are_family"
            }) and v_u_2.get_setting_server({
                ["player"] = p32,
                ["setting_id"] = "friends_are_family"
            })
        end
        local v33, v34 = v_u_2.get_setting_server({
            ["player"] = p31,
            ["setting_id"] = "friends_are_family"
        })
        if not (v33 and v34) then
            return false
        end
        local v35, v36 = v_u_2.get_setting_server({
            ["player"] = p32,
            ["setting_id"] = "friends_are_family"
        })
        return v35 and v36
    end,
    ["are_family_because_friends"] = function(p37, p38, p39)
        if p39 or v_u_47.are_friends_family(p37, p38) then
            if v_u_5:IsServer() then
                return v_u_1("FriendsServer").promise_get_is_friends_with(p37, p38.UserId):expect()
            else
                return v_u_1("FriendsClient").promise_get_is_friends_with(p38.UserId):expect()
            end
        else
            return false
        end
    end,
    ["is_my_family"] = function(p40)
        local v41 = v_u_5:IsClient()
        assert(v41, "This API can only be called on the client.")
        if p40 == game.Players.LocalPlayer then
            return true
        end
        local v42 = v_u_1("ClientData").get("family_list") or {}
        return table.find(v42, p40) ~= nil
    end,
    ["is_my_family_because_friend"] = function(p43)
        local v44 = v_u_5:IsClient()
        assert(v44, "This API can only be called on the client.")
        return p43 == game.Players.LocalPlayer and true or v_u_47.are_family_because_friends(v_u_4.LocalPlayer, p43)
    end,
    ["is_my_friend_or_family"] = function(p45)
        local v46 = v_u_5:IsClient()
        assert(v46, "This API can only be called on the client.")
        return v_u_47.is_my_family_because_friend(p45) or v_u_47.is_my_family(p45)
    end
}
return v_u_47