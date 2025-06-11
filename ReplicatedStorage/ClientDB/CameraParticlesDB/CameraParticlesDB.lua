--// ReplicatedStorage.ClientDB.CameraParticlesDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Promise")
local v3 = v1("package:t")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = game:GetService("RunService")
local v6 = {}
local v_u_7 = v3.strictInterface({
    ["effect_part_template"] = v3.instanceIsA("BasePart"),
    ["fall_speed"] = v3.numberPositive,
    ["not_locked_to_part"] = v3.optional(v3.boolean),
    ["y_offset_override"] = v3.optional(v3.number)
})
local function v31(p8)
    local v9 = v_u_7
    assert(v9(p8))
    local v_u_10 = p8.effect_part_template
    local v_u_11 = p8.fall_speed
    local v_u_12 = p8.not_locked_to_part
    local v_u_13 = p8.y_offset_override
    return {
        ["create_initial_state"] = function()
            return {
                ["effect_part"] = v_u_10:Clone(),
                ["effect_promise"] = v_u_2.resolve(),
                ["active"] = false
            }
        end,
        ["activate"] = function(p_u_14)
            if not p_u_14.active then
                p_u_14.active = true
                p_u_14.effect_promise:cancel()
                for _, v15 in ipairs(p_u_14.effect_part:GetChildren()) do
                    v15.Enabled = true
                end
                p_u_14.effect_promise = v_u_2.new(function(_, _, p16)
                    local v_u_17 = p_u_14.effect_part
                    v_u_17.Parent = workspace
                    local v_u_18 = nil
                    local v_u_28 = v_u_5.RenderStepped:Connect(function(p19)
                        local v20 = false
                        local v21 = workspace.CurrentCamera.CFrame.Position
                        if not v_u_12 and v_u_18 then
                            local v22 = v21.Y
                            local v23 = v_u_18.Y - v22
                            v20 = math.max(v23, 0) / p19 > v_u_11 / 2 and true or v20
                        end
                        for _, v24 in ipairs(v_u_17:GetChildren()) do
                            v24.LockedToPart = v20
                        end
                        v_u_18 = v21
                        local v25 = workspace.CurrentCamera.CFrame.lookVector * 30
                        if v25.Y < 0 then
                            local v26 = v25.Y
                            v25 = v25 - Vector3.new(0, v26, 0)
                        end
                        local v27 = v_u_13 or 25
                        v_u_17.CFrame = v_u_17.CFrame - v_u_17.Position + v21 + Vector3.new(0, v27, 0) + v25
                    end)
                    p16(function()
                        v_u_28:Disconnect()
                    end)
                end)
            end
        end,
        ["deactivate"] = function(p_u_29)
            if p_u_29.active then
                p_u_29.active = false
                for _, v30 in ipairs(p_u_29.effect_part:GetChildren()) do
                    v30.Enabled = false
                end
                p_u_29.effect_promise:cancel()
                p_u_29.effect_promise = v_u_2.delay(5):andThen(function()
                    p_u_29.effect_part.Parent = nil
                end)
            end
        end
    }
end
v6.WinterSnow = v31({
    ["fall_speed"] = 20,
    ["effect_part_template"] = v4.Resources.Seasonal.Snow
})
v6.FallLeaves = v31({
    ["fall_speed"] = 20,
    ["effect_part_template"] = v4.Resources.Seasonal.Leaves
})
v6.RainDrops = v31({
    ["fall_speed"] = 20,
    ["effect_part_template"] = v4.Resources.Seasonal.Rain
})
v6.Garden2024RainParticles = v31({
    ["fall_speed"] = 20,
    ["effect_part_template"] = v4.Resources.Garden2024HintResources.Garden2024RainParticles
})
return v6