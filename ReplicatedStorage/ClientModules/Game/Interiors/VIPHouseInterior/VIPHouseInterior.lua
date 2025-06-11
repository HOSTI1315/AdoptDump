--// ReplicatedStorage.ClientModules.Game.Interiors.VIPHouseInterior (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = {
    [0] = {
        ["destination_id"] = "housing",
        ["destination_door_id"] = "ElevatorDoorBasement",
        ["full_name"] = "Cinema",
        ["elevator_display"] = "B"
    },
    [1] = {
        ["destination_id"] = "housing",
        ["destination_door_id"] = "ElevatorDoorFloor1",
        ["full_name"] = "Floor 1",
        ["elevator_display"] = "1"
    },
    [2] = {
        ["destination_id"] = "exit_housing",
        ["destination_door_id"] = "Floor2",
        ["full_name"] = "Floor 2",
        ["elevator_display"] = "2"
    },
    [3] = {
        ["destination_id"] = "exit_housing",
        ["destination_door_id"] = "Floor3",
        ["full_name"] = "Floor 3",
        ["elevator_display"] = "3"
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
    ["interactions"] = function(p_u_24)
        local v25 = v_u_1("InteriorsDB").housing.interactions(p_u_24)
        local v26 = v_u_1("InteractionsEngine")
        local v27 = {
            ["text"] = "Select Floor"
        }
        local v28 = {}
        local v29 = {
            ["text"] = v_u_2[1].full_name
        }
        local v_u_30 = 1
        function v29.on_selected()
            v_u_23(p_u_24, v_u_30)
        end
        local v31 = {
            ["text"] = v_u_2[2].full_name
        }
        local v_u_32 = 2
        function v31.on_selected()
            v_u_23(p_u_24, v_u_32)
        end
        local v33 = {
            ["text"] = v_u_2[3].full_name
        }
        local v_u_34 = 3
        function v33.on_selected()
            v_u_23(p_u_24, v_u_34)
        end
        local v35 = {
            ["text"] = v_u_2[0].full_name
        }
        local v_u_36 = 0
        function v35.on_selected()
            v_u_23(p_u_24, v_u_36)
        end
        __set_list(v28, 1, {v29, v31, v33, v35})
        v27.on_selected = v28
        v27.part = p_u_24.Doors.ElevatorDoor.WorkingParts.DoorCenter
        table.insert(v25, v26:register(v27))
        return v25
    end,
    ["render"] = function(p37, p38)
        local v39 = v_u_1("Music")
        local v40 = v_u_1("SoundDB")
        local v41 = v_u_1("SoundPlayer")
        v_u_1("InteriorsDB").housing.render(p37, p38)
        local v42 = p38.exiting_door_id
        if v42 then
            for _, v43 in pairs(v_u_2) do
                if v43.destination_door_id == v42 then
                    v42 = v43.elevator_display
                    goto l2
                end
            end
            v42 = nil
            goto l2
        else
            ::l2::
            p37.SpecialParts.ElevatorDisplay.Screen.SurfaceGui.TextLabel.Text = v42 or "1"
            if p38.destination_door_id == "ElevatorDoor" then
                v39.play(2, v40.VIPElevatorMusic)
            end
            if p38.destination_door_id:sub(1, 12) == "ElevatorDoor" then
                v41.FX:play("ElevatorClose", p37.Doors:FindFirstChild(p38.destination_door_id).WorkingParts.TouchToEnter)
            end
            return
        end
    end,
    ["cleanup"] = function(p44, p45)
        local v46 = v_u_1("Music")
        local v47 = v_u_1("SoundDB")
        v46.stop(2, v47.VIPElevatorMusic)
        v_u_1("InteriorsDB").housing.cleanup(p44, p45)
    end
}