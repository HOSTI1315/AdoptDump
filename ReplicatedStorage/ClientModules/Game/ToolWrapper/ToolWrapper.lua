--// ReplicatedStorage.ClientModules.Game.ToolWrapper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("RouterClient")
local v_u_3 = v_u_1("InventoryDB")
local v_u_4 = v_u_1("ToolDB")
local v5 = v_u_1("Class")
local v_u_6 = v_u_1("AnimationManager")
local v_u_7 = v_u_1("ClientData")
local v_u_8 = v_u_1("ItemHider")
local v_u_9 = v_u_1("Debug")
local v_u_10 = v_u_1("ScriptUtil")
local v_u_11 = v_u_1("Signal")
local v_u_12 = v_u_1("package:Sift")
local v_u_13 = v_u_1("Debug").create_log()
local v_u_14 = { "Tele" }
local v15 = v5("ToolWrapper")
local function v_u_22(_, p_u_16)
    for _, v17 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if table.find(v_u_14, v17.Name) == nil and (v17:WaitForChild("unique", 10) and v17.unique.Value == p_u_16.unique) then
            return v17
        end
    end
    local v_u_18 = v_u_10.create_continue({
        ["timeout"] = 60
    })
    local v20 = game.Players.LocalPlayer.Backpack.ChildAdded:connect(function(p19)
        if table.find(v_u_14, p19.Name) == nil and p19:WaitForChild("unique").Value == p_u_16.unique then
            wait()
            v_u_18.continue(p19)
        end
    end)
    local v21 = v_u_18.yield()
    v20:Disconnect()
    return v21
end
function v15.__init(p_u_23, p_u_24, p25, p26)
    p_u_23.item_data = p_u_24
    p_u_23.tool_use_start_callback = p25
    p_u_23.tool_use_end_callback = p26
    p_u_23.entry = v_u_3[p_u_24.category][p_u_24.id]
    p_u_23.tool_entry = v_u_4[p_u_23.entry.tool] or {}
    p_u_23.unequipped_signal = v_u_11.new()
    if game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil then
        local v27 = nil
        local v_u_28
        if p_u_23.entry.category == "pets" then
            v_u_28 = nil
        elseif p_u_23.entry.anims and p_u_23.entry.anims.hold then
            v_u_28 = p_u_23.entry.anims.hold
        else
            v_u_28 = p_u_23.entry.category == "pet_accessories" and "SandwichHold" or v27
        end
        task.spawn(function()
            if v_u_28 and not p_u_23.destroyed then
                local v29 = v_u_6.get_track(v_u_28)
                local v30 = game.Players.LocalPlayer.Character.Humanoid:WaitForChild("Animator")
                if p_u_23.destroyed then
                    return
                end
                p_u_23.track = v30:LoadAnimation(v29)
                p_u_23.track:Play()
                if p_u_23.destroyed then
                    p_u_23.track:Stop()
                end
            end
        end)
        task.spawn(function()
            p_u_23.tool = v_u_22(p_u_23.entry, p_u_24)
            v_u_13("Found tool", p_u_23.tool)
            if p_u_23.tool == nil then
                return
            elseif not p_u_23.destroyed then
                v_u_13("Attempting to equip")
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(p_u_23.tool)
                if p_u_23.tool_entry.equipped then
                    v_u_9.pcall_warn_error(function()
                        p_u_23.tool_entry.equipped(p_u_23.entry, p_u_23)
                    end)
                end
            end
        end)
        task.spawn(function()
            if p_u_23.entry.anims then
                local v31 = {}
                for _, v32 in pairs(p_u_23.entry.anims) do
                    if typeof(v32) == "string" then
                        table.insert(v31, v32)
                    end
                end
                local v34 = v_u_12.List.map(v31, function(p33)
                    return v_u_6.get_track(p33)
                end)
                game:GetService("ContentProvider"):PreloadAsync(v34)
            end
        end)
    end
end
function v15.get_uses_left(p35)
    local v36 = ((v_u_7.get("inventory") or {})[p35.item_data.category] or {})[p35.item_data.unique]
    return v36 == nil and 0 or (v36.properties.uses_left or p35.entry.uses or 1)
