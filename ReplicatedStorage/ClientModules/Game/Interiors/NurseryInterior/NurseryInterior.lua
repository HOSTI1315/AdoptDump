--// ReplicatedStorage.ClientModules.Game.Interiors.NurseryInterior (ModuleScript)

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Fsys).load
local v_u_4 = v_u_3("InteractionsEngine")
local v_u_5 = v_u_3("ClientData")
local v_u_6 = v_u_3("InventoryDB")
local v_u_7 = v_u_3("EggEvent")
local v_u_8 = v_u_3("ShopM")
local v_u_9 = v_u_3("DownloadClient")
local v_u_10 = v_u_3("Maid")
local v_u_11 = v_u_3("WeatherClient")
local v_u_12 = v_u_3("package:Promise")
local v_u_13 = require(game.ReplicatedStorage.new.modules.RaycastHelper)
local v_u_14 = v_u_3("TweenPromise")
local v_u_15 = game:GetService("RunService")
TAU = 6.283185307179586
local function v_u_98(p16, p17)
    local v18 = p16.MoonSetDressing.Building
    local v19 = v18.PrimaryPart
    for _, v20 in v18:GetDescendants() do
        if v20:IsA("BasePart") and v20 ~= v19 then
            v20.Anchored = v20 == v19
            local v21 = Instance.new("WeldConstraint")
            v21.Name = v20.Name
            v21.Part0 = v20
            v21.Part1 = v19
            v21.Parent = v19
        end
    end
    p17:GiveTask(v_u_14.new(v19, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), {
        ["CFrame"] = v19.CFrame + Vector3.new(0, 5, 0)
    }))
    local v_u_22 = p16.MoonSetDressing.Asteroids
    local v_u_23 = {}
    local v_u_24 = {}
    for _, v25 in v_u_22:GetChildren() do
        local v26 = v25.Center
        local v27 = v25.Asteroids:GetChildren()
        v26.Anchored = true
        v26.CanCollide = false
        v26.CanTouch = false
        v26.CanQuery = false
        local v28 = {
            ["center_part"] = v26
        }
        local v29 = v26:GetAttribute("speed") or 0
        v28.speed = math.rad(v29)
        v28.asteroids = {}
        for _, v30 in v27 do
            if v30:IsA("BasePart") then
                v30.Anchored = true
                v30.CollisionGroup = "terrain"
                v30:SetAttribute("OverrideCollidesWithCamera", true)
                local v31 = Instance.new("Part")
                v31.CanQuery = false
                v31.CanCollide = false
                v31.Anchored = false
                v31.Transparency = 1
                v31.Name = "AsteroidGoalPart"
                v31.CFrame = v30.CFrame
                v31.Parent = workspace
                local v32 = Instance.new("Weld")
                v32.Part0 = v26
                v32.Part1 = v31
                v32.C0 = v26.CFrame:inverse() * v31.CFrame
                v32.C1 = CFrame.new()
                v32.Parent = v26
                local v33 = v30:GetAttribute("tumble") or Vector3.new(0, 0, 0)
                local v34 = v28.asteroids
                local v35 = {
                    ["model"] = v30,
                    ["goal_part"] = v31
                }
                local v36 = v33.X
                local v37 = math.rad(v36)
                local v38 = v33.Y
                local v39 = math.rad(v38)
                local v40 = v33.Z
                local v41 = math.rad(v40)
                v35.tumble = Vector3.new(v37, v39, v41)
                v35.current_tumble = Vector3.new()
                table.insert(v34, v35)
            elseif v30:IsA("Model") then
                local v42 = v30.PrimaryPart
                local v43 = v42 ~= nil
                assert(v43, "asteroids that are Models must have a PrimaryPart")
                for _, v44 in v30:GetDescendants() do
                    if v44:IsA("BasePart") and v44 ~= v42 then
                        v44.Anchored = true
                        v44.CollisionGroup = "terrain"
                        v44:SetAttribute("OverrideCollidesWithCamera", true)
                        local v45 = Instance.new("Weld")
                        v45.Part0 = v44
                        v45.Part1 = v42
                        v45.C0 = v42.CFrame:inverse() * v44.CFrame
                        v45.C1 = CFrame.new()
                        v45.Parent = v42
                    end
                end
                local v46 = Instance.new("Part")
                v46.CanQuery = false
                v46.CanCollide = false
                v46.Anchored = false
                v46.Transparency = 1
                v46.Name = "AsteroidGoalPart"
                v46.CFrame = v42.CFrame
                v46.Parent = workspace
                local v47 = Instance.new("Weld")
                v47.Part0 = v26
                v47.Part1 = v46
                v47.C0 = v26.CFrame:inverse() * v46.CFrame
                v47.C1 = CFrame.new()
                v47.Parent = v26
                local v48 = v42:GetAttribute("tumble") or Vector3.new(0, 0, 0)
                local v49 = v28.asteroids
                local v50 = {
                    ["model"] = v30,
                    ["goal_part"] = v46
                }
                local v51 = v48.X
                local v52 = math.rad(v51)
                local v53 = v48.Y
                local v54 = math.rad(v53)
                local v55 = v48.Z
                local v56 = math.rad(v55)
                v50.tumble = Vector3.new(v52, v54, v56)
                v50.current_tumble = Vector3.new()
                table.insert(v49, v50)
            else
                error("asteroids must be Models or Parts")
            end
        end
        v_u_23[v26] = v26.CFrame
        table.insert(v_u_24, v28)
    end
    local v_u_57 = v_u_22:GetDescendants()
    local v_u_58 = p16:GetDescendants()
    local v_u_59 = v_u_1.LocalPlayer.Character.Humanoid
    local v_u_60 = v_u_59.RootPart
    local v_u_61 = nil
    local v_u_62 = nil
    local v_u_63 = nil
    local v_u_64 = Vector3.new(0, 0, 0)
    local v_u_65 = Vector3.new(1, 0, 1)
    local v_u_66 = 0
    p17:GiveTask(v_u_15.PreSimulation:Connect(function(p67)
        local v68 = v_u_59.HipHeight + v_u_60.Size.Y / 2 + 1
        local v69 = v_u_13.cast_ray
        local v70 = {
            ["origin"] = v_u_60.Position
        }
        local v71 = v_u_60.CFrame
        local v72 = -v68
        v70.direction = v71:VectorToWorldSpace((Vector3.new(0, v72, 0)))
        v70.filter_type = Enum.RaycastFilterType.Include
        v70.instances = v_u_57
        local v73 = v69(v70)
        local v74 = v_u_13.cast_ray
        local v75 = {
            ["origin"] = v_u_60.Position
        }
        local v76 = v_u_60.CFrame
        local v77 = -v68
        v75.direction = v76:VectorToWorldSpace((Vector3.new(0, v77, 0)))
        v75.filter_type = Enum.RaycastFilterType.Include
        v75.instances = v_u_58
        local v78 = v74(v75)
        if v78 ~= nil then
            v_u_62 = v78.Instance
        end
        local v79
        if v_u_66 == 0 then
            v79 = workspace:GetServerTimeNow()
        else
            v79 = nil
        end
        for _, v80 in v_u_24 do
            local v81 = v80.center_part
            local v82 = v80.speed
            if v79 then
                v81:PivotTo(v_u_23[v81] * CFrame.Angles(0, v79 * v80.speed % TAU, 0))
            else
                v81:PivotTo(v81.CFrame * CFrame.Angles(0, v82 * p67, 0))
            end
            for _, v83 in v80.asteroids do
                if v79 then
                    local v84 = v79 * v83.tumble.X % TAU
                    local v85 = v79 * v83.tumble.Y % TAU
                    local v86 = v79 * v83.tumble.Z % TAU
                    v83.current_tumble = Vector3.new(v84, v85, v86)
                else
                    local v87 = v83.current_tumble
                    local v88 = v83.tumble.X
                    local v89 = v83.tumble.Y
                    local v90 = v83.tumble.Z
                    v83.current_tumble = v87 + Vector3.new(v88, v89, v90) * p67
                end
                v83.model:PivotTo(v83.goal_part.CFrame * CFrame.Angles(v83.current_tumble.X, v83.current_tumble.Y, v83.current_tumble.Z))
            end
        end
        if v73 == nil then
            v_u_61 = nil
            v_u_63 = nil
        else
            local v91 = v73.Instance
            if v_u_61 == v91 and v_u_63 ~= nil then
                local v92 = v91.CFrame
                v_u_64 = v92.Position - v_u_63.Position
                v91.AssemblyLinearVelocity = v_u_64 / p67
                local v93 = v92 * v_u_63:Inverse()
                v91.AssemblyAngularVelocity = Vector3.new(v93:ToEulerAnglesXYZ()) / p67
            end
            v_u_65 = Vector3.new(1, 0, 1)
            v_u_63 = v91.CFrame
            v_u_61 = v91
        end
        if v78 == nil and (v_u_62 ~= nil and v_u_62:IsDescendantOf(v_u_22)) then
            local v94 = v_u_59.MoveDirection
            local v95 = v_u_60
            local v96 = v_u_59.WalkSpeed * v94
            local v97 = v_u_60.AssemblyLinearVelocity.Y
            v95.AssemblyLinearVelocity = v96 + Vector3.new(0, v97, 0) + v_u_65 * v_u_64 / p67
            if v94 == Vector3.new(0, 0, 0) then
                v_u_65 = v_u_65 * Vector3.new(0.99, 0, 0.99)
            else
                v_u_65 = v_u_65 * Vector3.new(0.999, 0, 0.999)
            end
        else
            v_u_65 = Vector3.new(1, 0, 1)
        end
        v_u_66 = (v_u_66 + 1) % 120
    end))
