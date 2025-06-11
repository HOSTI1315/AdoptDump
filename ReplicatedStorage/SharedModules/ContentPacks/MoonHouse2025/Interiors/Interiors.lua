--// ReplicatedStorage.SharedModules.ContentPacks.MoonHouse2025.Interiors (ModuleScript)

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = require(v2:WaitForChild("Fsys")).load
local v_u_5 = v_u_4("Maid")
local v_u_6 = v_u_4("ClientData")
local v_u_7 = v_u_4("HouseClient")
local v_u_8 = v_u_4("new:RaycastHelper")
local v_u_9 = v_u_4("new:StreamingHelper")
local v_u_10 = false
local function v_u_36(p_u_11, p12)
    local v_u_13 = v_u_4("InteriorsM")
    local v_u_14 = v_u_5.new()
    p12.maid:GiveTask(v_u_14)
    local function v_u_34(p_u_15)
        v_u_9.await_matching_descendant_count(p_u_15)
        local v_u_16 = p_u_15.Humanoid
        local v_u_17 = v_u_16.RootPart
        local v_u_18 = v_u_17.AssemblyMass
        local v_u_19 = v_u_16.JumpPower
        if v_u_17:FindFirstChild("VectorForce") == nil then
            local v_u_20 = Instance.new("VectorForce")
            v_u_20.Attachment0 = v_u_17.RootAttachment
            local v21 = v_u_18 * 160
            v_u_20.Force = Vector3.new(0, v21, 0)
            v_u_20.ApplyAtCenterOfMass = true
            v_u_20.Parent = v_u_17
            v_u_14:GiveTask(v_u_20)
            v_u_14:GiveTask(function()
                v_u_16.JumpPower = v_u_19
            end)
            v_u_14:GiveTask(v_u_6.register_callback_plus_existing("house_interior", function(_, p22)
                if p22 ~= nil then
                    local v23 = p22.properties
                    if v23 then
                        v23 = p22.properties.low_gravity
                    end
                    v_u_10 = v23
                    v_u_16.JumpPower = v23 and 31 or v_u_19
                    p_u_11.SpecialParts.GravityButton.ButtonColor.Material = v23 and Enum.Material.Neon or Enum.Material.SmoothPlastic
                    p_u_11.SpecialParts.GravityButton.ButtonColor.Color = v23 and Color3.fromRGB(0, 211, 88) or Color3.fromRGB(165, 66, 66)
                end
            end))
            v_u_14:GiveTask(v_u_3.PreSimulation:Connect(function()
                local v24 = v_u_17.AssemblyMass
                if v24 ~= v_u_18 then
                    v_u_18 = v24
                    local v25 = v_u_20
                    local v26 = v24 * 160
                    v25.Force = Vector3.new(0, v26, 0)
                end
            end))
            v_u_14:GiveTask(v_u_3.PreSimulation:Connect(function()
                if v_u_10 then
                    local v27 = v_u_20
                    local v28 = v_u_18 * 160
                    v27.Force = Vector3.new(0, v28, 0)
                    local v29 = v_u_16.HipHeight + v_u_17.Size.Y / 2 + 1
                    local v30 = v_u_8.cast_ray
                    local v31 = {
                        ["origin"] = v_u_17.Position
                    }
                    local v32 = v_u_17.CFrame
                    local v33 = -v29
                    v31.direction = v32:VectorToWorldSpace((Vector3.new(0, v33, 0)))
                    v31.filter_type = Enum.RaycastFilterType.Exclude
                    v31.instances = { p_u_15 }
                    v31.respect_can_collide = true
                    if v30(v31) == nil then
                        v_u_20.Enabled = true
                    else
                        v_u_20.Enabled = false
                    end
                else
                    v_u_20.Force = Vector3.new(0, 0, 0)
                    return
                end
            end))
        end
    end
    p12.maid:GiveTask(v_u_1.LocalPlayer:GetPropertyChangedSignal("Character"):Connect(function()
        local v35 = v_u_1.LocalPlayer.Character
        if v35 ~= nil then
            v_u_14:DoCleaning()
            v_u_34(v35)
        end
    end))
    task.spawn(function()
        while v_u_13.entering do
            task.wait()
        end
        v_u_34(v_u_1.LocalPlayer.Character)
    end)
end
local v58 = {
    ["housing!moon_house"] = {
        ["interactions"] = function(p37, p_u_38)
            local v39 = v_u_4("InteriorsDB")
            local v_u_40 = v_u_4("ClientData")
            local v_u_41 = v_u_4("RouterClient")
            local v42 = v_u_4("InteractionsEngine")
            local v43 = v39.housing.interactions(p37)
            local v48 = {
                ["text"] = function()
                    local v44 = v_u_40.get("house_interior") or {}
                    local v45 = v44.properties
                    if v45 then
                        v45 = v44.properties.low_gravity
                    end
                    return v45 and "Turn On Gravity" or "Turn Off Gravity"
                end,
                ["on_selected"] = function()
                    local v46 = v_u_40.get("house_interior") or {}
                    local v47 = v46.properties
                    if v47 then
                        v47 = v46.properties.low_gravity
                    end
                    v_u_41.get("HousingAPI/UpdateMyHouseProperty"):FireServer(v46.house_id, "low_gravity", not v47)
                end,
                ["is_visible"] = function()
                    return p_u_38.house_owner == game.Players.LocalPlayer
                end,
                ["part"] = p37.SpecialParts.GravityButton.Button
            }
            table.insert(v43, v42:register(v48))
            return v43
        end,
        ["render"] = function(p_u_49, p50)
            local v51 = v_u_4("InteriorsDB")
            p50.maid = v_u_5.new()
            v51.housing.render(p_u_49, p50)
            v_u_36(p_u_49, p50)
            local v_u_52 = v_u_7.get_current_house_owner()
            p50.maid:GiveTask(v_u_6.register_callback_plus_existing("house_exteriors", function(_, p53)
                if p53 ~= nil then
                    for _, v54 in p53 do
                        if v54.player == v_u_52 then
                            p_u_49.SpecialParts.PortalColor.Color = v54.color
                            return
                        end
                    end
                end
            end))
        end,
        ["cleanup"] = function(p55, p56)
            local v57 = v_u_4("InteriorsDB")
            p56.maid:DoCleaning()
            v57.housing.cleanup(p55, p56)
        end
    }
}
return v58