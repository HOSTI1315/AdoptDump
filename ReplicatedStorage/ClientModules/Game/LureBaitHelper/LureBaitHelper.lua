--// ReplicatedStorage.ClientModules.Game.LureBaitHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Maid")
local v_u_3 = v_u_1("ClientData")
local v_u_4 = v_u_1("FurnitureUseDB")
local v_u_5 = v_u_1("new:TutorialHelper")
local v_u_6 = v_u_1("FurnitureModelTracker")
local v_u_7 = v_u_1("package:Promise")
local v_u_8 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer)
local v_u_9 = v2.new()
local v_u_10 = nil
local v11 = {}
local function v_u_14()
    local v_u_12 = v_u_1("UIManager")
    if v_u_10 then
        return v_u_10
    end
    local v13 = {
        ["priority"] = 2,
        ["text"] = "Hide Lure Help",
        ["mouse_button1_click"] = function()
            v_u_9:DoCleaning()
        end
    }
    v_u_10 = v_u_12.apps.ExtraButtonsApp:register_button(v13)
    v_u_9:GiveTask(function()
        v_u_12.apps.ExtraButtonsApp:unregister_button(v_u_10)
        v_u_10 = nil
    end)
    v_u_10:show()
    return v_u_10
end
local function v_u_20()
    local v15 = v_u_1("InteriorsM").get_current_location()
    if v15 then
        if v15.destination_id == "housing" then
            v15 = v15.house_owner == game.Players.LocalPlayer
        else
            v15 = false
        end
    end
    if not v15 then
        return nil
    end
    local v16 = v_u_3.get("house_interior")
    for v17, v18 in v16 and v16.furniture or {} do
        local v19 = v_u_4[v18.id]
        if v19 and v19.use_function_name == "LURE" then
            return v17
        end
    end
    return nil
end
local function v_u_22()
    local v21 = v_u_1("InteriorsM").get_current_location()
    if v21 then
        if v21.destination_id == "housing" then
            v21 = v21.house_owner == game.Players.LocalPlayer
        else
            v21 = false
        end
    end
    return v21 and true or v_u_1("UIManager").apps.GuideArrowApp:navigate({
        ["destination_id"] = "housing",
        ["destination_house_owner"] = game.Players.LocalPlayer
    })
end
local function v_u_24()
    return v_u_1("UIManager").apps.GuideArrowApp:navigate({
        ["destination_id"] = "housing",
        ["destination_house_owner"] = game.Players.LocalPlayer
    }, function()
        local v23 = v_u_20()
        if v23 then
            v23 = v_u_6.get_furniture_by_unique(v23)
        end
        if v23 then
            v23 = v23:GetPivot().Position
        end
        return v23
    end)
end
local function v_u_29()
    local v25 = v_u_1("InteriorsM").get_current_location()
    if v25 then
        if v25.destination_id == "housing" then
            v25 = v25.house_owner == game.Players.LocalPlayer
        else
            v25 = false
        end
    end
    if not v25 then
        return false
    end
    local v26 = v_u_3.get("house_interior")
    for _, v27 in v26 and v26.furniture or {} do
        local v28 = v_u_4[v27.id]
        if v28 and (v28.use_function_name == "LURE" and v27.lure) then
            return true
        end
    end
    return false
end
local function v_u_32(p30, ...)
    if p30 ~= nil then
        for _, v31 in { ... } do
            p30 = p30:FindFirstChild(v31)
            if not (p30 and p30.Visible) then
                return
            end
        end
        return p30
    end
end
local function v_u_38(p33, p34)
    if p33 and p34 then
        for _, v35 in p33:GetChildren() do
            local v36 = v35:FindFirstChild("entry_id")
            if v36 and v36.Value == p34 then
                return v35
            end
            local v37 = v35:FindFirstChild("item_name")
            if v37 and v37.Text == v_u_8:Translate(workspace, p34) then
                return v35
            end
        end
        return nil
    end