end
local function v_u_106(p_u_99, p100)
    local v_u_101 = p100 or {}
    local v_u_102 = v_u_3("UIManager")
    local v_u_103 = v_u_3("DoorsM")
    return v_u_4:register({
        ["text"] = "Enter",
        ["part"] = p_u_99.WorkingParts.TouchToEnter,
        ["on_selected"] = function()
            if v_u_5.get_server(v_u_1.LocalPlayer, "is_vip") then
                local v104 = v_u_103.get_door(p_u_99)
                v104:open()
                wait(0.6)
                v104:enter()
            else
                if v_u_101.no_vip_destination_id and v_u_101.no_vip_door_id then
                    local v105 = v_u_103.get_door(p_u_99)
                    v105.can_enter = false
                    v105:open()
                    wait(0.6)
                    v105:enter({
                        ["override_destination_id"] = v_u_101.no_vip_destination_id,
                        ["override_door_id"] = v_u_101.no_vip_door_id
                    })
                end
                v_u_102.apps.DialogApp:dialog({
                    ["product_id"] = "vip",
                    ["dialog_type"] = "RobuxProductDialog"
                })
            end
        end
    })
end
local function v_u_111(p_u_107)
    return v_u_4:register({
        ["text"] = function()
            local v108 = v_u_7.get_gumball_machine_item()
            local v109 = v_u_6[v108.category][v108.id]
            return ("ui.buy_item_with_bucks_parenthesis [%s] [%d]"):format(v109.name, v109.cost)
        end,
        ["part"] = p_u_107.GumballInteractionPart,
        ["on_selected"] = function()
            local v110 = v_u_7.get_gumball_machine_item()
            v_u_8.buy_item(p_u_107.GumballInteractionPart, {
                ["category"] = v110.category,
                ["id"] = v110.id,
                ["purchase_confirmation"] = true
            })
        end
    })
