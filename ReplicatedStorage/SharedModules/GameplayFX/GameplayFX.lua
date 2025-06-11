--// ReplicatedStorage.SharedModules.GameplayFX (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Promise")
local v_u_3 = v1("TweenPromise")
local v_u_4 = v1("package:Sift")
return {
    ["emit_poof"] = function(p5, p6, p7)
        local v8 = game.ReplicatedStorage.Resources.Particles.PridePinPoof:Clone()
        local v9 = Instance.new("Attachment")
        v8.Parent = v9
        v9.Position = p5
        v9.Parent = workspace.Terrain
        v8:Emit(p6 or 10)
        game:GetService("Debris"):AddItem(v9, p7 or 10)
    end,
    ["emit_particle"] = function(p10, p11, p12, p13)
        local v14 = p10:Clone()
        local v15 = Instance.new("Attachment")
        v14.Parent = v15
        v15.Position = p11
        v15.Parent = workspace.Terrain
        v14:Emit(p12 or 16)
        game:GetService("Debris"):AddItem(v15, p13 or 10)
    end,
    ["emit_particle_from_attachment"] = function(p16, p17, p18, p19)
        if p17 and p17:IsA("Attachment") then
            local v20 = p16:Clone()
            local v_u_21 = Instance.new("Attachment")
            v20.Parent = v_u_21
            v_u_21.Parent = p17
            v20:Emit(p18 or 16)
            local v22 = p19 or 10
            game:GetService("Debris"):AddItem(p17, v22)
            v_u_2.delay(v22):andThen(function()
                if v_u_21 then
                    v_u_21:Destroy()
                end
            end)
        end
    end,
    ["animate_billboard"] = function(p23, p24, p25)
        local v26 = p25 or {}
        if p23:FindFirstChild("BillboardGui") then
            local v_u_27 = p23:Clone()
            v_u_27.Position = p24
            if v26.transform_billboard then
                v26.transform_billboard(v_u_27)
            end
            v_u_27.Parent = workspace
            if v26 and v26.scale then
                local v28 = v_u_27.BillboardGui.Size
                v_u_27.BillboardGui.Size = UDim2.new(v28.X.Scale * v26.scale, v28.X.Offset * v26.scale, v28.Y.Scale * v26.scale, v28.Y.Offset * v26.scale)
            end
            local v29 = v26.time or 1
            local v30 = v29 - 0.5
            return v_u_2.all({ v_u_3.new(v_u_27, TweenInfo.new(v29), {
                    ["Position"] = p24 + Vector3.new(0, 3, 0)
                }), v_u_2.delay(v30):andThen(function()
                    local v32 = v_u_4.List.map(v_u_27.BillboardGui:GetDescendants(), function(p31)
                        if p31:IsA("TextLabel") then
                            return v_u_3.new(p31, TweenInfo.new(0.5), {
                                ["TextTransparency"] = 1
                            })
                        elseif p31:IsA("ImageLabel") then
                            return v_u_3.new(p31, TweenInfo.new(0.5), {
                                ["ImageTransparency"] = 1
                            })
                        elseif p31:IsA("UIStroke") then
                            return v_u_3.new(p31, TweenInfo.new(0.5), {
                                ["Transparency"] = 1
                            })
                        else
                            return nil
                        end
                    end)
                    return v_u_2.all(v32)
                end) }):andThen(function()
                v_u_27:Destroy()
            end)
        end
    end
}