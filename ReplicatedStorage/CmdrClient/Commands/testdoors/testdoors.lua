--// ReplicatedStorage.CmdrClient.Commands.testdoors (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("Players")
local v_u_4 = workspace:FindFirstChild("Interiors")
local v_u_5 = require(v1.Fsys).load
local v_u_6 = v_u_5("LiveOpsMapSwap")
local v_u_7 = require(v1.SharedPackages.Sift)
local v_u_8 = require(v1.SharedPackages.Promise)
local v_u_9 = v_u_7.Array.toSet({
    "AFKZone",
    "WingRoom",
    "FinalStopShop",
    "preview_housing",
    "Tutorial",
    "DDLM2024WagonInterior",
    "DebugInterior"
})
local v_u_10 = {
    ["MainMap"] = v_u_7.Array.toSet({
        "AFKZone/MainDoor",
        "DebugInterior/MainDoor",
        "WarpDoor",
        "DDLM2024WagonInterior/MainDoor",
        "MoonInterior/MainDoor"
    }),
    ["SkyCastle"] = v_u_7.Array.toSet({ "WingCaveRespawnDoor" }),
    ["DebugInterior"] = v_u_7.Array.toSet({ "VoidDrop" })
}
local v_u_16 = {
    ["Nursery"] = {
        ["VIPDoor"] = function()
            return v_u_5("ClientData").get_server(game.Players.LocalPlayer, "is_vip")
        end,
        ["VIPBalconyDoor"] = function()
            return v_u_5("ClientData").get_server(game.Players.LocalPlayer, "is_vip")
        end
    },
    ["SafetyHub"] = {
        ["TradeLicenseZone"] = function()
            local v11 = v_u_5("ClientData").get("inventory")
            for _, v12 in pairs(v11) do
                for _, v13 in pairs(v12) do
                    if v13.id == "trade_license" then
                        return false
                    end
                end
            end
            return true
        end
    },
    ["DebugInterior"] = {
        ["CakeKey"] = function()
            for _, v14 in v_u_5("ClientData").get("inventory") do
                for _, v15 in v14 do
                    if v15.category == "food" and v15.id == "cake" then
                        return true
                    end
                end
            end
            return false
        end
    }
}
local v_u_17 = {
    ["MainMap"] = {
        ["SkyCastle/MainDoor"] = Vector3.new(0, 0, -17),
        ["SkyCastle/MainDoor2"] = Vector3.new(0, 0, -17),
        ["Cave/MainDoor"] = Vector3.new(-7.5, 0, -2),
        ["School/MainDoor2"] = Vector3.new(6.5, 0, -6)
    },
    ["Obbies"] = {
        ["coastal_climb"] = Vector3.new(-12, 0, -3),
        ["tinyisles"] = Vector3.new(12, 0, -3),
        ["lonelypeak"] = Vector3.new(12, 0, -3)
    },
    ["pyramid"] = {
        ["CompleteObbyDoor"] = Vector3.new(-6, 0, -0.5)
    },
    ["tinyisles"] = {
        ["CompleteObbyDoor"] = Vector3.new(-12, 0, -3)
    }
}
local v_u_18 = false
local function v_u_21(p19)
    local v20
    if next(p19.interior_wrong) == nil and (next(p19.parts_missing) == nil and (next(p19.loading_wrong) == nil and next(p19.falling_out_of) == nil)) then
        v20 = next(p19.door_locked) == nil
    else
        v20 = false
    end
    return v20
