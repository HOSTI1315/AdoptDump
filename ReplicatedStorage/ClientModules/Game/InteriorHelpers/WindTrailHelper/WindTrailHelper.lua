--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.WindTrailHelper (ModuleScript)

local v1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = v2("Maid")
local v_u_4 = v2("package:Promise")
local v_u_5 = game.ReplicatedStorage.Resources.Effects.WindTrail
local v_u_6 = v1.Heartbeat
local v_u_7 = {}
local v8 = {}
local function v_u_41(p_u_9, p_u_10)
    local v_u_11 = v_u_5:Clone()
    v_u_11.Parent = p_u_10.parent
    local v_u_12 = v_u_11.Trail
    local v13 = p_u_9.Size.Y
    local v14 = p_u_9.Size.Z
    local v_u_15 = p_u_10.random:NextNumber(p_u_10.wind_waves * -1, p_u_10.wind_waves)
    local v_u_16 = p_u_10.random:NextNumber(p_u_10.wind_speed - 2, p_u_10.wind_speed + 2)
    local v_u_17 = v13 / 2 * p_u_10.random:NextNumber(-1, 1)
    local v_u_18 = v14 / 2 * p_u_10.random:NextNumber(-1, 1)
    local v19 = CFrame.new(v14 / 10, v_u_17 / 2, v_u_18 / 2)
    local v_u_20 = (p_u_9.StartLoc.WorldCFrame * v19).Position
    local v_u_21 = (p_u_9.EndLoc.WorldCFrame * v19).Position
    local v_u_22 = (v_u_20 - v_u_21).Magnitude
    local v_u_23 = v_u_22 / p_u_10.wind_speed / 1.2
    v_u_12.Lifetime = v_u_23
    local v_u_24 = tick()
    return v_u_4.new(function(_, _, p25)
        for v26 = -0.3, 1.4, 1 / (v_u_22 * (p_u_9.Size.X / v_u_16)) do
            if p25() then
                return
            end
            local v27 = -1 + (v26 - 0) * 2 / 1
            v_u_11.Position = v_u_20:Lerp(v_u_21, v26)
            local v28 = v_u_11
            local v29 = v26 * v_u_15 * 90
            v28.Orientation = Vector3.new(v29, 0, 0)
            local v30 = v26 * v_u_15 * p_u_10.wave_size
            local v31 = math.sin(v30)
            local v32 = v_u_11
            v32.CFrame = v32.CFrame * CFrame.new(v_u_18 / 5 * v31, v_u_17 / 5 * v31, 0)
            local v33 = v_u_12
            local v34 = NumberSequence.new
            local v35 = {}
            local v36 = NumberSequenceKeypoint.new(0, 1)
            local v37 = NumberSequenceKeypoint.new
            local v38 = math.abs(v27)
            __set_list(v35, 1, {v36, v37(0.2, (math.clamp(v38, 0.5, 1))), NumberSequenceKeypoint.new(1, 1)})
            v33.Transparency = v34(v35)
            local v39 = (tick() - v_u_24) / v_u_23
            local v40 = math.clamp(v39, 0, 1)
            v_u_12.WidthScale = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(v40 / 2, 0.6),
                NumberSequenceKeypoint.new(v40, 0),
                NumberSequenceKeypoint.new(1, 0)
            })
            v_u_6:Wait()
            if v26 >= 1.3 then
                v_u_11:Destroy()
                return
            end
        end
    end)
end
local function v_u_54(p_u_42, p43)
    local v44 = v_u_7[p43]
    if not v44 then
        v44 = v_u_3.new()
        v_u_7[p43] = v44
    end
    local v45 = Instance.new("Folder")
    v45.Name = "Clones"
    v45.Parent = p_u_42
    v44:GiveTask(v45)
    local v_u_46 = {
        ["wind_amount"] = p_u_42:GetAttribute("WindAmount") or 5,
        ["wind_speed"] = p_u_42:GetAttribute("WindSpeed") or 30,
        ["wind_waves"] = p_u_42:GetAttribute("WindWaves") or 10,
        ["wave_size"] = p_u_42:GetAttribute("WaveSize") or 2,
        ["parent"] = v45,
        ["random"] = Random.new()
    }
    local v_u_53 = v_u_4.new(function(_, _, p47)
        local v_u_48 = {}
        p47(function()
            for _, v49 in v_u_48 do
                v49:cancel()
            end
        end)
        while not p47() do
            local v50 = v_u_41
            local v51 = p_u_42.WindBounds
            local v52 = v_u_46
            table.insert(v_u_48, v50(v51, v52))
            task.wait(v_u_46.random:NextNumber(3, 6) / v_u_46.wind_amount)
        end
    end)
    v44:GiveTask(function()
        v_u_53:cancel()
    end)
end
function v8.render(p55, p56)
    for _, v57 in p56 do
        v_u_54(v57, p55)
    end
end
function v8.cleanup(p58)
    if v_u_7[p58] then
        v_u_7[p58]:Destroy()
        v_u_7[p58] = nil
    end
end
return v8