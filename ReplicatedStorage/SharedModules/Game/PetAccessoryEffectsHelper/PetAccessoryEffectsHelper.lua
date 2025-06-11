--// ReplicatedStorage.SharedModules.Game.PetAccessoryEffectsHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("AnimationManager")
local function v_u_5(p2)
    local v3 = p2:FindFirstChildWhichIsA("AnimationController")
    if v3 == nil then
        v3 = Instance.new("AnimationController")
        v3.Parent = p2
    end
    local v4 = v3:FindFirstChildWhichIsA("Animator")
    if v4 == nil then
        v4 = Instance.new("Animator")
        v4.Parent = v3
    end
    return v4
end
local function v_u_13(p6, p7, p8, p9)
    local v10 = { p6 }
    while #v10 > 0 do
        local v11 = table.remove(v10)
        for _, v12 in pairs(v11:GetChildren()) do
            if v12.Name == p7 and v12:IsA(p8) then
                return v12
            end
            if p9 then
                table.insert(v10, v12)
            end
        end
    end
end
local v_u_45 = {
    ["play_animation"] = {
        ["default"] = function(_, p14, _, p15)
            local v_u_16 = p15.anim_name
            local v17 = p15.anim_speed
            local v_u_18 = p14:FindFirstChildWhichIsA("Model")
            local v_u_19 = v_u_5(v_u_18):LoadAnimation((v_u_1.get_track(v_u_16)))
            v_u_19:Play(0, 1, v17)
            local v_u_20 = nil
            local v_u_21 = {}
            v_u_20 = v_u_19:GetMarkerReachedSignal("EmitParticle"):Connect(function(p22)
                if not v_u_21[p22] then
                    local v23 = {}
                    if p22 == "" then
                        warn("EmitParticle marker for animation \'" .. v_u_16 .. "\' has no particle names. Disconnecting event.")
                        v_u_20:Disconnect()
                        return
                    end
                    for _, v24 in string.split(p22, ",") do
                        local v25 = v_u_18:FindFirstChild(v24, true)
                        if not v25 then
                            warn("Particle \'" .. v24 .. "\' emitted by animation \'" .. v_u_16 .. "\' not found. Disconnecting event.")
                            v_u_20:Disconnect()
                            return
                        end
                        if v25 and not v25:IsA("ParticleEmitter") then
                            warn("Particle \'" .. v24 .. "\' emitted by animation \'" .. v_u_16 .. "\' is not a ParticleEmitter. Disconnecting event.")
                            v_u_20:Disconnect()
                            return
                        end
                        local v26 = v25:GetAttribute("EmitCount")
                        if not v26 then
                            warn("Particle \'" .. v24 .. "\' emitted by animation \'" .. v_u_16 .. "\' does not have an EmitCount attribute. Disconnecting event.")
                            v_u_20:Disconnect()
                            return
                        end
                        table.insert(v23, {
                            ["particle"] = v25,
                            ["emit_count"] = v26
                        })
                    end
                    v_u_21[p22] = v23
                end
                for _, v27 in v_u_21[p22] do
                    v27.particle:Emit(v27.emit_count)
                end
            end)
            return function()
                v_u_19:Stop(0)
                v_u_19:Destroy()
            end
        end,
        ["earrings"] = function(_, _, _, _)
            error("Not implemented.")
        end,
        ["shoes"] = function(_, p28, _, p29)
            local v30 = p29.anim_name
            local v31 = p29.anim_speed
            local v_u_32 = {}
            for _, v33 in ipairs(p28:GetChildren()) do
                local v34 = v_u_5(v33):LoadAnimation((v_u_1.get_track(v30)))
                v34:Play(0, 1, v31)
                table.insert(v_u_32, v34)
            end
            return function()
                for _, v35 in ipairs(v_u_32) do
                    v35:Stop(0)
                    v35:Destroy()
                end
            end
        end
    },
    ["scale_bone"] = {
        ["default"] = function(p36, p37, _, p38)
            local v39 = v_u_13(p37, p38.bone_name, "Bone", true)
            local v40 = v_u_13(p36, p38.attachment_name, "Attachment", true)
            if v39 and v40 then
                local v41 = p37:GetAttribute("AccessoryNetScale") or 1
                local v42 = v39.Parent:IsA("Bone") and v39.Parent.WorldCFrame or v39.Parent.CFrame
                local v43 = CFrame.new(p38.scaled_offset.Position * v41) * (p38.scaled_offset - p38.scaled_offset.Position)
                local v44 = v42:ToObjectSpace(v40.WorldCFrame * v43)
                if not p38.validate or p38.validate(v39.CFrame, v44) then
                    v39.CFrame = v44
                end
            else
                return
            end
        end,
        ["earrings"] = function(_, _, _, _)
            error("Not implemented.")
        end,
        ["shoes"] = function(_, _, _, _)
            error("Not implemented.")
        end
    }
}
return {
    ["apply_effect"] = function(p46, p47, p48, p49)
        local v50 = p48.equip_type or "default"
        local v51 = p49.effect_type
        local v52 = p49.options
        return v_u_45[v51][v50](p46, p47, p48, v52)
    end
}