end
local function v_u_39(p22)
    local v23 = {}
    for v24, v25 in p22 do
        if not v_u_21(v25) then
            local v26 = {
                ["text"] = ("\226\128\162 %* results:"):format(v24),
                ["already_translated"] = true,
                ["size"] = 20,
                ["text_x_alignment"] = Enum.TextXAlignment.Left
            }
            table.insert(v23, v26)
            for _, v27 in v25.door_locked do
                local v28 = {
                    ["text"] = ("  \226\128\162 %* did not allow you to walk through it when it should have"):format(v27),
                    ["already_translated"] = true,
                    ["size"] = 20,
                    ["text_x_alignment"] = Enum.TextXAlignment.Left
                }
                table.insert(v23, v28)
            end
            for _, v29 in v25.parts_missing do
                local v30 = {
                    ["text"] = ("  \226\128\162 %* was missing one or more part of it internally (see the dev console)"):format(v29),
                    ["already_translated"] = true,
                    ["size"] = 20,
                    ["text_x_alignment"] = Enum.TextXAlignment.Left
                }
                table.insert(v23, v30)
            end
            for _, v31 in v25.loading_wrong do
                local v32 = {
                    ["text"] = ("  \226\128\162 %* lead to the wrong interior"):format(v31),
                    ["already_translated"] = true,
                    ["size"] = 20,
                    ["text_x_alignment"] = Enum.TextXAlignment.Left
                }
                table.insert(v23, v32)
            end
            for _, v33 in v25.falling_out_of do
                local v34 = {
                    ["text"] = ("  \226\128\162 %* caused the player to fall out of it when you went through"):format(v33),
                    ["already_translated"] = true,
                    ["size"] = 20,
                    ["text_x_alignment"] = Enum.TextXAlignment.Left
                }
                table.insert(v23, v34)
            end
            for _, v35 in v25.interior_wrong do
                local v36 = {
                    ["text"] = ("  \226\128\162 %* was not tested because an interior involved failed to load (see the dev console)"):format(v35),
                    ["already_translated"] = true,
                    ["size"] = 20,
                    ["text_x_alignment"] = Enum.TextXAlignment.Left
                }
                table.insert(v23, v36)
            end
            for _, v37 in v25.transition_failed do
                local v38 = {
                    ["text"] = ("  \226\128\162 %* kept the transition screen up when the player went through it"):format(v37),
                    ["already_translated"] = true,
                    ["size"] = 20,
                    ["text_x_alignment"] = Enum.TextXAlignment.Left
                }
                table.insert(v23, v38)
            end
        end
    end
    return v23
