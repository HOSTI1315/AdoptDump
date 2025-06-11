--// ReplicatedStorage.ClientDB.ToolDBHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("package:Promise")
local v_u_3 = game:GetService("Players")
local v_u_4 = v_u_1("package:t")
local v_u_68 = {
    ["generic_client_use"] = function(p5, _, p6, _, _, p7, p8)
        local v9 = v_u_1("AnimationManager")
        local v10 = v_u_1("CaregiverAssistHelper")
        local v_u_11 = v_u_1("PetActions")
        if not (p5.anims and p5.anims.use) then
            return true
        end
        if not p6.tool then
            return false
        end
        if p5.category == "food" and not v_u_68.has_prompted_feed_choice[p6] then
            if p5.message then
                v_u_1("UIManager").apps.DialogApp:dialog({
                    ["text"] = p5.message,
                    ["button"] = "Okay"
                })
            end
            if #v10.get_choices({
                ["exclude_player"] = true,
                ["caregiver_assist"] = true,
                ["team_whitelist"] = { "Pets" }
            }) > 0 then
                local v12 = p5.cannot_feed_to_self and "Feed Pet" or v_u_68.get_interaction_result_while_tool_equipped({ "Feed Me", "Feed Pet", "Cancel" })
                if v12 == "Feed Pet" then
                    v_u_68.choose_pet_and_then(function(p13)
                        return v_u_11.feed_pet(p13)
                    end)
                    return false
                end
                if v12 == "Cancel" or v12 == nil then
                    return false
                end
                v_u_68.has_prompted_feed_choice[p6] = true
            elseif p5.cannot_feed_to_self then
                return false
            end
        end
        local v14 = v9.get_track(p5.anims.use)
        game:GetService("ContentProvider"):PreloadAsync({ v14 })
        local v15 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(v14)
        v15:Play(0.3)
        local v16
        if p5.sounds and p5.sounds.use then
            v16 = p6.tool.ModelHandle:FindFirstChild(p5.sounds.use, true)
            if v16 then
                v16:Play()
            else
                v_u_1("SoundPlayer").FX:play(p5.sounds.use, p6.tool.ModelHandle)
            end
        else
            v16 = nil
        end
        local v17 = v_u_2.race
        local v18 = {}
        local v19 = v_u_2.fromEvent(v15.Stopped):andThenReturn(true)
        local v20
        if p8 then
            v20 = v_u_2.fromEvent(p8):andThenReturn(false)
        else
            v20 = nil
        end
        local v21
        if p7 then
            v21 = v_u_2.fromEvent(p7):andThenReturn(false)
        else
            v21 = nil
        end
        __set_list(v18, 1, {v19, v20, v21})
        local v22 = v17(v18):expect()
        if v16 then
            v16:Stop()
        end
        v15:Stop(0.3)
        return v22
    end,
    ["generic_server_use_start"] = function(_, p23, _, p24)
        local v25 = v_u_1("EffectsToggleHelper")
        if (p23.tool_use_properties or {}).turn_on_visual_effects_when_used then
            for _, v26 in ipairs(p24) do
                v25.toggle_effects(v26:GetDescendants(), true)
            end
        end
    end,
    ["generic_server_use_end"] = function(p27, p28, _, p29)
        local v30 = v_u_1("EffectsToggleHelper")
        local v31 = v_u_1("MinigameServerManager")
        local v32 = p28.tool_use_properties or {}
        if p28.ailment_to_boost then
            local v33 = p28.uses
            assert(v33, "No uses specified for tool")
            local v34 = 1 / p28.uses
            local v35 = v_u_1("CharacterWrapper").get(p27.Character)
            if v35 then
                v_u_1("new:AilmentsServer").add_progress(v35, p28.ailment_to_boost, v34)
            end
        end
        if v32.turn_on_visual_effects_when_used then
            for _, v36 in ipairs(p29) do
                v30.toggle_effects(v36:GetDescendants(), false)
            end
        end
        if p28.temporary then
            v31.generic_item_use(p27, p28)
        end
    end,
    ["HEALTH_CHECK_VALIDATIONS"] = {
        ["has_mouth_attachment"] = function(_, p37)
            if p37:FindFirstChild("MouthAttachment", true) or p37:FindFirstChild("Mouth", true) then
                return true
            else
                return false, "No MouthAttachment found"
            end
        end
    },
    ["has_prompted_feed_choice"] = setmetatable({}, {
        ["__mode"] = "k"
    }),
    ["get_interaction_result_while_tool_equipped"] = function(p_u_38)
        local v_u_39 = v_u_3.LocalPlayer.Character
        if v_u_39 then
            v_u_39 = v_u_39:FindFirstChild("HumanoidRootPart")
        end
        if not v_u_39 then
            return nil
        end
        local v_u_40 = v_u_1("UIManager")
        local v_u_41 = v_u_1("InteractionsEngine")
        local v42 = v_u_1("ClientData")
        local v_u_43 = nil
        local v49 = { v_u_2.new(function(p_u_44)
                local v_u_45
                if v_u_4.table(p_u_38[1]) then
                    v_u_45 = p_u_38
                else
                    v_u_45 = {}
                    for v46, v_u_47 in ipairs(p_u_38) do
                        v_u_45[v46] = {
                            ["text"] = v_u_47,
                            ["on_selected"] = function()
                                p_u_44(v_u_47)
                            end
                        }
                    end
                end
                v_u_43 = v_u_41:register({
                    ["part"] = v_u_39,
                    ["text"] = "Use Food",
                    ["on_finished"] = function()
                        p_u_44(nil)
                    end,
                    ["on_selected"] = function()
                        return v_u_45
                    end
                })
                v_u_40.apps.InteractionsApp:call_on_selected(v_u_43)
            end), (v_u_2.fromEvent(v42.DataChangedEvent, function(p48)
                return p48 == "equip_manager"
            end):andThenReturn(nil)) }
        local v50 = v_u_2.race(v49):expect()
        v_u_43:destroy()
        return v50
    end,
    ["choose_pet_and_then"] = function(p_u_51)
        local v52 = v_u_1("CaregiverAssistHelper")
        local v_u_53 = v_u_1("CharWrapperClient")
        local v54 = v_u_1("UIManager")
        local v57 = v52.get_choices({
            ["exclude_player"] = true,
            ["caregiver_assist"] = true,
            ["team_whitelist"] = { "Pets" },
            ["get_on_selected_callback"] = function(p_u_55)
                return function()
                    local v56 = v_u_53.get(p_u_55)
                    if v56 then
                        p_u_51(v56)
                    end
                end
            end
        })
        local v58 = #v57
        if v58 == 0 then
            v54.apps.HintApp:hint({
                ["text"] = "There are no pets nearby who can use this!",
                ["overridable"] = true,
                ["length"] = 2.5,
                ["yields"] = false
            })
            return
        elseif v58 == 1 then
            v57[1].on_selected()
        else
            v_u_68.get_interaction_result_while_tool_equipped(v57)
        end
    end,
    ["confirm_use"] = function(p59, p60)
        local v61 = ("skip_use_confirmation_%*"):format(p59.kind)
        local v62 = v_u_1("ClientData")
        if v62.get(v61) or false then
            return true
        end
        local v63 = v_u_1("UIManager")
        local v64 = p60 or {}
        local v65 = v64.right or "Yes"
        local v66, v67 = v63.apps.DialogApp:dialog({
            ["dialog_type"] = "CheckboxDialog",
            ["checkbox_text"] = "Do not show again this session",
            ["text"] = v64.text or ("Are you sure you want to use %*?"):format(p59.name),
            ["left"] = v64.left or "No",
            ["right"] = v65
        })
        if v67 then
            v62.update(v61, true)
        end
        return v66 == v65
    end
}
return v_u_68