end
function v11.run_tutorial()
    local v_u_39 = v_u_1("UIManager")
    v_u_9:DoCleaning()
    local v40 = v_u_1("InteriorsM").get_current_location()
    local v41 = v40
    if v41 then
        if v40.destination_id == "housing" then
            v41 = v40.house_owner == game.Players.LocalPlayer
        else
            v41 = false
        end
    end
    if not v41 then
        v_u_39.set_app_visibility("QuestApp", false)
        v_u_39.apps.DialogApp:dialog({
            ["text"] = "You must be in your house to place a lure.",
            ["button"] = "Next"
        })
        if v_u_39.apps.DialogApp:dialog({
            ["text"] = "Would you like to navigate to your house?",
            ["left"] = "No",
            ["right"] = "Yes"
        }) ~= "Yes" then
            return
        end
        if not v_u_22() then
            return
        end
        task.wait(0.2)
    end
    v_u_9:GiveTask(v_u_1("InteriorsM").on_location_changing:Connect(function()
        v_u_9:DoCleaning()
    end))
    if not v_u_20() then
        v_u_39.set_app_visibility("QuestApp", false)
        v_u_39.apps.DialogApp:dialog({
            ["text"] = "Time to buy a lure!",
            ["button"] = "Okay"
        })
        if v_u_39.apps.DialogApp:dialog({
            ["text"] = "Would you like to place a lure now?",
            ["left"] = "No",
            ["right"] = "Yes"
        }) ~= "Yes" or not v_u_22() then
            return
        end
        v_u_14()
        local v52 = v_u_5.highlight(function()
            local v42 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("HouseEditorApp")
            local v43 = v_u_32(v42, "base_frame", "furniture_top_nav", "Edit")
            if v43 then
                return v43, Vector2.yAxis
            else
                local v44 = v_u_32(v42, "base_frame", "non_top_nav_contents", "sliding_tween", "drawer")
                if v44 then
                    if v44.Parent.Position == UDim2.new(0, 0, 0, 0) then
                        local v45 = v_u_32(v44, "item_slider", "container", "item_slider_contents")
                        local v46 = nil
                        for _, v47 in { "lures_2023_normal_lure", "Lures", "Recommended" } do
                            v46 = v_u_38(v45, v47)
                            if v46 then
                                break
                            end
                        end
                        if v46 then
                            local v48 = v45.Parent
                            local v49 = v48.AbsolutePosition.X
                            local v50 = v48.AbsolutePosition.X + v48.AbsoluteSize.X
                            local v51 = v46.AbsolutePosition.X
                            if v51 < v49 then
                                v46 = v_u_32(v48.Parent, "left")
                            elseif v50 < v51 then
                                v46 = v_u_32(v48.Parent, "right")
                            end
                        else
                            v46 = v_u_32(v44, "back")
                        end
                        if v46 then
                            return v46, -Vector2.yAxis
                        else
                            return nil
                        end
                    else
                        return nil
                    end
                else
                    return v_u_32(v42, "base_frame", "furniture_top_nav", "Stuff"), Vector2.yAxis
                end
            end
        end, 0.4)
        local v_u_54 = v_u_7.fromEvent(v_u_3.DataChangedEvent, function(p53)
            if p53 == "house_interior" then
                return v_u_20() ~= nil
            else
                return false
            end
        end)
        v_u_9:GiveTask(function()
            v_u_54:cancel()
        end)
        local v55 = v_u_54:await()
        v52()
        if not v55 then
            return
        end
        task.wait(0.2)
    end
    if v_u_24() then
        if not v_u_29() then
            v_u_39.set_app_visibility("QuestApp", false)
            v_u_39.apps.DialogApp:dialog({
                ["text"] = "It\'s time to bait your lure!",
                ["button"] = "Okay"
            })
            if v_u_39.apps.DialogApp:dialog({
                ["text"] = "Would you like to bait your lure now?",
                ["left"] = "No",
                ["right"] = "Yes"
            }) ~= "Yes" or not v_u_22() then
                return
            end
            v_u_14()
            v_u_39.apps.HouseEditorWrapperApp:exit_edit_mode()
            local v_u_56 = nil
            local v59 = v_u_5.highlight(function()
                if not (v_u_56 and v_u_56.Parent) then
                    local v57 = v_u_20()
                    if v57 then
                        v57 = v_u_6.get_furniture_by_unique(v57)
                    end
                    v_u_56 = v57
                end
                if v_u_56 then
                    for _, v58 in v_u_39.apps.InteractionsApp.interactions:tolist() do
                        if v58.visible and v58.gui.adornee:IsDescendantOf(v_u_56) then
                            return v58.gui.instance.TapButton, -Vector2.yAxis
                        end
                    end
                end
                return nil
            end, 0.75)
            local v_u_61 = v_u_7.fromEvent(v_u_3.DataChangedEvent, function(p60)
                if p60 == "house_interior" then
                    return v_u_29()
                else
                    return false
                end
            end)
            v_u_9:GiveTask(function()
                v_u_61:cancel()
            end)
            local v62 = v_u_61:await()
            v59()
            if not v62 then
                return
            end
        end
        v_u_9:DoCleaning()
    end
end
return v11