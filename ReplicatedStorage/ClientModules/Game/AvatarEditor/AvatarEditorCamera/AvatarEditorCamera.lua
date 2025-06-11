--// ReplicatedStorage.ClientModules.Game.AvatarEditor.AvatarEditorCamera (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Spring")
local v_u_3 = v_u_1("ClientData")
local v_u_4 = v_u_1("Camera")
local v_u_5 = v_u_1("PetStabilizer")
local v_u_6 = v_u_1("InventoryDB")
local v_u_7 = v_u_1("new:PetRigs")
local v8 = v_u_1("Maid")
local v_u_9 = game:GetService("RunService")
local v_u_10 = game:GetService("TweenService")
local v_u_11 = {
    ["front_facing"] = CFrame.fromOrientation(-0.13091492652893097, -0.009843738871223858, 0),
    ["fit_to_screen"] = CFrame.fromOrientation(-0.28275859355926664, -0.9174131472878924, 0)
}
local v_u_12 = {
    ["front_facing"] = {
        ["default"] = 6.877,
        ["baby"] = 3.877
    },
    ["fit_to_screen"] = {
        ["default"] = 8.923,
        ["baby"] = 5.923
    }
}
local v_u_13 = {
    ["front_facing"] = {
        ["default"] = 0.6825,
        ["baby"] = 0.6395
    },
    ["fit_to_screen"] = {
        ["default"] = 0.556,
        ["baby"] = 0.585
    }
}
local v14 = {}
local v_u_15 = false
local v_u_16 = "front_facing"
local v_u_17 = CFrame.new()
local v_u_18 = {}
local v_u_19 = false
local v_u_20 = v8.new()
local v_u_21 = v2.new(300, 400, (Vector3.new()))
local v_u_22 = nil
local v_u_23 = nil
local v_u_24 = Vector3.new()
local function v_u_32(p25)
    local v26 = v_u_1("UIManager")
    local v27 = v26.apps.AvatarEditorApp.focus_switcher:get_current_character()
    if v26.apps.AvatarEditorApp.focus_switcher:get_focused_avatar_type() ~= "pet" then
        if v_u_22 then
            v_u_22:destroy()
        end
        v_u_22 = nil
        v_u_23 = v27
        if v27:FindFirstChild("HumanoidRootPart") == nil then
            return v_u_24
        end
        v_u_24 = v27.HumanoidRootPart.Position
        return v27.HumanoidRootPart.Position
    end
    local v28 = v26.apps.AvatarEditorApp.focus_switcher:get_focused_pet_wrapper()
    if v28 then
        v28 = v_u_6.pets[v28.pet_id]
    end
    if v28 then
        v28 = v28.stabilizer_part_override
    end
    local v29 = v27.HumanoidRootPart
    local v30 = v_u_7.get(v27.PetModel).get_part(v27.PetModel, v28 or "Torso")
    local v31 = v27.PetModel.AnimationController
    if v_u_23 ~= v27 or v_u_22 == nil then
        if v_u_22 then
            v_u_22:destroy()
        end
        v_u_22 = nil
        v_u_22 = v_u_5.new(v29, v30, v31)
        v_u_23 = v27
    end
    return v29.Position + v_u_22:get_stabilized_offset(p25)
end
local function v_u_45(p33)
    local v34 = v_u_1("UIManager")
    local v35 = v_u_32(p33)
    local v36 = workspace.CurrentCamera
    local v37 = v36.ViewportSize
    local v38 = v36.FieldOfView
    local v39 = v34.apps.AvatarEditorApp:is_focusing_player() and v_u_3.get("team") == "Babies" and "baby" or "default"
    local v40
    if v_u_16 == "front_facing" then
        v40 = Vector2.new(v37.X / 2, v37.Y * v_u_13.front_facing[v39])
    else
        local v41 = v37.X - v34.apps.AvatarEditorApp.catalog:get_size() + 80
        v40 = Vector2.new(v41 / 2, v37.Y * v_u_13.fit_to_screen[v39])
    end
    local v42 = v_u_12[v_u_16][v39]
    if v34.apps.AvatarEditorApp:is_focusing_pet() then
        local v43 = v34.apps.AvatarEditorApp.focus_switcher:get_focused_pet_wrapper()
        if v43 then
            v43 = v_u_6.pets[v43.pet_id]
        end
        if v43 and v43.avatar_editor_app_camera_distance_overrides then
            v42 = v43.avatar_editor_app_camera_distance_overrides[v_u_16] or v42
        end
    end
    local v44 = v_u_17 * v_u_11[v_u_16]
    return v_u_4.calculate_desired_camera_cframe(v44, v37, v38, v35, v40, v42)
