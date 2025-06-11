--// ReplicatedStorage.ClientModules.Game.MinigameHelpers.MinigameJoinZone (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v4 = v1("package:t")
local v_u_5 = v1("package:Promise")
local v_u_6 = game:GetService("Players")
local v_u_7 = v4.strictInterface({
    ["on_enter"] = v4.callback,
    ["on_exit"] = v4.callback,
    ["on_update"] = v4.callback
})
local v_u_8 = v2("MinigameJoinZone")
function v_u_8.__init(p_u_9, p10, p11)
    local v12 = v_u_7(p11)
    assert(v12, "Invalid enter and exit logic arguments passed.")
    p_u_9.maid = v_u_3.new()
    p_u_9.model = p10
    p_u_9.zone_cframe = p_u_9:_calculate_zone_cframe()
    p_u_9.visible = true
    p_u_9:_generate_visual()
    p_u_9.on_enter = p11.on_enter
    p_u_9.on_exit = p11.on_exit
    p_u_9.on_update = p11.on_update
    p_u_9.status = nil
    p_u_9.listener = v_u_5.new(function(_, _, p13)
        while not p13() do
            local v14 = p_u_9:is_client_character_inside()
            if p_u_9.status ~= v14 then
                if v14 then
                    p_u_9:on_enter()
                else
                    p_u_9:on_exit()
                end
                p_u_9.status = v14
            end
            p_u_9:on_update(p_u_9.status)
            task.wait(0.1)
        end
    end)
end
function v_u_8.generate_ring(p15, p16, p17)
    local v18 = p15.CFrame
    local v19 = p15.Size / 2
    local v20 = v19.y
    local v21 = v19.z
    local v22 = math.min(v20, v21)
    local v23 = 360 / p16
    local v24 = math.rad(v23)
    local v25 = {}
    local v26 = {}
    for v27 = -1, 1, 2 do
        for v28 = 0, p16 do
            local v29 = v28 * v24
            local v30 = v18 * CFrame.fromEulerAnglesXYZ(v29, 0, 0)
            local v31 = v19.x * v27
            local v32 = v30 * Vector3.new(v31, 0, v22)
            if v27 == -1 then
                v26[v28 + 1] = v32
            else
                v25[v28 + 1] = v32
            end
        end
    end
    for v33 = 1, p16 + 1 do
        local v34 = v33 % (p16 + 1) + 1
        local v35 = v24 * (v33 - 1) + v24 / 2
        local v36 = (v25[v33] + v25[v34]) / 2
        local v37 = (v26[v33] + v26[v34]) / 2
        local v38 = (v25[v33] - v25[v34]).Magnitude
        local v39 = Instance.new("Attachment")
        v39.Name = ("Top {%s, %s}"):format(v33, v34)
        v39.CFrame = CFrame.new(v18:PointToObjectSpace(v36)) * CFrame.fromEulerAnglesXYZ(v35, 0, 0)
        v39.Parent = p15
        local v40 = Instance.new("Attachment")
        v40.Name = ("Bottom {%s, %s}"):format(v33, v34)
        v40.CFrame = CFrame.new(v18:PointToObjectSpace(v37)) * CFrame.fromEulerAnglesXYZ(v35, 0, 0)
        v40.Parent = p15
        local v41 = p17:Clone()
        v41.Attachment0 = v40
        v41.Attachment1 = v39
        v41.Width0 = v38
        v41.Width1 = v38
        v41.Parent = p15
    end
end
function v_u_8._generate_visual(p42)
    local v43 = p42.model.Collider
    v43.Anchored = true
    v43.Transparency = 1
    v43.CanCollide = false
    local v44 = v43:Clone()
    v44.Name = "Ring"
    v44.CFrame = v43.CFrame * CFrame.new(-v43.Size.X / 2 + 1, 0, 0)
    local v45 = v43.Size.Y
    local v46 = v43.Size.Z
    v44.Size = Vector3.new(2, v45, v46)
    v44.Parent = p42.model
    local v47 = v43:Clone()
    v47.Name = "EmitterPart"
    v47.CFrame = v43.CFrame * CFrame.new(-v43.Size.X / 2 + 1, 0, 0)
    local v48 = v43.Size.Y
    local v49 = v43.Size.Z
    v47.Size = Vector3.new(2, v48, v49)
    v47.Parent = p42.model
    v_u_8.generate_ring(v44, 24, p42.model.Beam)
    p42.model.ParticleEmitter:Clone().Parent = v47
    p42.maid:GiveTask(v44)
    p42.maid:GiveTask(v47)
end
function v_u_8._calculate_zone_cframe(p50)
    local v51 = p50.model.Collider.CFrame
    local v52 = p50.model.Collider.Size
    return CFrame.fromMatrix(v51.Position, v51.XVector / v52.X, v51.YVector / v52.Y, v51.ZVector / v52.Z):Inverse()
end
function v_u_8.set_visible(p53, p54)
    for _, v55 in pairs(p53.model.Ring:GetChildren()) do
        if v55:IsA("Beam") then
            v55.Enabled = p54
        end
    end
    p53.model.EmitterPart.ParticleEmitter.Enabled = p54
    p53.model.Billboard.BillboardGui.Enabled = p54
end
function v_u_8.set_color(p56, p57)
    local v58 = ColorSequence.new(p57)
    for _, v59 in pairs(p56.model.Ring:GetChildren()) do
        if v59:IsA("Beam") then
            v59.Color = v58
        end
    end
end
function v_u_8.is_client_character_inside(p60)
    local v61 = v_u_6.LocalPlayer.Character
    if v61 then
        v61 = v61:FindFirstChild("HumanoidRootPart")
    end
    return v61 and p60:is_inside(v61.Position) or false
end
function v_u_8.is_inside(p62, p63)
    local v64 = p62.zone_cframe * p63
    local v65 = v64.Z * v64.Z + v64.Y * v64.Y
    local v66 = v64.x
    local v67
    if math.abs(v66) <= 0.5 then
        v67 = v65 <= 0.25
    else
        v67 = false
    end
    return v67
end
function v_u_8.reset_join_status(p68)
    p68.status = nil
end
function v_u_8.destroy(p69)
    p69.listener:cancel()
    p69.maid:DoCleaning()
end
return v_u_8