end
local function v_u_98(p40, p_u_41, p_u_42)
    if v_u_18 then
        coroutine.yield()
        local v43 = v_u_3.LocalPlayer.Character
        if v43 then
            local v44 = v43.Humanoid
            v44.WalkSpeed = 16
            v44:MoveTo(v43.HumanoidRootPart.Position)
        end
    end
    local v45 = v_u_5("UIManager")
    local v_u_46 = v_u_5("InteriorsM")
    local v47 = v_u_5("Door")
    local v48 = v_u_5("DoorsM")
    local v_u_49 = v_u_6.get_full_interior_name(p40)
    v45.apps.DoorTestApp:set_door_label(p_u_41)
    local v50 = v_u_4:FindFirstChild(v_u_49)
    if v50 then
        local v51 = v50:FindFirstChild("Doors")
        if v51 then
            local v52 = v_u_3.LocalPlayer.Character
            local v_u_53 = v52:FindFirstChild("Humanoid")
            local v54 = v52:FindFirstChild("HumanoidRootPart")
            local v55 = v_u_53.WalkSpeed
            local v56 = v51:FindFirstChild(p_u_41)
            local v57 = v56:WaitForChild("WorkingParts", 5)
            if v57 then
                local v58 = v57:FindFirstChild("TouchToEnter")
                if v58 then
                    local v59 = v57:FindFirstChild("Configuration")
                    if v59 then
                        local v_u_60 = v59:FindFirstChild("destination_id")
                        if v_u_60 then
                            local v_u_61 = v59:FindFirstChild("destination_door_id")
                            if v_u_61 then
                                local v_u_62 = coroutine.running()
                                local v_u_63 = nil
                                local v_u_64 = nil
                                v_u_63 = v47.entering_door_started:Connect(function(p65, p66)
                                    v_u_63:Disconnect()
                                    if p65 ~= v_u_60.Value then
                                        print((("door %*.%* did not lead to the right destination interior"):format(v_u_49, p_u_41)))
                                        local v67 = p_u_42.loading_wrong
                                        local v68 = p_u_41
                                        table.insert(v67, v68)
                                    end
                                    if p66 ~= v_u_61.Value then
                                        print((("door %*.%* did not lead to the right door in the destination interior"):format(v_u_49, p_u_41)))
                                        local v69 = p_u_42.loading_wrong
                                        local v70 = p_u_41
                                        table.insert(v69, v70)
                                    end
                                end)
                                v_u_64 = v47.entering_door_finished:Connect(function(p71, p72)
                                    v_u_64:Disconnect()
                                    if p71 ~= v_u_60.Value then
                                        print((("door %*.%* did not lead to the right destination interior"):format(v_u_49, p_u_41)))
                                        local v73 = p_u_42.loading_wrong
                                        local v74 = p_u_41
                                        table.insert(v73, v74)
                                    end
                                    if p72 ~= v_u_61.Value then
                                        print((("door %*.%* did not lead to the right door in the destination interior"):format(v_u_49, p_u_41)))
                                        local v75 = p_u_42.loading_wrong
                                        local v76 = p_u_41
                                        table.insert(v75, v76)
                                    end
                                    if v_u_53:GetState() == Enum.HumanoidStateType.Freefall then
                                        print((("door %*.%* resulted in a freefall when exited"):format(v_u_49, p_u_41)))
                                        local v77 = p_u_42.falling_out_of
                                        local v78 = p_u_41
                                        table.insert(v77, v78)
                                        v_u_46.enter_smooth(p71, "MainDoor", {
                                            ["studs_ahead_of_door"] = 10,
                                            ["fade_color"] = Color3.fromRGB(200, 100, 200),
                                            ["skip_send_passive_door_request"] = true
                                        })
                                    end
                                    task.spawn(v_u_62)
                                end)
                                local v79 = not (v_u_17[p40] and v_u_17[p40][p_u_41]) and Vector3.new(0, 0, -10) or v_u_17[p40][p_u_41]
                                local v80 = workspace.CurrentCamera.CFrame.Position - v54.CFrame.Position
                                v54.Anchored = true
                                v54.CFrame = v58.CFrame * CFrame.lookAt(v79, v58.CFrame.LookVector)
                                if v_u_18 then
                                    coroutine.yield()
                                    local v81 = v_u_3.LocalPlayer.Character
                                    if v81 then
                                        local v82 = v81.Humanoid
                                        v82.WalkSpeed = 16
                                        v82:MoveTo(v81.HumanoidRootPart.Position)
                                    end
                                end
                                if (v58.Position - v54.Position).Magnitude <= 9 then
                                    v_u_53.WalkSpeed = 5
                                end
                                workspace.CurrentCamera.CFrame = v54.CFrame + v80
                                v54.Anchored = false
                                task.wait(1)
                                v_u_53:MoveTo(v58.Position, v58)
                                if v59:FindFirstChild("NoAutoOpen") then
                                    local v83
                                    if v_u_16[p40] then
                                        v83 = v_u_16[p40][p_u_41]
                                    else
                                        v83 = nil
                                    end
                                    local v84
                                    if v83 then
                                        v84 = v83()
                                    else
                                        v84 = false
                                    end
                                    if not v84 then
                                        local v85, v_u_86 = v45.apps.DialogApp:queue_with_override({
                                            ["text"] = ("This door does not allow you to walk through it. Is this expected?\nThis will auto-select \'No\' in %* seconds."):format(5),
                                            ["left"] = "Yes",
                                            ["right"] = "No"
                                        })
                                        local _, v87 = v_u_8.race({ v85, v_u_8.new(function()
                                                task.wait(5)
                                                v_u_86("No")
                                            end) }):await()
                                        if v87 ~= "Yes" then
                                            print((("door %*.%* did not allow you to walk through when it was supposed to"):format(v_u_49, p_u_41)))
                                            local v88 = p_u_42.door_locked
                                            table.insert(v88, p_u_41)
                                        end
                                        v_u_63:Disconnect()
                                        v_u_64:Disconnect()
                                        return
                                    end
                                    v48.get_door(v56):open()
                                    task.wait(0.6)
                                end
                                coroutine.yield()
                                if v45.apps.TransitionsApp:current_transparency() ~= 1 then
                                    print((("transition failed to hide itself after entering %*.%*"):format(v_u_49, p40)))
                                    local v89 = p_u_42.transition_failed
                                    table.insert(v89, p_u_41)
                                    v45.apps.TransitionsApp:sudden_fill_off()
                                end
                                if not v_u_4:FindFirstChild((v_u_6.get_full_interior_name(v_u_60.Value))) then
                                    print((("door %*.%* did not load the correct interior when exited"):format(v_u_49, p_u_41)))
                                    local v90 = p_u_42.loading_wrong
                                    table.insert(v90, p_u_41)
                                end
                                v_u_53.WalkSpeed = v55
                            else
                                print((("Interior \'%*\' door \'%*\' does not have a destination_door_id"):format(v_u_49, p_u_41)))
                                local v91 = p_u_42.parts_missing
                                table.insert(v91, p_u_41)
                            end
                        else
                            print((("Interior \'%*\' door \'%*\' does not have a destination_id"):format(v_u_49, p_u_41)))
                            local v92 = p_u_42.parts_missing
                            table.insert(v92, p_u_41)
                            return
                        end
                    else
                        print((("Interior \'%*\' door \'%*\' does not have Configuration in its WorkingParts"):format(v_u_49, p_u_41)))
                        local v93 = p_u_42.parts_missing
                        table.insert(v93, p_u_41)
                        return
                    end
                else
                    print((("Interior \'%*\' door \'%*\' does not have TouchToEnter"):format(v_u_49, p_u_41)))
                    local v94 = p_u_42.parts_missing
                    table.insert(v94, p_u_41)
                    return
                end
            else
                print((("Interior \'%*\' door \'%*\' does not have WorkingParts"):format(v_u_49, p_u_41)))
                local v95 = p_u_42.parts_missing
                table.insert(v95, p_u_41)
                return
            end
        else
            local v96 = p_u_42.interior_wrong
            table.insert(v96, p_u_41)
            return
        end
    else
        local v97 = p_u_42.interior_wrong
        table.insert(v97, p_u_41)
        return
    end