end
local function v_u_54(p46)
    local v47 = workspace.CurrentCamera.CFrame
    local v48 = v47 - v47.p
    local v49 = v_u_45(p46)
    local v50 = v49.p
    local v51 = v49 - v49.p
    v_u_21:set_goal(v50)
    local v52 = v_u_21:update(p46)
    local v53 = v48:Lerp(v51, 1 - 0.050000000000000044 ^ (p46 * 1.4))
    workspace.CurrentCamera.CFrame = v53 + v52
end
local function v_u_56()
    v_u_21:reset(workspace.CurrentCamera.CFrame.p)
    v_u_9:BindToRenderStep("editor_camera", Enum.RenderPriority.Camera.Value - 1, function(p55)
        v_u_54(p55)
    end)
end
local function v_u_65(p_u_57, p_u_58)
    local v59 = v_u_1("PetEntityManager").get_pet_entity(p_u_57)
    if v59 then
        v59.custom_eyes.visible = true
        v59.default_eyes.visible = true
    end
    local v_u_60 = v_u_18[p_u_57]
    if v_u_60 then
        coroutine.wrap(function()
            local v61 = nil
            for v62, v63 in pairs(v_u_60) do
                local v64 = v62:IsA("ImageLabel") and "ImageTransparency" or "Transparency"
                v61 = v_u_10:Create(v62, TweenInfo.new(p_u_58, Enum.EasingStyle.Linear), {
                    [v64] = v63
                })
                v61:Play()
            end
            if v61 then
                if v61.Completed:Wait() == Enum.PlaybackState.Completed then
                    v_u_18[p_u_57] = nil
                    return
                end
            else
                v_u_18[p_u_57] = nil
            end
        end)()
    end
end
local function v_u_72(p66, p67)
    if v_u_19 then
        p67 = 0
        v_u_19 = false
    end
    local v68 = v_u_1("PetEntityManager").get_pet_entity(p66)
    if v68 then
        v68.custom_eyes.visible = false
        v68.default_eyes.visible = false
    end
    local v69 = v_u_18[p66] or {}
    for _, v70 in pairs(p66:GetDescendants()) do
        if v70:IsA("BasePart") or (v70:IsA("Decal") or v70:IsA("ImageLabel")) then
            local v71 = v70:IsA("ImageLabel") and "ImageTransparency" or "Transparency"
            if not v70:FindFirstAncestor("SpeechBubbleApp") then
                v69[v70] = v69[v70] or v70[v71]
                v_u_10:Create(v70, TweenInfo.new(p67, Enum.EasingStyle.Linear), {
                    [v71] = 1
                }):Play()
            end
        end
    end
    v_u_18[p66] = v69
end
local function v_u_79(p73)
    local v74 = {}
    if game.Players.LocalPlayer.Character then
        local v75 = game.Players.LocalPlayer.Character
        table.insert(v74, v75)
    end
    for _, v77 in v_u_3.get("pet_char_wrappers") do
        if v77 then
            local v77 = v77.char
        end
        if v77 then
            table.insert(v74, v77)
        end
    end
    for _, v78 in pairs(v74) do
        if p73 == nil then
            v_u_65(v78, 0)
        elseif v78 == p73 then
            v_u_65(v78, 0.5)
        else
            v_u_72(v78, 0.5)
        end
    end
    if p73 == nil then
        v_u_18 = {}
    end
end
local function v_u_83(p80, p81)
    if p80 then
        local v82 = game.Players.LocalPlayer:FindFirstChild("invisicam") or Instance.new("BoolValue")
        v82.Name = "invisicam"
        v82.Parent = game.Players.LocalPlayer
        v_u_79(p81.Parent)
    else
        if game.Players.LocalPlayer:FindFirstChild("invisicam") then
            game.Players.LocalPlayer.invisicam:Destroy()
        end
        v_u_79()
    end
end
function v14.capture_focus(p84)
    if not v_u_15 then
        v_u_15 = true
        v_u_56()
    end
    v_u_83(true, p84)
    workspace.CurrentCamera.CameraSubject = p84
    v_u_20:GiveTask(v_u_4.enter_scriptable_camera())
end
function v14.release_focus()
    if v_u_15 then
        v_u_15 = false
        v_u_19 = false
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        local v85 = game.Players.LocalPlayer.Character
        if v85 then
            v85 = v85:FindFirstChild("Humanoid")
        end
        if v85 then
            workspace.CurrentCamera.CameraSubject = v85
        end
        v_u_9:UnbindFromRenderStep("editor_camera")
        v_u_83(false)
        if v_u_22 then
            v_u_22:destroy()
        end
        v_u_22 = nil
        v_u_20:DoCleaning()
    end
end
function v14.set_screen_mode(p86, p87)
    v_u_16 = p86
    v_u_17 = p87 * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), 3.141592653589793)
end
function v14.queue_instant_update()
    v_u_19 = true
end
return v14