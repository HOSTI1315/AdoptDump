--// ReplicatedStorage.ClientServices.Interactions.HomeingRocketInteractions (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InteractionsEngine")
local v_u_3 = v1("RouterClient")
v1("InteriorsM")
local v_u_4 = v1("PlaceableToolHelper")
local v_u_5 = v1("FurnitureBlockerHelper")
local v_u_6 = v1("ClientData")
local v_u_7 = v1("FamilyHelper")
local function v_u_12(p8)
    local v9 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart", true)
    if not v9 then
        return false
    end
    for _, v10 in p8 do
        local v11 = v10:FindFirstChild("SeatWeld")
        if v11 and v11.Part1 == v9 then
            return true
        end
    end
    return false
end
local function v_u_30(p13, p_u_14)
    local v15 = p13:WaitForChild("Rocket", 5)
    if v15 then
        local v16 = v15:WaitForChild("RootPart", 5)
        if v16 then
            local v17 = v15:WaitForChild("Seats", 5)
            if v17 then
                local v_u_18 = v17:GetChildren()
                if v_u_18 then
                    local v_u_19 = v_u_4.get_owner(p13)
                    local v_u_20 = v_u_19 == game.Players.LocalPlayer
                    p_u_14.interaction = v_u_2:register({
                        ["text"] = v_u_20 and "Configure" or "Take a seat on " .. v_u_19.Name .. "\'s rocket",
                        ["part"] = v16,
                        ["offset"] = Vector3.new(0, 5, 0),
                        ["is_visible"] = function()
                            if v_u_20 then
                                return true
                            end
                            local v21 = v_u_19
                            local v22 = v_u_6.get_server(v21, "door_locked")
                            if not v_u_6.get("dev_watchmode") and (v22 == true and (not v_u_7.is_my_friend_or_family(v21) and v21 ~= game.Players.LocalPlayer)) then
                                return false
                            end
                            for _, v24 in v_u_18 do
                                if not v24:FindFirstChild("SeatWeld") then
                                    ::l15::
                                    return v24 ~= nil
                                end
                            end
                            local v24 = nil
                            goto l15
                        end,
                        ["on_selected"] = function()
                            if v_u_20 then
                                local v26 = {
                                    {
                                        ["text"] = "Take a seat on your rocket",
                                        ["on_selected"] = function()
                                            local v25 = v_u_19
                                            v_u_3.get("PlaceableToolAPI/SitInHomeingRocket"):InvokeServer(v25)
                                        end
                                    },
                                    {
                                        ["text"] = "Launch to your house!",
                                        ["on_selected"] = function()
                                            v_u_3.get("PlaceableToolAPI/LaunchHomeingRocket"):InvokeServer(v_u_19)
                                            p_u_14:DoCleaning()
                                        end
                                    },
                                    {
                                        ["text"] = "Take Down",
                                        ["on_selected"] = function()
                                            v_u_3.get("PlaceableToolAPI/DestroyPlaceable"):InvokeServer("homeing_rocket", "jokes_2024_homeing_rocket")
                                        end
                                    }
                                }
                                if v_u_12(v_u_18) then
                                    table.remove(v26, 1)
                                end
                                return v26
                            else
                                local v28 = {
                                    {
                                        ["text"] = "Take a seat on " .. v_u_19.Name .. "\'s rocket",
                                        ["on_selected"] = function()
                                            local v27 = v_u_19
                                            v_u_3.get("PlaceableToolAPI/SitInHomeingRocket"):InvokeServer(v27)
                                        end
                                    }
                                }
                                if v_u_4.is_house_owner() then
                                    local v29 = {
                                        ["text"] = "Take Down",
                                        ["on_selected"] = function()
                                            v_u_3.get("PlaceableToolAPI/HouseOwnerDestroyPlaceable"):InvokeServer(v_u_19, "homeing_rocket", "jokes_2024_homeing_rocket")
                                        end
                                    }
                                    table.insert(v28, v29)
                                end
                                return v28
                            end
                        end
                    })
                    v_u_5.protect_interaction(p_u_14.interaction)
                end
            else
                return
            end
        else
            return
        end
    else
        return
    end
end
return {
    ["init"] = function()
        v_u_4.listen_for_placeables("HomeingRocket", v_u_30)
    end
}