end
local function v_u_116(p99)
    local v100 = v_u_5("UIManager")
    local v101 = v_u_5("InteriorsM")
    v100.apps.DoorTestApp:set_interior_label(p99)
    local v102 = v_u_6.get_full_interior_name(p99)
    if v_u_18 then
        coroutine.yield()
        local v103 = v_u_3.LocalPlayer.Character
        if v103 then
            local v104 = v103.Humanoid
            v104.WalkSpeed = 16
            v104:MoveTo(v103.HumanoidRootPart.Position)
        end
    end
    print((("Trying interior %*"):format(v102)))
    v101.enter_smooth(p99, "MainDoor", {
        ["studs_ahead_of_door"] = 10,
        ["fade_color"] = Color3.fromRGB(100, 100, 100),
        ["skip_send_passive_door_request"] = true
    })
    local v105 = {
        ["interior_wrong"] = {},
        ["falling_out_of"] = {},
        ["parts_missing"] = {},
        ["loading_wrong"] = {},
        ["door_locked"] = {},
        ["transition_failed"] = {}
    }
    local v106 = v_u_4:FindFirstChild(v102)
    if v106 then
        local v107 = v106:FindFirstChild("Doors")
        if v107 then
            local v109 = v_u_7.Array.map(v107:GetChildren(), function(p108)
                return p108.Name
            end)
            for v110, v111 in v109 do
                if not (v_u_10[p99] and v_u_10[p99][v111]) then
                    v_u_98(p99, v111, v105)
                    if not v_u_21(v105) then
                        v100.apps.DoorTestApp:update_checklist_line(p99, "failed")
                    end
                    if v_u_18 then
                        coroutine.yield()
                        local v112 = v_u_3.LocalPlayer.Character
                        if v112 then
                            local v113 = v112.Humanoid
                            v113.WalkSpeed = 16
                            v113:MoveTo(v112.HumanoidRootPart.Position)
                        end
                    end
                    task.wait(2)
                    if v110 ~= #v109 then
                        if v_u_18 then
                            coroutine.yield()
                            local v114 = v_u_3.LocalPlayer.Character
                            if v114 then
                                local v115 = v114.Humanoid
                                v115.WalkSpeed = 16
                                v115:MoveTo(v114.HumanoidRootPart.Position)
                            end
                        end
                        v101.enter_smooth(p99, v111, {
                            ["studs_ahead_of_door"] = 10,
                            ["fade_color"] = Color3.fromRGB(200, 100, 200),
                            ["skip_send_passive_door_request"] = true
                        })
                    end
                end
            end
            return v105
        else
            print((("The interior \'%*\' does not have a Doors folder"):format(v102)))
            v100.apps.DoorTestApp:update_checklist_line(p99, "failed")
            return v105
        end
    else
        print((("The interior \'%*\' failed to load properly!"):format(v102)))
        v100.apps.DoorTestApp:update_checklist_line(p99, "failed")
        return v105
    end
