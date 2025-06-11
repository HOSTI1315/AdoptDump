--// ReplicatedStorage.ClientServices.Interactions.RefreshmentStandInteractions (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InteractionsEngine")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("RefreshmentsDB")
local v_u_6 = v1("PolicyHelper")
local v_u_7 = v1("PlaceableToolHelper")
local v_u_8 = v1("FurnitureBlockerHelper")
local v9 = {}
local function v_u_17(p10, p11, p12, p13)
    local v14 = v_u_7.get_value(p11, "Price")
    if v14 ~= 0 then
        local v15, v16 = v_u_6.is_trading_prohibited(game.Players.LocalPlayer)
        if v15 then
            v_u_4.apps.DialogApp:dialog({
                ["text"] = v16,
                ["button"] = "Okay"
            })
            return
        end
    end
    if v_u_4.apps.DialogApp:dialog({
        ["text"] = "Buy a " .. p13 .. " from " .. p10.Name .. " for $" .. v14 .. "?",
        ["right"] = "Buy",
        ["left"] = "Cancel"
    }) == "Buy" then
        v_u_3.get("PlaceableToolAPI/BuyRefreshment"):InvokeServer(p12, p10, v14)
    end
end
local function v_u_42(p_u_18, p19)
    local v20 = p_u_18:WaitForChild("BuyRefreshment")
    local v_u_21 = v_u_7.get_value(p_u_18, "StandType")
    local v_u_22 = v_u_7.get_owner(p_u_18)
    local v_u_23 = v_u_22 == game.Players.LocalPlayer
    local v24 = v_u_5[v_u_21]
    local v_u_25 = v24.refreshment_name
    local v_u_26 = v24.refreshment_name_plural or v_u_25
    p19.interaction = v_u_2:register({
        ["text"] = v_u_23 and "Configure" or string.format("ui.buy_label_item [%s]", v_u_25),
        ["part"] = v20,
        ["on_selected"] = function()
            if v_u_23 then
                local v27 = {}
                local v35 = {
                    ["text"] = "Set Price",
                    ["on_selected"] = function()
                        local v28, v29 = v_u_6.is_trading_prohibited(game.Players.LocalPlayer)
                        if v28 then
                            v_u_4.apps.DialogApp:dialog({
                                ["text"] = v29,
                                ["button"] = "Okay"
                            })
                        else
                            local v30, v31 = v_u_4.apps.DialogApp:free_response_dialog({
                                ["text"] = "Enter price of a " .. v_u_25 .. " (limit is $" .. v_u_5[v_u_21].max_price .. ")",
                                ["left"] = "Cancel",
                                ["right"] = "Set"
                            })
                            local v32 = tonumber(v31)
                            if v30 == "Set" and v32 ~= nil then
                                local v_u_33 = math.floor(v32)
                                local v_u_34 = v_u_3.get("PlaceableToolAPI/SetRefreshmentPrice"):InvokeServer(v_u_21, v_u_33)
                                task.spawn(function()
                                    if v_u_34 then
                                        v_u_4.apps.HintApp:hint({
                                            ["text"] = "Price was set to $" .. v_u_33 .. "!"
                                        })
                                    else
                                        v_u_4.apps.HintApp:hint({
                                            ["text"] = "You can\'t set the price to that"
                                        })
                                    end
                                end)
                            end
                        end
                    end
                }
                table.insert(v27, v35)
                local v36 = {
                    ["text"] = "Take Down",
                    ["on_selected"] = function()
                        v_u_3.get("PlaceableToolAPI/DestroyPlaceable"):InvokeServer("refreshment", v_u_21)
                    end
                }
                table.insert(v27, v36)
                return v27
            end
            if v_u_7.is_house_owner() then
                local v37 = {}
                local v38 = {
                    ["text"] = string.format("ui.buy_label_item [%s]", v_u_25),
                    ["on_selected"] = function()
                        v_u_17(v_u_22, p_u_18, v_u_21, v_u_25)
                    end
                }
                table.insert(v37, v38)
                local v39 = {
                    ["text"] = "Take Down",
                    ["on_selected"] = function()
                        v_u_3.get("PlaceableToolAPI/HouseOwnerDestroyPlaceable"):InvokeServer(v_u_22, "refreshment", v_u_21)
                    end
                }
                table.insert(v37, v39)
                return v37
            end
            v_u_17(v_u_22, p_u_18, v_u_21, v_u_25)
        end
    })
    v_u_8.protect_interaction(p19.interaction)
    local function v40()
        p_u_18.NamePart.SurfaceGui.TextLabel.Text = v_u_7.get_owner(p_u_18).Name .. "\'s " .. v_u_26
    end
    local function v41()
        p_u_18.PricePart.SurfaceGui.TextLabel.Text = "$" .. v_u_7.get_value(p_u_18, "Price")
    end
    p19.owner_changed = v_u_7.get_owner_changed_signal(p_u_18):Connect(v40)
    p19.price_changed = v_u_7.get_value_changed_signal(p_u_18, "Price"):Connect(v41)
    p_u_18.NamePart.SurfaceGui.TextLabel.Text = v_u_7.get_owner(p_u_18).Name .. "\'s " .. v_u_26
    p_u_18.PricePart.SurfaceGui.TextLabel.Text = "$" .. v_u_7.get_value(p_u_18, "Price")
end
function v9.init()
    v_u_7.listen_for_placeables("RefreshmentStand", v_u_42)
end
return v9