--// ReplicatedStorage.new.modules.Ailments.AilmentsClientService (ModuleScript)

require(script.Parent.AilmentTypes)
local v_u_1 = require(script.Parent.AilmentsClient)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v3 = require(script.Parent.Parent.LegacyLoad)
local v_u_4 = v3("ClientData")
local v_u_5 = v3("EquippedPets")
local v_u_6 = v3("FamilyHelper")
local v_u_7 = v3("FriendsClient")
local v_u_8 = v3("RouterClient")
local v_u_9 = v3("SettingsHelper")
local v_u_10 = v3("SharedConstants")
return {
    ["start"] = function()
        v_u_4.register_callback("ailments_manager", function(p11)
            if v_u_1.is_relevant_to_local_ailments(p11) then
                v_u_1.on_ailments_changed(p11)
            end
        end)
        v_u_4.register_callback("family_list", function(p12, p13, p14)
            if p12 == game.Players.LocalPlayer then
                for _, v15 in v_u_2.List.differenceSymmetric(p13 or {}, p14 or {}) do
                    if v15 ~= game.Players.LocalPlayer then
                        v_u_1.on_ailments_changed(v15)
                    end
                end
            end
        end)
        v_u_7.get_friend_changed_signal():Connect(function(p16, _)
            if v_u_6.are_friends_family(p16, game.Players.LocalPlayer) then
                v_u_1.on_ailments_changed(p16)
            end
        end)
        v_u_4.register_callback("replicated_settings_2021", function(p17, p18)
            if p18 and p18.friends_are_family ~= nil then
                if p17 == game.Players.LocalPlayer then
                    for _, v19 in v_u_7.get_friends():expect().server do
                        v_u_1.on_ailments_changed(v19)
                    end
                elseif v_u_7.promise_get_is_friends_with(p17.UserId):expect() then
                    v_u_1.on_ailments_changed(p17)
                end
            else
                return
            end
        end)
        v_u_9.promise_setting_changed_signal("disable_ailments"):andThen(function(p20)
            p20:Connect(v_u_1.on_ailments_hidden_changed)
            v_u_1.on_ailments_hidden_changed(v_u_9.get_setting_client({
                ["setting_id"] = "disable_ailments"
            }))
        end)
        v_u_8.get("AilmentsAPI/PetAilmentCompleted").OnClientEvent:Connect(function(p21, p22, p23)
            v_u_1.on_pet_ailment_completed(p21, p22, p23)
        end)
        v_u_8.get("AilmentsAPI/BabyAilmentCompleted").OnClientEvent:Connect(function(p24, p25, p26)
            v_u_1.on_baby_ailment_completed(p24, p25, p26)
        end)
        for _, v27 in game.Players:GetPlayers() do
            if v_u_1.is_relevant_to_local_ailments(v27) then
                v_u_1.on_ailments_changed(v27)
            end
        end
        v_u_4.register_callback_plus_existing("ailments_manager_raw", function(p28, p29)
            if p29 then
                if p28 == game.Players.LocalPlayer then
                    local v30 = v_u_5.get_my_equipped_char_wrappers()[1]
                    if v30 then
                        local v31 = v30.pet_unique
                        local v32 = p29.ailments[v31] or {}
                        local v_u_33 = p29.quest_ailments or {}
                        local v34 = v_u_2.Dictionary.join(v32, v_u_33)
                        local v35 = v_u_2.Dictionary.count(v34)
                        if v_u_10.max_concurrent_ailments < v35 then
                            local v36 = v_u_2.Dictionary.values(v34)
                            table.sort(v36, function(p37, p38)
                                local v39 = v_u_33[p37.kind] ~= nil
                                if v39 == (v_u_33[p38.kind] ~= nil) then
                                    if p37.created_timestamp == p38.created_timestamp then
                                        return p37.sort_order > p38.sort_order
                                    else
                                        return p37.created_timestamp > p38.created_timestamp
                                    end
                                else
                                    return not v39
                                end
                            end)
                            local v40 = {}
                            for v41 = 1, v35 - v_u_10.max_concurrent_ailments do
                                v40[v36[v41].kind] = v_u_2.None
                            end
                            v34 = v_u_2.Dictionary.join(v34, v40)
                        end
                        for v42, v43 in v34 do
                            if v32[v42] then
                                v43.sort_order = v32[v42].sort_order
                                v43.created_timestamp = v32[v42].created_timestamp
                            end
                        end
                        if next(v34) then
                            p29.ailments[v31] = v34
                        end
                        v_u_4.update_server(p28, "ailments_manager", p29)
                    else
                        v_u_4.update_server(p28, "ailments_manager", p29)
                    end
                else
                    v_u_4.update_server(p28, "ailments_manager", p29)
                    return
                end
            else
                v_u_4.update_server(p28, "ailments_manager", nil)
                return
            end
        end)
    end
}