end
function v15.get_unique(p37)
    return p37.item_data.unique
end
function v15.get_updated_item_data(p38)
    return ((v_u_7.get("inventory") or {})[p38.item_data.category] or {})[p38.item_data.unique]
end
function v15.use(p_u_39, p_u_40)
    if p_u_39.in_use then
        local v41 = p_u_39.entry.tool_use_properties
        if v41 then
            v41 = p_u_39.entry.tool_use_properties.allow_cancellation_partway_through_use
        end
        if v41 and p_u_39.early_cancellation_signal then
            p_u_39.early_cancellation_signal:fire()
        end
        return
    elseif v_u_1("ObbyM").is_in_obby() then
        return
    else
        local v42 = v_u_1("UIManager")
        if v42.is_visible("AvatarEditorApp") or v42.is_visible("MannequinPurchaseApp") then
            return
        elseif v42.is_visible("TradeApp") then
            return
        elseif v42.is_visible("PlayerSpectateApp") then
            return
        elseif v_u_8.is_item_useable(p_u_39.entry) then
            local v_u_43 = p_u_39:get_uses_left()
            if v_u_43 <= 0 then
                if p_u_39.tool_entry.on_no_uses_left then
                    p_u_39.tool_entry.on_no_uses_left(p_u_39.entry, p_u_39)
                end
            else
                p_u_39.in_use = true
                p_u_39.early_cancellation_signal = v_u_11.new()
                if p_u_39.tool_use_start_callback then
                    p_u_39.tool_use_start_callback()
                end
                local v_u_44 = nil
                local function v_u_46(p45)
                    if not v_u_44 then
                        v_u_44 = true
                        v_u_2.get("ToolAPI/ServerUseTool"):FireServer(p_u_39.item_data.unique, "END", p45)
                    end
                end
                v_u_2.get("ToolAPI/ServerUseTool"):FireServer(p_u_39.item_data.unique, "START")
                local v_u_47 = nil
                if p_u_39.tool_entry.client_use then
                    local v_u_48 = nil
                    local v51 = v_u_9.pcall_warn_error(function()
                        local v49, v50 = p_u_39.tool_entry.client_use(p_u_39.entry, v_u_46, p_u_39, v_u_43, p_u_40, p_u_39.early_cancellation_signal, p_u_39.unequipped_signal)
                        v_u_48 = v49
                        v_u_47 = v50
                    end)
                    if v_u_48 == false or not v51 then
                        p_u_39.in_use = false
                        if p_u_39.tool_use_end_callback then
                            p_u_39.tool_use_end_callback()
                        end
                        return
                    end
                end
                local v52 = p_u_39:get_updated_item_data()
                v42.apps.BackpackApp:client_predict_item_uses_left(v52)
                local v53 = v_u_47
                if not v_u_44 then
                    v_u_44 = true
                    v_u_2.get("ToolAPI/ServerUseTool"):FireServer(p_u_39.item_data.unique, "END", v53)
                end
                if p_u_39.early_cancellation_signal then
                    p_u_39.early_cancellation_signal:destroy()
                    p_u_39.early_cancellation_signal = nil
                end
                p_u_39.in_use = false
                if p_u_39.tool_use_end_callback then
                    p_u_39.tool_use_end_callback()
                end
            end
        else
            v42.apps.DialogApp:dialog({
                ["text"] = "This item is currently disabled.",
                ["button"] = "Okay"
            })
            return
        end
    end
end
function v15.is_equipped(p54)
    return not p54.destroyed
end
function v15.destroy(p_u_55)
    if p_u_55.destroyed then
        return
    else
        p_u_55.destroyed = true
        if p_u_55.track then
            p_u_55.track:Stop()
        end
        if p_u_55.tool_entry.unequipped then
            v_u_9.pcall_warn_error(function()
                p_u_55.tool_entry.unequipped(p_u_55.entry, p_u_55)
            end)
        end
        p_u_55.unequipped_signal:fire()
        p_u_55.unequipped_signal:destroy()
        if p_u_55.item_data.category ~= "strollers" then
            if p_u_55.tool and p_u_55.tool.Parent then
                p_u_55.tool.Parent = game.Players.LocalPlayer.Backpack
            end
        end
    end
end
return v15