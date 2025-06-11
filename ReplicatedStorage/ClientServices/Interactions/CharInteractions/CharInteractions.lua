--// ReplicatedStorage.ClientServices.Interactions.CharInteractions (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("CharacterHider")
local v_u_3 = v_u_1("ClickTapInWorldExclusionList")
local v_u_4 = v_u_1("ClientData")
local v_u_5 = v_u_1("InteractionsEngine")
local v_u_6 = v_u_1("InventoryDB")
local v7 = v_u_1("Maid")
local v_u_8 = v_u_1("PetActions")
local v_u_9 = v_u_1("new:PetRigs")
local v_u_10 = v_u_1("PlatformM")
local v_u_11 = v_u_1("Raycast")
local v12 = v_u_1("Set")
local v_u_13 = v_u_1("SettingsHelper")
local v_u_14 = v_u_1("new:TutorialHelper")
local v_u_15 = v_u_1("UIManager")
local v_u_16 = require(script.PetCharInteractions)
local v_u_17 = require(script.PlayerCharInteractions)
local v_u_18 = v_u_10.get_platform()
local v_u_19 = {}
local v_u_20 = false
local v_u_21 = v12.new()
local v_u_22 = v12.new()
local v_u_23 = v7.new()
local function v_u_26(p24)
    if v_u_20 ~= p24 then
        v_u_20 = p24
        for v25, _ in pairs(v_u_21) do
            if v25.part and (v25.part.Parent and v25.part.Parent ~= game.Players.LocalPlayer.Character) then
                v25:set_hidden(p24)
            end
        end
    end
end
local function v_u_30(p27, p28, p29)
    if p29 then
        return v_u_16.build_on_selected_callback(p27, p28)
    else
        return v_u_17.build_on_selected_callback(p27, p28)
    end
end
local function v_u_52(p_u_31, p32, p_u_33)
    if p32 then
        local v_u_34 = p32.char
        local v_u_35 = p32.player
        local v36 = nil
        if p_u_33 then
            if p32 then
                local v37 = v_u_6.pets[p32.pet_id]
                if v37 and v37.interaction_part_name then
                    local v38 = v_u_34:WaitForChild("PetModel")
                    v36 = v_u_9.get(v38).get_part(v38, v37.interaction_part_name, true)
                end
            end
            if not v36 then
                local v39 = v_u_34:WaitForChild("PetModel")
                v36 = v_u_9.get(v39).get_part(v39, "Torso", true)
            end
        else
            v36 = v_u_34:WaitForChild("HumanoidRootPart")
        end
        v_u_22:add(v_u_34)
        local v40 = nil
        local v41 = nil
        if v_u_34 == game.Players.LocalPlayer.Character then
            v40 = v_u_4.get("team") == "Parents" and Vector3.new(0, 1.5, 0) or Vector3.new(0, 0.75, 0)
        elseif p_u_33 then
            v41 = Vector3.new()
            v40 = Vector3.new(0, -1.25, 0)
        end
        local v42 = nil
        if p_u_33 then
            v42 = (not v_u_14.is_new_tutorial_running() or v_u_14.flags.get("hide_pet_prompt_when_moving")) and 5 or v42
        end
        local v43 = v_u_5
        local v44 = {}
        local v45
        if p_u_33 then
            v45 = v_u_16.build_interaction_text_callback(p_u_31, v_u_34)
        else
            v45 = v_u_17.build_interaction_text_callback(p_u_31, v_u_34)
        end
        v44.text = v45
        v44.part = v36
        v44.hidden = v_u_20 or v_u_34.Name == game.Players.LocalPlayer.Name
        v44.offset = v40
        v44.custom_menu_wheel_offset = v41
        v44.max_speed = v42
        v44.tag = p_u_33 and "is_pet" or nil
        function v44.is_visible()
            if v_u_34:IsDescendantOf(workspace) then
                if v_u_4.get_server(v_u_35, "disable_interactions_with_me") and not p_u_33 then
                    return false
                elseif v_u_2.is_char_hidden(v_u_34) then
                    return false
                elseif p_u_33 then
                    if v_u_16.should_be_visible(v_u_34) then
                        return (v_u_16.is_relevant_pet(v_u_34) or v_u_10.is_using_gamepad()) and true or false
                    else
                        return false
                    end
                else
                    return v_u_17.should_be_visible(v_u_34)
                end
            else
                return false
            end
        end
        function v44.on_selected()
            if not p_u_33 then
                v_u_15.apps.PlayerNameApp:set_force_username(v_u_34, true)
            end
            local function v46()
                return {}
            end
            if v_u_4.get_server(v_u_35, "disable_interactions_with_me") and not p_u_33 then
                return v46
            else
                return v_u_30(p_u_31, v_u_34, p_u_33)
            end
        end
        function v44.on_finished()
            if not p_u_33 then
                v_u_15.apps.PlayerNameApp:set_force_username(v_u_34, false)
            end
        end
        v44.horizontal_dist = v_u_18 == v_u_10.platform.phone and 6 or 10
        local v_u_47 = v43:register(v44)
        if v_u_34 == game.Players.LocalPlayer.Character then
            v_u_4.update("click_my_character_interaction", v_u_47)
        end
        local function v48()
            v_u_47:destroy()
            v_u_21:remove(v_u_47)
            v_u_22:remove(v_u_34)
        end
        local v49 = v_u_23
        local v50 = p32.unique
        v49[tostring(v50)] = v48
        v36.AncestryChanged:connect(function(_, p51)
            if p51 == nil then
                v_u_47:destroy()
                v_u_21:remove(v_u_47)
                v_u_22:remove(v_u_34)
            end
        end)
        v_u_22:add(v_u_34)
        v_u_21:add(v_u_47)
    end