end
local function v_u_122(p_u_112, _)
    return v_u_12.new(function(p113, _, p114)
        local v_u_115 = v_u_9.download("EggEventPreRelease", "GardenSetDressing"):Clone()
        local v_u_116 = v_u_9.download("EggEventPreRelease", "DisplayEggs"):Clone()
        local v_u_117 = v_u_9.download("EggEventPreRelease", "GumballSign"):Clone()
        local v_u_118 = v_u_9.download("GardenEggAudio", "StereoLoop"):Clone()
        v_u_115:SetPrimaryPartCFrame(p_u_112.EventDecorOrigin.CFrame)
        local v119 = v_u_115:WaitForChild("InTheWay")
        v119.Parent = p_u_112.InTheWay
        v119.Name = "EggEvent"
        v_u_115.Parent = p_u_112
        v_u_117:SetPrimaryPartCFrame(p_u_112.GumballSignOrigin.CFrame)
        v_u_117.Parent = p_u_112
        v_u_11.add_interior_lighting(10, "NurseryGarden", true)
        v_u_118.Parent = workspace
        v_u_118:Play()
        local v_u_120 = false
        local function v121()
            if not v_u_120 then
                v_u_120 = true
                if p_u_112.InTheWay:FindFirstChild("EggEvent") then
                    p_u_112.InTheWay.EggEvent:Destroy()
                end
                v_u_9.release("EggEventPreRelease", "NurserySetDressing")
                v_u_9.release("EggEventPreRelease", "DisplayEggs")
                v_u_9.release("EggEventPreRelease", "GumballSign")
                v_u_9.release("EggEventPreRelease", "Ambience")
                v_u_115:Destroy()
                v_u_116:Destroy()
                v_u_117:Destroy()
                v_u_11.remove_lighting(10, true)
                v_u_118:Destroy()
            end
        end
        if p114() then
            v121()
        else
            p113(v121)
        end
    end)
