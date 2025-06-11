--// ReplicatedStorage.ClientModules.Game.Interiors.LuxuryHouseInterior (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = {
    [0] = {
        ["destination_id"] = "housing",
        ["destination_door_id"] = "ElevatorDoorBasement",
        ["full_name"] = "Basement",
        ["elevator_display"] = "B",
        ["addon"] = "extension_5"
    },
    [1] = {
        ["destination_id"] = "housing",
        ["destination_door_id"] = "ElevatorDoorFloor1",
        ["full_name"] = "Floor 1",
        ["elevator_display"] = "1"
    },
    [2] = {
        ["destination_id"] = "housing",
        ["destination_door_id"] = "ElevatorDoorFloor2",
        ["full_name"] = "Floor 2",
        ["elevator_display"] = "2",
        ["addon"] = "extension_4"
    }
}
local v_u_3 = false
local function v_u_23(p4, p5)
    if v_u_3 then
        return
    end
    v_u_3 = true
    local v6 = v_u_1("DoorsM")
    local v7 = p4.Doors.ElevatorDoor
    local v8 = v7.WorkingParts.Configuration
    local v9 = v6.get_door(v7)
    local v10 = p4.SpecialParts.ElevatorDisplay
    local v11 = not v_u_2[p5] and 1 or p5
    v8.destination_id.Value = v_u_2[v11].destination_id
    v8.destination_door_id.Value = v_u_2[v11].destination_door_id
    local v12 = p4.SpecialParts.ElevatorButtons:FindFirstChild((tostring(v11)))
    v12.Material = Enum.Material.Neon
    v12.Color = Color3.fromRGB(0, 255, 0)
    local v13 = v10.Screen.SurfaceGui.TextLabel.Text
    for v22, v15 in pairs(v_u_2) do
        if v15.elevator_display == v13 then
            ::l8::
            local v16 = v11 - v22
            local v17
            if v16 == 0 then
                v17 = false
            else
                v17 = v16 > 0 and v10.Up or v10.Down
            end
            if v17 then
                for _, v18 in ipairs(v17:GetChildren()) do
                    v18.Material = Enum.Material.Neon
                    v18.Color = Color3.fromRGB(129, 166, 189)
                end
            end
            if v16 ~= 0 then
                for v19 = 0, v16, math.sign(v16) do
                    local v20 = v22 + v19
                    v10.Screen.SurfaceGui.TextLabel.Text = v_u_2[v20].elevator_display
                    task.wait(0.5)
                end
            end
            v9:open()
            task.wait(0.5)
            v9:enter()
            v12.Material = Enum.Material.SmoothPlastic
            v12.Color = Color3.fromRGB(57, 57, 57)
            if v17 then
                for _, v21 in ipairs(v17:GetChildren()) do
                    v21.Material = Enum.Material.SmoothPlastic
                    v21.Color = Color3.fromRGB(163, 162, 165)
                end
            end
            v_u_3 = false
            return
        end
    end
    local v22 = nil
    goto l8
end
return {
    ["interactions"] = function(p_u_24, _)
        local v25 = v_u_1("InteriorsDB").housing.interactions(p_u_24)
        local v26 = v_u_1("InteractionsEngine")
        local v27 = {}
        for v_u_28, v29 in v_u_2 do
            if p_u_24.Doors:FindFirstChild(v29.destination_door_id) then
                local v30 = {
                    ["text"] = v_u_2[v_u_28].full_name,
                    ["on_selected"] = function()
                        v_u_23(p_u_24, v_u_28)
                    end
                }
                table.insert(v27, v30)
            end
        end
        local v31 = {
            ["text"] = "Select Floor",
            ["on_selected"] = v27,
            ["part"] = p_u_24.Doors.ElevatorDoor.WorkingParts.DoorCenter
        }
        table.insert(v25, v26:register(v31))
        return v25
    end,
    ["render"] = function(p32, p33)
        local v34 = v_u_1("Music")
        local v35 = v_u_1("SoundDB")
        local v36 = v_u_1("SoundPlayer")
        v_u_1("InteriorsDB").housing.render(p32, p33)
        local v37 = p33.exiting_door_id
        if v37 then
            for _, v38 in pairs(v_u_2) do
                if v38.destination_door_id == v37 then
                    v37 = v38.elevator_display
                    goto l2
                end
            end
            v37 = nil
            goto l2
        else
            ::l2::
            p32.SpecialParts.ElevatorDisplay.Screen.SurfaceGui.TextLabel.Text = v37 or "1"
            if p33.destination_door_id == "ElevatorDoor" then
                v34.play(2, v35.VIPElevatorMusic)
            end
            if p33.destination_door_id:sub(1, 12) == "ElevatorDoor" then
                v36.FX:play("ElevatorClose", p32.Doors:FindFirstChild(p33.destination_door_id).WorkingParts.TouchToEnter)
            end
            return
        end
    end,
    ["cleanup"] = function(p39, p40)
        local v41 = v_u_1("Music")
        local v42 = v_u_1("SoundDB")
        v41.stop(2, v42.VIPElevatorMusic)
        v_u_1("InteriorsDB").housing.cleanup(p39, p40)
    end
}