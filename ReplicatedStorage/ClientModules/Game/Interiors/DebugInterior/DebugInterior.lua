--// ReplicatedStorage.ClientModules.Game.Interiors.DebugInterior (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = game:GetService("Players")
return {
    ["interactions"] = function(p_u_3, p_u_4)
        local v5 = v_u_1("InteractionsEngine")
        local v_u_6 = v_u_1("ClientData")
        local v_u_7 = v_u_1("DoorsM")
        local v_u_8 = v_u_1("UIManager")
        local v9 = {}
        local v11 = {
            ["text"] = "Enter",
            ["part"] = p_u_3.Doors.InteractToEnter.WorkingParts.TouchToEnter,
            ["on_selected"] = function()
                local v10 = v_u_7.get_door(p_u_3.Doors.InteractToEnter)
                v10:open()
                wait(0.6)
                v10:enter()
            end
        }
        table.insert(v9, v5:register(v11))
        local v16 = {
            ["text"] = "Enter",
            ["part"] = p_u_3.Doors.CakeKey.WorkingParts.TouchToEnter,
            ["on_selected"] = function()
                local v12 = false
                for _, v13 in v_u_6.get("inventory") do
                    for _, v14 in v13 do
                        if v14.category == "food" and v14.id == "cake" then
                            v12 = true
                        end
                    end
                end
                if v12 then
                    local v15 = v_u_7.get_door(p_u_3.Doors.CakeKey)
                    v15:open()
                    wait(0.6)
                    v15:enter()
                else
                    v_u_8.apps.DialogApp:dialog({
                        ["text"] = "You must acquire the food \'cake\' before opening this door",
                        ["button"] = "Okay"
                    })
                end
            end
        }
        table.insert(v9, v5:register(v16))
        local v18 = {
            ["text"] = "Toggle Lock",
            ["part"] = p_u_3.Doors.InteractKey.WorkingParts.TouchToEnter,
            ["on_selected"] = function()
                if p_u_4.unlocked then
                    local v17 = v_u_7.get_door(p_u_3.Doors.InteractKey)
                    v17:open()
                    wait(0.6)
                    v17:enter()
                else
                    v_u_8.apps.DialogApp:dialog({
                        ["text"] = "Interact with this door again to go through it",
                        ["button"] = "Okay"
                    })
                    p_u_4.unlocked = true
                end
            end
        }
        table.insert(v9, v5:register(v18))
        return v9
    end,
    ["render"] = function(p19, p_u_20)
        local v21 = v_u_1("TerrainHelper")
        local v_u_22 = v_u_1("UIManager")
        p_u_20.terrain_cleanup = v21.load_by_parts({
            [p19.TerrainWater] = Enum.Material.Water
        })
        p19.TerrainWater.CanCollide = false
        p19.TerrainWater.Transparency = 1
        p19.TerrainWater:ClearAllChildren()
        p19.Doors.YourHouse.WorkingParts.Configuration.house_owner.Value = v_u_2.LocalPlayer.Name
        p_u_20.blindness_door_connection = p19.Doors.DoorThatBlindsYou.WorkingParts.TouchToEnter.Touched:Connect(function()
            if not p_u_20.blindness_task then
                p_u_20.blindness_task = task.spawn(function()
                    local v23 = v_u_22.apps.TransitionsApp:lock_transitions("blindness")
                    v_u_22.apps.TransitionsApp:sudden_fill()
                    task.wait(15)
                    v23()
                    v_u_22.apps.TransitionsApp:sudden_fill_off()
                    p_u_20.blindness_task = nil
                end)
            end
        end)
    end,
    ["cleanup"] = function(_, p24)
        p24.terrain_cleanup()
        p24.blindness_door_connection:Disconnect()
    end
}