end
local function v_u_134(p_u_123, _)
    return v_u_12.new(function(p124, _, p125)
        local v_u_126 = v_u_9.download("EggEventPostRelease", "MoonSetDressing"):Clone()
        local v_u_127 = v_u_9.download("EggEventPostRelease", "DisplayEggs"):Clone()
        local v_u_128 = v_u_9.download("EggEventPostRelease", "GumballSign"):Clone()
        local v_u_129 = v_u_9.download("MoonEggAudio", "StereoLoop"):Clone()
        v_u_126:SetPrimaryPartCFrame(p_u_123.EventDecorOrigin.CFrame)
        local v130 = v_u_126:WaitForChild("InTheWay")
        v130.Parent = p_u_123.InTheWay
        v130.Name = "EggEvent"
        v_u_126.Parent = p_u_123
        v_u_127:SetPrimaryPartCFrame(p_u_123.GumballMachine.Root.CFrame)
        v_u_127.Parent = p_u_123
        v_u_128:SetPrimaryPartCFrame(p_u_123.GumballSignOrigin.CFrame)
        v_u_128.Parent = p_u_123
        v_u_11.add_interior_lighting(10, "NurseryMoon", true)
        v_u_129.Parent = workspace
        v_u_129:Play()
        local v_u_131 = v_u_10.new()
        v_u_98(p_u_123, v_u_131)
        local v_u_132 = false
        local function v133()
            if not v_u_132 then
                v_u_132 = true
                if p_u_123.InTheWay:FindFirstChild("EggEvent") then
                    p_u_123.InTheWay.EggEvent:Destroy()
                end
                v_u_9.release("EggEventPostRelease", "NurserySetDressing")
                v_u_9.release("EggEventPostRelease", "DisplayEggs")
                v_u_9.release("EggEventPostRelease", "GumballSign")
                v_u_9.release("EggEventPostRelease", "Ambience")
                v_u_126:Destroy()
                v_u_127:Destroy()
                v_u_128:Destroy()
                v_u_11.remove_lighting(10, true)
                v_u_129:Destroy()
                v_u_131:DoCleaning()
            end
        end
        if p125() then
            v133()
        else
            p124(v133)
        end
    end)
end
local function v_u_135(...)
    return v_u_122(...)
end
local function v_u_136(...)
    return v_u_134(...)
end
return {
    ["interactions"] = function(p137)
        return { v_u_111(p137), v_u_106(p137.Doors.VIPDoor), v_u_106(p137.Doors.VIPBalconyDoor, {
                ["no_vip_destination_id"] = "Nursery",
                ["no_vip_door_id"] = "VIPDoor"
            }) }
    end,
    ["render"] = function(p_u_138, p_u_139)
        local v_u_140 = v_u_3("UIManager")
        p_u_139.egg_event_maid = v_u_10.new()
        if v_u_7.has_release_happened() then
            local v141 = v_u_136(p_u_138, p_u_139):expect()
            p_u_139.egg_event_maid:GiveTask(v141)
        else
            local v_u_150 = v_u_135(p_u_138, p_u_139):andThen(function(p_u_142)
                return v_u_12.new(function(p_u_143, _, p144)
                    local v_u_145 = v_u_7.delay_until_release():andThen(function()
                        p_u_143(p_u_142)
                    end)
                    p144(function()
                        v_u_145:cancel()
                        p_u_142()
                    end)
                end)
            end):andThen(function(p146)
                local v147 = game.Players.LocalPlayer.Character.HumanoidRootPart
                v147.Anchored = true
                v_u_140.apps.TransitionsApp:transition({
                    ["length"] = 0.375,
                    ["end_transparency"] = 0
                })
                p146()
                local v_u_148 = v_u_136(p_u_138, p_u_139):expect()
                v_u_140.apps.TransitionsApp:transition({
                    ["length"] = 0.375,
                    ["end_transparency"] = 1
                })
                v147.Anchored = false
                return v_u_12.new(function(_, _, p149)
                    p149(v_u_148)
                end)
            end)
            p_u_139.egg_event_maid:GiveTask(function()
                v_u_150:cancel()
            end)
        end
    end,
    ["cleanup"] = function(_, p151)
        p151.egg_event_maid:Destroy()
        p151.egg_event_maid = nil
    end
}