end
local v136 = {
    ["Name"] = "testdoors",
    ["Aliases"] = {},
    ["Description"] = "Cycles through all interiors (or the one provided) and tests the doors to ensure basic functionality.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "interior",
            ["Name"] = "Location",
            ["Description"] = "The specific location to test",
            ["Optional"] = true
        }
    },
    ["ClientRun"] = function(p_u_117, p_u_118)
        local v_u_119 = v_u_5("UIManager")
        v_u_119.apps.DoorTestApp:clear_checklist()
        local v_u_120 = {}
        local v_u_121 = {}
        local v_u_122 = false
        local v_u_123 = coroutine.running()
        local v_u_131 = task.spawn(function()
            local v124
            if p_u_118 then
                v124 = { p_u_118 }
            else
                v124 = v_u_7.Array.filter(p_u_117.Cmdr.Registry:GetStore("StaticData").interiors, function(p125)
                    return v_u_9[p125] == nil
                end)
            end
            v_u_119.apps.DoorTestApp:set_interior_label(v124[1])
            v_u_119.apps.DoorTestApp:set_door_label("MainDoor")
            v_u_119.apps.DoorTestApp:show()
            for _, v126 in v124 do
                v_u_119.apps.DoorTestApp:add_checklist_line(v126)
            end
            for _, v127 in v124 do
                if not v_u_121[v127] then
                    v_u_121[v127] = true
                    local v128 = v_u_116(v127)
                    if v_u_18 then
                        coroutine.yield()
                        local v129 = v_u_3.LocalPlayer.Character
                        if v129 then
                            local v130 = v129.Humanoid
                            v130.WalkSpeed = 16
                            v130:MoveTo(v129.HumanoidRootPart.Position)
                        end
                    end
                    v_u_120[v127] = v128
                    if v_u_21(v128) then
                        v_u_119.apps.DoorTestApp:update_checklist_line(v127, "checked")
                    else
                        v_u_122 = true
                    end
                end
            end
            if v_u_122 then
                v_u_119.apps.DialogApp:dialog({
                    ["dialog_type"] = "ScrollingDialog",
                    ["labels"] = v_u_39(v_u_120)
                })
            else
                v_u_119.apps.DialogApp:dialog({
                    ["text"] = "Door tests finished, and everything worked as expected!"
                })
            end
            task.spawn(v_u_123)
        end)
        local v132 = v_u_119.apps.DoorTestApp:register_pause_button_callback(function()
            if v_u_18 then
                v_u_18 = false
                task.spawn(v_u_131)
            else
                v_u_18 = true
            end
        end)
        local v135 = v_u_119.apps.DoorTestApp:register_stop_button_callback(function()
            while v_u_119.apps.TransitionsApp:current_transparency() ~= 1 do
                v_u_2.Heartbeat:Wait()
            end
            coroutine.close(v_u_131)
            local v133 = v_u_3.LocalPlayer.Character
            if v133 then
                local v134 = v133.Humanoid
                v134.WalkSpeed = 16
                v134:MoveTo(v133.HumanoidRootPart.Position)
            end
            task.spawn(v_u_123)
        end)
        coroutine.yield()
        v132:Disconnect()
        v135:Disconnect()
        v_u_18 = false
        v_u_119.apps.DoorTestApp:hide()
        return "Finished testing doors. See developer console for detailed information."
    end
}
return v136