end
local function v_u_70(p53)
    local v54 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if v54 then
        v54 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    end
    if not v54 then
        return
    end
    if not v_u_1("MinigameForcedState").can_click_tap_owned_characters() then
        return "pass"
    end
    local v55 = game.Players.LocalPlayer.Character
    if v55 then
        v55 = v55:FindFirstChild("Head")
    end
    local v56
    if v55 then
        local v57 = workspace.CurrentCamera.CFrame.Position
        v56 = (v55.Position - v57).Magnitude < 1
    else
        v56 = false
    end
    if v56 or not v_u_5:is_enabled() then
        return "pass"
    end
    local v58 = {}
    for v59, _ in v_u_22 do
        local v60 = v59:FindFirstChild("HumanoidRootPart")
        if v60 and (v60.Position - v54).Magnitude < 30 then
            for _, v61 in v59:GetChildren() do
                if v61:IsA("BasePart") and v61.Transparency ~= 1 then
                    table.insert(v58, v61)
                end
            end
            if v59:FindFirstChild("PetModel") then
                local v62 = v59.PetModel:FindFirstChild("MockParts")
                if v62 then
                    for _, v63 in v62:GetChildren() do
                        table.insert(v58, v63)
                    end
                else
                    for _, v64 in v59.PetModel:GetChildren() do
                        if v64:IsA("BasePart") then
                            table.insert(v58, v64)
                        end
                    end
                end
            end
        end
    end
    local v65 = p53 or v_u_11.mousecast(nil, nil, nil, v58, {
        ["ignore_non_cancollide"] = false,
        ["ignore_transparent"] = false
    })
    if not v65 then
        return "pass"
    end
    while v65:FindFirstChild("Humanoid") == nil do
        v65 = v65.Parent
    end
    if v65:FindFirstChild("HumanoidRootPart") == nil then
        return
    end
    if v_u_8.must_set_down_pet(v65) then
        v_u_15.apps.HintApp:hint({
            ["text"] = "You have to set them down first!",
            ["length"] = 3,
            ["overridable"] = true,
            ["yields"] = false
        })
        return
    end
    local v66 = v65:FindFirstChild("PetModel")
    local v67
    if v66 then
        v67 = v_u_16.should_be_visible(v65)
    else
        v67 = v66
    end
    local v68
    if v66 then
        v68 = v_u_16.is_relevant_pet(v65)
    else
        v68 = v66
    end
    if v66 then
        if v67 then
            v67 = not v68
        end
    else
        v67 = v66
    end
    for v69, _ in v_u_21 do
        if (v69:is_visible() or v67) and (v69.part == v65.HumanoidRootPart or v65:FindFirstChild("PetModel") and v69.part:IsDescendantOf(v65.PetModel)) then
            if v65 ~= game.Players.LocalPlayer.Character then
                v_u_19.char_selected_without_guide_icon = true
            end
            if v_u_15.apps.InteractionsApp:call_on_selected(v69, v69.on_selected) == "no_choices" then
                return "pass"
            end
            break
        end
    end
    return "sink"
end
function v_u_19.update_hidden_interaction_setting(p71)
    v_u_26(p71)
end
function v_u_19.init()
    v_u_4.register_callback_plus_existing("char_wrapper", function(p72, p73, _)
        v_u_52(p72, p73, false)
    end)
    v_u_4.register_callback_plus_existing("pet_char_wrappers", function(p74, p75, _)
        if p75 then
            for _, v76 in p75 do
                v_u_52(p74, v76, true)
            end
        end
    end)
    v_u_3.register(20, v_u_70)
    local v77 = v_u_13.get_setting_server({
        ["setting_id"] = "char_icons"
    })
    v_u_19.update_hidden_interaction_setting(not v77)
end
return v_u_19