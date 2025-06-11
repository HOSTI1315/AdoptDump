--// ReplicatedStorage.ClientModules.Game.CaregiverAssistHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("CharWrapperClient")
local v_u_4 = v1("TableUtil")
local v_u_5 = v1("Set")
local v_u_6 = v1("StateManagerClient")
local v_u_7 = v1("FamilyHelper")
local v_u_8 = v1("EquippedPets")
local v_u_9 = v1("SharedConstants")
local v_u_40 = {
    ["get_choices"] = function(p10)
        local v11 = {}
        if not p10.max_choices then
            p10.max_choices = 6
        end
        if p10.force_player or not p10.exclude_player and (p10.team_whitelist == nil or v_u_4.is_member(p10.team_whitelist, v_u_2.get("team"))) then
            local v12 = game.Players.LocalPlayer.Character
            if not p10.override_char_wrapper or p10.override_char_wrapper.char == v12 then
                local v13 = {
                    ["text"] = "You",
                    ["character"] = v12,
                    ["passive"] = false
                }
                local v14 = p10.get_on_selected_callback
                if v14 then
                    v14 = p10.get_on_selected_callback(v12)
                end
                v13.on_selected = v14
                table.insert(v11, v13)
            end
        end
        if not p10.caregiver_assist then
            ::l13::
            if #v11 ~= 0 or not p10.team_whitelist then
                return v11, ""
            end
            local v15 = nil
            if #p10.team_whitelist == 1 then
                return v11, string.format("Only %s can use this.", p10.team_whitelist[1])
            end
            if #p10.team_whitelist == 2 then
                return v11, string.format("Only %s and %s can use this.", p10.team_whitelist[1], p10.team_whitelist[2])
            end
            if #p10.team_whitelist == 3 then
                return v11, string.format("Only %s, %s, and %s can use this.", p10.team_whitelist[1], p10.team_whitelist[2], p10.team_whitelist[3])
            end
            error("Team whitelist has more than 3 (or zero) teams. This shouldn\'t be possible")
            return v11, v15
        end
        local v16 = v_u_40.get_assistable_characters()
        for _, v17 in pairs(v16) do
            local v18 = v_u_6.get(v17)
            if v18 then
                local v19 = v_u_6.get_team(v18)
                if p10.team_whitelist ~= nil and not v_u_4.is_member(p10.team_whitelist, v19) then
                    goto l17
                end
                if not p10.override_char_wrapper or p10.override_char_wrapper.char == v17 then
                    if v_u_3.is_non_player(v17) then
                        local v20 = v_u_3.get(v17)
                        local v21 = v20 and v_u_8.get_name_from_wrapper(v20) or v17.Name
                        local v22 = v20.player
                        local v23
                        if v22 == game.Players.LocalPlayer then
                            v23 = nil
                        else
                            v23 = ("rbxthumb://type=AvatarHeadShot&id=%*&w=48&h=48"):format(v22.UserId)
                        end
                        local v24 = {
                            ["text"] = v21,
                            ["image"] = v23,
                            ["character"] = v17,
                            ["team"] = v19,
                            ["passive"] = false
                        }
                        local v25 = p10.get_on_selected_callback
                        if v25 then
                            v25 = p10.get_on_selected_callback(v17)
                        end
                        v24.on_selected = v25
                        table.insert(v11, v24)
                    elseif v19 == "Babies" then
                        local v26 = {
                            ["text"] = v17.Name,
                            ["character"] = v17,
                            ["team"] = v19,
                            ["passive"] = true
                        }
                        local v27 = p10.get_passive_on_selected_callback
                        if v27 then
                            v27 = p10.get_passive_on_selected_callback(v17)
                        end
                        v26.on_selected = v27
                        table.insert(v11, v26)
                    end
                    goto l17
                end
            else
                ::l17::
                if #v11 >= p10.max_choices then
                    break
                end
            end
        end
        goto l13
    end,
    ["get_assistable_characters"] = function()
        local v28 = v_u_5.new()
        local v29 = {}
        for _, v30 in pairs(v_u_6.get_chars_connected_to_me(v_u_2.get("state_manager"))) do
            table.insert(v29, v30)
            v28:add(v30)
        end
        local v_u_31 = v_u_2.get("char_wrapper")
        local v32 = v_u_2.get("team")
        local v33 = {}
        for _, v34 in pairs(v_u_3.get_all_char_wrappers()) do
            if v34.char ~= game.Players.LocalPlayer.Character and (v_u_3.is_in_same_location(v_u_31, v34) and (v34.char:FindFirstChild("HumanoidRootPart") and v_u_7.is_my_friend_or_family(v34.player))) then
                local v35 = v_u_3.get_team(v34.char)
                if v35 and (v35 ~= "Babies" or v32 ~= "Babies") then
                    table.insert(v33, v34)
                end
            end
        end
        table.sort(v33, function(p36, p37)
            return (v_u_31.char.HumanoidRootPart.Position - p36.char.HumanoidRootPart.Position).magnitude < (v_u_31.char.HumanoidRootPart.Position - p37.char.HumanoidRootPart.Position).magnitude
        end)
        for _, v38 in pairs(v33) do
            if (v_u_31.char.HumanoidRootPart.Position - v38.char.HumanoidRootPart.Position).magnitude > v_u_9.max_caregiver_assist_dist then
                break
            end
            if not v28:has(v38.char) then
                local v39 = v38.char
                table.insert(v29, v39)
                v28:add(v38.char)
            end
        end
        return v29
    end
}
return v_u_40