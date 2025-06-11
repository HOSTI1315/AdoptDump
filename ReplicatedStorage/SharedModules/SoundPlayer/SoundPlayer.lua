--// ReplicatedStorage.SharedModules.SoundPlayer (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = game.ReplicatedStorage:WaitForChild("Sounds")
local v_u_3 = v1("Maid")
local v4 = v1("Class")
local v_u_5 = game:GetService("SoundService")
local v6 = v4("SoundPlayer")
function v6.__init(p_u_7, p8, p9)
    p_u_7.children = {}
    p_u_7.maid = v_u_3.new()
    p_u_7.folder = p8 or nil
    p_u_7.sound_group = v_u_5:FindFirstChild(p9 or "SoundEffects")
    p_u_7.sound_map = {}
    if p_u_7.folder then
        for _, v10 in pairs(p_u_7.folder:GetDescendants()) do
            if v10:IsA("Sound") then
                p_u_7:_add_sound(v10)
            end
        end
        p_u_7.maid.DescendantAdded = p_u_7.folder.DescendantAdded:Connect(function(p11)
            if p11:IsA("Sound") then
                p_u_7:_add_sound(p11)
            end
        end)
    end
end
function v6._add_sound(p12, p13)
    if p13:IsDescendantOf(p12.folder) and p13:IsA("Sound") then
        local v14 = { p13.Name }
        local v15 = p13.Parent
        while v15 ~= p12.folder do
            local v16 = v15.Name
            table.insert(v14, 1, v16)
            v15 = v15.Parent
        end
        local v17 = table.concat(v14, "/")
        p12.sound_map[v17] = p13
    end
end
function v6.get_name(p18)
    return p18.folder.Name
end
function v6.get_source_sound(p19, p20)
    return p19.sound_map[p20]
end
function v6.get_new_sound(p21, p22, p23, p24)
    local v25 = p23 or workspace
    local v26 = p24 or {}
    local v27 = typeof(v25) == "Instance"
    assert(v27, "Invalid parent")
    local v28 = nil
    local v29 = p21:get_source_sound(p22)
    if v29 then
        v28 = v29:Clone()
        local v30 = v29.Volume
        local v31
        if v26.volume_scale then
            local v32 = v26.volume_scale
            v31 = math.clamp(v32, 0, 2) or 1
        else
            v31 = 1
        end
        v28.Volume = v30 * v31
    else
        local v33 = p22:match("%d+$") or ""
        local v34 = tonumber(v33)
        if v34 then
            v28 = Instance.new("Sound")
            v28.SoundId = "rbxassetid://" .. v34
            local v35 = v28.Volume
            local v36
            if v26.volume_scale then
                local v37 = v26.volume_scale
                v36 = math.clamp(v37, 0, 2) or 1
            else
                v36 = 1
            end
            v28.Volume = v35 * v36
        end
    end
    if not v28 then
        warn(("[SoundPlayer] - Unable to find sound \'%s\'"):format(p22))
        return nil
    end
    v28.SoundGroup = p21.sound_group
    v28:SetAttribute("SoundGroup", p21.sound_group.Name)
    v28.Parent = v25
    return v28
end
function v6.play(p38, p39, p40, p41)
    local v_u_42 = p38:get_new_sound(p39, p40, p41)
    if not v_u_42 then
        return false
    end
    v_u_42.Looped = false
    v_u_42:Play()
    v_u_42.Ended:Connect(function()
        v_u_42:Destroy()
    end)
    v_u_42.Stopped:Connect(function()
        v_u_42:Destroy()
    end)
    return v_u_42
end
function v6.loop(p43, p44, p45)
    local v_u_46 = p43:get_new_sound(p44, p45)
    if not v_u_46 then
        return false
    end
    v_u_46.Looped = true
    v_u_46:Play()
    v_u_46.Stopped:Connect(function()
        v_u_46:Destroy()
    end)
    return v_u_46
end
function v6.destroy(p47)
    p47.maid:DoCleaning()
end
return {
    ["FX"] = v6.new(v2:WaitForChild("FX")),
    ["Interface"] = v6.new(v2:WaitForChild("Interface")),
    ["Music"] = v6.new(nil, "Music"),
    ["Pets"] = v6.new(v2:WaitForChild("Pets")),
    ["new"] = v6.new
}