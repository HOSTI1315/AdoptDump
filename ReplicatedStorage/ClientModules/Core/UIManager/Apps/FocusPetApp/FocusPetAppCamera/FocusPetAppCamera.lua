--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppCamera (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Camera")
local v_u_3 = v1("CharacterHider")
local v4 = v1("Class")
local v_u_5 = v1("Maid")
local v6 = v1("TweenHelper")
local v_u_7 = v1("TweenPromise")
local v_u_8 = v6.tween_info({
    ["time"] = 0.2,
    ["easing_style"] = Enum.EasingStyle.Quad,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v_u_9 = v4("FocusPetAppCamera", v1("UIBaseElement"))
function v_u_9.calculate_static_camera_values(p10)
    local v11 = v_u_9.new()
    v11.maid = v_u_5.new()
    v11.pet_model = p10
    local v12 = p10:FindFirstChild("HumanoidRootPart")
    v11.desired_cframe = v12.CFrame
    v11.focus_position = v12:FindFirstChild("PetFocusPosition")
    v11.focus_distance = v11.focus_position:FindFirstChild("PetFocusDistance")
    local v13 = v11:get_desired_cframe(v11.focus_position.WorldCFrame, v11.focus_distance.Value)
    return {
        ["rotation"] = v13 - v13.p,
        ["focus"] = v11.focus_position.WorldCFrame,
        ["distance"] = v11.focus_distance.Value
    }
end
function v_u_9.capture_focus(p14, p_u_15)
    p14.maid:DoCleaning()
    p14.pet_model = p_u_15.char:FindFirstChild("PetModel")
    local v16 = p_u_15.char:FindFirstChild("HumanoidRootPart")
    local v17 = v16.CFrame.Position
    local v18 = -workspace.CurrentCamera.CFrame.LookVector
    local v19 = v18.X
    local v20 = v18.Z
    local v21 = Vector3.new(v19, 0, v20)
    p14.desired_pet_cframe = CFrame.lookAlong(v17, v21)
    v16.CFrame = p14.desired_pet_cframe
    p14.desired_cframe = CFrame.identity
    p14.desired_fov = 0
    p14.focus_position = p14.pet_model.HumanoidRootPart:FindFirstChild("PetFocusPosition")
    p14.focus_distance = p14.focus_position:FindFirstChild("PetFocusDistance")
    p14:_set_invisicam_enabled(true)
    workspace.CurrentCamera.CameraSubject = p_u_15.char
    p14.maid:GiveTask(v_u_2.enter_scriptable_camera())
    local v22 = game.Players.LocalPlayer.Character.HumanoidRootPart
    p14.saved_cframe = CFrame.new(v22.CFrame.Position):ToObjectSpace(workspace.CurrentCamera.CFrame)
    local v23 = Instance.new("DepthOfFieldEffect")
    v23.NearIntensity = 0
    v23.FarIntensity = 0
    v23.InFocusRadius = 6
    v23.FocusDistance = p14.focus_distance.Value
    v23.FarIntensity = 1
    v23.Enabled = true
    v23.Parent = game.Lighting
    p14.maid:GiveTask(v23)
    v_u_3.set_should_hide_char_callback("focus_pet_app", function(_, p24)
        return p24.char ~= p_u_15.char
    end)
    p14.maid:GiveTask(function()
        v_u_3.clear_should_hide_char_callback("focus_pet_app")
    end)
    p14:recalculate(false)
end
function v_u_9.recalculate(p25, p26)
    if p25.pet_model then
        local v27 = p25.focus_pet_app.is_eating
        local v28 = p25.focus_pet_app.petting_handler.is_petting
        local v29, v30
        if v27 then
            v29 = p25:get_desired_cframe(p25.focus_pet_app.char_wrapper.char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2), 5)
            v30 = 40
        else
            v29 = p25:get_desired_cframe(p25.focus_position.WorldCFrame, p25.focus_distance.Value)
            if v28 then
                v30 = 35
            else
                v30 = 40
            end
        end
        if v29 ~= p25.desired_cframe or v30 ~= p25.desired_fov then
            p25.desired_cframe = v29
            p25.desired_fov = v30
            if p25.tween_promise then
                p25.tween_promise:cancel()
            end
            if not p26 then
                workspace.CurrentCamera.CFrame = p25.desired_cframe
                workspace.CurrentCamera.FieldOfView = p25.desired_fov
            end
            p25.tween_promise = v_u_7.new(workspace.CurrentCamera, v_u_8, {
                ["CFrame"] = p25.desired_cframe,
                ["FieldOfView"] = v30
            })
        end
    end
end
function v_u_9.return_to_saved_cframe(p31)
    if p31.tween_promise then
        p31.tween_promise:cancel()
    end
    local v32 = game.Players.LocalPlayer.Character.HumanoidRootPart
    workspace.CurrentCamera.FieldOfView = 70
    workspace.CurrentCamera.CFrame = CFrame.new(v32.CFrame.Position) * p31.saved_cframe
    workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    p31:_set_invisicam_enabled(false)
    p31.saved_cframe = nil
end
function v_u_9.get_screen_position(_, p33)
    return Vector2.new(p33.X * 0.5, p33.Y * 0.5)
end
function v_u_9.get_camera_rotation(p34)
    return p34.pet_model.HumanoidRootPart.CFrame.Rotation * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), 3.141592653589793) * CFrame.fromAxisAngle(Vector3.new(1, 0, 0), -0.1308996938995747)
end
function v_u_9.get_desired_cframe(p35, p36, p37)
    local v38 = workspace.CurrentCamera.ViewportSize
    local v39 = p35:get_camera_rotation()
    local v40 = p35:get_screen_position(v38)
    return v_u_2.calculate_desired_camera_cframe(v39, v38, 40, p36.Position, v40, p37)
end
function v_u_9.release_focus(p41)
    p41.maid:DoCleaning()
    if p41.saved_cframe then
        p41:return_to_saved_cframe()
    end
    p41.pet_model = nil
end
function v_u_9._set_invisicam_enabled(_, p42)
    local v43 = game.Players.LocalPlayer:FindFirstChild("invisicam")
    if p42 and not v43 then
        local v44 = Instance.new("BoolValue")
        v44.Name = "invisicam"
        v44.Parent = game.Players.LocalPlayer
    elseif v43 and not p42 then
        game.Players.LocalPlayer.invisicam:Destroy()
    end
end
function v_u_9.start(p45, p46)
    p45.maid = v_u_5.new()
    p45.focus_pet_app = p46
    p45.pet_model = nil
    p45.desired_cframe = CFrame.identity
end
return v_u_9