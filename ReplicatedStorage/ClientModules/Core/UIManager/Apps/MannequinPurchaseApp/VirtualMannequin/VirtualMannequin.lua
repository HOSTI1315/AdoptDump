--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MannequinPurchaseApp.VirtualMannequin (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Class")
local v_u_2 = game:GetService("RunService")
local v_u_3 = Instance.new("Camera")
v_u_3.Name = "PreRenderCamera"
v_u_3.CFrame = CFrame.fromMatrix(Vector3.new(0, 0, 0), Vector3.new(1, 0, 0), Vector3.new(0, 0, -1))
v_u_3.Parent = workspace
local v_u_4 = Color3.fromRGB(178, 186, 220)
local v_u_5 = {
    ["Eyes"] = Color3.fromRGB(45, 45, 45),
    ["Head"] = Color3.fromRGB(221, 193, 128),
    ["LeftEar"] = Color3.fromRGB(221, 193, 128),
    ["LeftFoot"] = Color3.fromRGB(221, 193, 128),
    ["LeftHand"] = Color3.fromRGB(221, 193, 128),
    ["Nose"] = Color3.fromRGB(45, 45, 45),
    ["RightEar"] = Color3.fromRGB(221, 193, 128),
    ["RightFoot"] = Color3.fromRGB(221, 193, 128),
    ["RightHand"] = Color3.fromRGB(221, 193, 128),
    ["Tail"] = Color3.fromRGB(221, 193, 128),
    ["Torso"] = Color3.fromRGB(221, 193, 128),
    ["Tounge"] = Color3.fromRGB(165, 96, 96)
}
local v6 = v1("VirualMannequin")
function v6.__init(p_u_7, p8, p9)
    p_u_7.frame = p8
    p_u_7.mannequin = p9
    p_u_7.virtual_mannequin_model = nil
    p_u_7.is_pre_rendering = false
    p_u_7.active = false
    p_u_7.skip_recolor = p9.skip_recolor or false
    p_u_7:_refresh_virtual_mannequin()
    p_u_7.changed_conn = p9:bind_to_content_changed(function()
        p_u_7:_refresh_virtual_mannequin()
    end)
    p_u_7.step_conn = v_u_2.RenderStepped:Connect(function(_)
        p_u_7:_step()
    end)
    p_u_7.animate_step_conn = v_u_2.Stepped:Connect(function()
        p_u_7:_animate_step()
    end)
end
function v6._refresh_virtual_mannequin(p10)
    if p10.virtual_mannequin_model then
        p10.virtual_mannequin_model:Destroy()
    end
    local v11, v12, v13 = p10.mannequin:build_virtual_mannequin_model()
    v11.Parent = p10.frame
    p10.virtual_mannequin_model = v11
    p10.real_to_virtual_part_map = v12
    p10.real_to_virtual_bone_map = v13
    p10:_step()
end
function v6._animate_step(p14)
    for v15, v16 in pairs(p14.real_to_virtual_bone_map) do
        v16.Transform = v15.Transform
    end
end
function v6._step(p17)
    local v18 = p17.real_to_virtual_part_map
    local v19 = p17.is_pre_rendering and 0 or (p17.active and 0 or 1)
    p17.frame.ImageTransparency = v19
    if p17.is_pre_rendering then
        p17.frame.CurrentCamera = v_u_3
    else
        p17.frame.CurrentCamera = workspace.CurrentCamera
    end
    if v19 ~= 1 then
        for v20, v21 in pairs(v18) do
            v21.CFrame = v20.CFrame
            if not p17.skip_recolor then
                local v22 = v_u_5[v21.Name]
                if v22 then
                    if p17.active then
                        v21.Color = v22
                    else
                        v21.Color = v_u_4
                    end
                end
            end
        end
    end
end
function v6.set_active(p23, p24)
    p23.active = p24
    p23:_step()
end
function v6.start_pre_render(p25)
    p25.is_pre_rendering = true
end
function v6.stop_pre_render(p26)
    p26.is_pre_rendering = false
end
function v6.destroy(p27)
    p27.virtual_mannequin_model:Destroy()
    p27.step_conn:Disconnect()
    p27.animate_step_conn:Disconnect()
    p27.frame.Transparency = 1
    p27.changed_conn:Disconnect()
end
return v6