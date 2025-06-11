--// ReplicatedStorage.ClientServices.Interactions.TradeStandInteractions (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InteractionsEngine")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("PlaceableToolHelper")
local v_u_6 = v1("FurnitureBlockerHelper")
local v_u_7 = v1("InventoryDB")
local v_u_8 = v1("GrammarUtil")
local v_u_9 = v1("package:Sift")
local v_u_10 = game:GetService("HttpService")
local v11 = {}
local function v_u_17(p12, p13, p14)
    p12:ClearAllChildren()
    if p13 then
        local v15 = Instance.new("Frame")
        v15.Size = UDim2.fromScale(1, 1)
        v15.BackgroundColor3 = Color3.new(1, 1, 1)
        v15.ZIndex = -1
        v15.Parent = p12
        local v16 = Instance.new("Frame")
        v16.Transparency = 1
        v16.Size = UDim2.fromScale(1, 1)
        v16.Parent = p12
        v_u_4.wrap(v16, "ItemImage"):start({
            ["entry"] = p13
        })
        if p14 and p13.category == "pets" then
            v_u_4.wrap(v16, "TagDisplay"):start({
                ["properties"] = p14
            })
        end
    end
end
local function v_u_24(p18, p19, p20)
    local v21 = p18.WorkingParts:FindFirstChild("ItemName", true)
    local v22 = not p19 and "" or v_u_8.append_properties(p19.name, p20)
    v21.AutoLocalize = false
    v21.Text = v22
    for _, v23 in p18.WorkingParts:GetChildren() do
        if v23.Name == "ItemScreen" then
            v_u_17(v23.Item, p19, p20)
        end
    end
end
local function v_u_28(p25)
    local v26 = v_u_5.get_value(p25, "Item")
    if v26 then
        local v27 = v_u_10:JSONDecode(v26)
        v_u_24(p25, v_u_7[v27.category][v27.kind], v27.properties)
    else
        v_u_24(p25, nil, nil)
    end
end
local function v_u_35(p29, p30)
    local v31 = v_u_5.get_value(p30, "Item")
    if v31 then
        local v32 = v_u_10:JSONDecode(v31)
        local v33 = v_u_7[v32.category][v32.kind]
        if v_u_4.apps.DialogApp:dialog({
            ["dialog_type"] = "ItemPreviewDialog",
            ["item"] = v32,
            ["text"] = ("Send a trade request for %s\'s %s?"):format(p29.Name, v33.name),
            ["right"] = "Trade",
            ["left"] = "Cancel"
        }) == "Trade" then
            local v34 = v_u_5.get_value(p30, "Item")
            if v34 then
                v34 = v_u_10:JSONDecode(v34)
            end
            if v34 and v_u_9.Dictionary.equalsDeep(v32, v34) then
                v_u_3.get("TradeAPI/SendTradeRequest"):FireServer(p29, "trade_stand")
            else
                v_u_4.apps.DialogApp:dialog({
                    ["text"] = "The item at the stand has changed!",
                    ["button"] = "Okay"
                })
            end
        else
            return
        end
    else
        return
    end
end
local function v_u_57(p_u_36, p37)
    local v38 = p_u_36:WaitForChild("UseBlock")
    local v_u_39 = v_u_5.get_value(p_u_36, "StandType")
    local v40 = p_u_36:WaitForChild("WorkingParts")
    local v_u_41 = v_u_5.get_owner(p_u_36)
    v40:FindFirstChild("PlayerName", true).Text = ("%s\'s Classic Trade Stand"):format(v_u_41.Name)
    local v_u_42 = v_u_41 == game.Players.LocalPlayer
    p37.interaction = v_u_2:register({
        ["text"] = (v_u_42 or v_u_5.get_value(p_u_36, "Item") == nil) and "Configure" or "Trade",
        ["part"] = v38,
        ["is_visible"] = function()
            return v_u_42 or (v_u_5.get_value(p_u_36, "Item") ~= nil and true or v_u_5.is_house_owner())
        end,
        ["on_selected"] = function()
            if v_u_42 then
                local v43 = {}
                local v49 = {
                    ["text"] = "Select Item",
                    ["on_selected"] = function()
                        local v44 = v_u_4.apps.BackpackApp:pick_item({
                            ["keep_cached_scroll_positions_on_open"] = true
                        })
                        local v45
                        if v44 then
                            v45 = v44.unique
                        else
                            v45 = nil
                        end
                        if v45 then
                            local v46, v47 = v_u_3.get("PlaceableToolAPI/SetItemForTrade"):InvokeServer(v_u_39, v45)
                            if v46 then
                                local v48 = v_u_7[v44.category][v44.kind]
                                v_u_4.apps.HintApp:hint({
                                    ["text"] = ("Your %s is now on display!"):format(v48.name),
                                    ["overridable"] = true,
                                    ["yields"] = false
                                })
                            else
                                v_u_4.apps.DialogApp:dialog({
                                    ["text"] = v47 or "You can\'t display that item.",
                                    ["button"] = "Okay"
                                })
                            end
                        else
                            return
                        end
                    end
                }
                table.insert(v43, v49)
                if v_u_5.get_value(p_u_36, "Item") then
                    local v52 = {
                        ["text"] = "Remove Item",
                        ["on_selected"] = function()
                            local v50, v51 = v_u_3.get("PlaceableToolAPI/SetItemForTrade"):InvokeServer(v_u_39, nil)
                            if v50 then
                                v_u_4.apps.HintApp:hint({
                                    ["text"] = "The display was cleared.",
                                    ["overridable"] = true,
                                    ["yields"] = false
                                })
                            else
                                v_u_4.apps.DialogApp:dialog({
                                    ["text"] = v51,
                                    ["button"] = "Okay"
                                })
                            end
                        end
                    }
                    table.insert(v43, v52)
                end
                local v53 = {
                    ["text"] = "Take Down",
                    ["on_selected"] = function()
                        v_u_3.get("PlaceableToolAPI/DestroyPlaceable"):InvokeServer("trade_stand", v_u_39)
                    end
                }
                table.insert(v43, v53)
                return v43
            end
            if v_u_5.is_house_owner() then
                local v54 = {}
                if v_u_5.get_value(p_u_36, "Item") ~= nil then
                    local v55 = {
                        ["text"] = "Trade",
                        ["on_selected"] = function()
                            v_u_35(v_u_41, p_u_36)
                        end
                    }
                    table.insert(v54, v55)
                end
                local v56 = {
                    ["text"] = "Take Down",
                    ["on_selected"] = function()
                        v_u_3.get("PlaceableToolAPI/HouseOwnerDestroyPlaceable"):InvokeServer(v_u_41, "trade_stand", v_u_39)
                    end
                }
                table.insert(v54, v56)
                return v54
            end
            v_u_35(v_u_41, p_u_36)
        end
    })
    v_u_6.protect_interaction(p37.interaction)
    v_u_28(p_u_36)
    p37.item_changed = v_u_5.get_value_changed_signal(p_u_36, "Item"):Connect(function()
        v_u_28(p_u_36)
    end)
end
function v11.init()
    v_u_5.listen_for_placeables("TradeStand", v_u_57)
end
return v11