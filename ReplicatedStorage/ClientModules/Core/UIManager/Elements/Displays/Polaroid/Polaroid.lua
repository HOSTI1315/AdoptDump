--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Displays.Polaroid (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("ColorableItemHelper")
local v_u_4 = v_u_1("DownloadClient")
local v_u_5 = v_u_1("Maid")
local v_u_6 = v_u_1("new:PetEntryHelper")
local v_u_7 = v_u_1("PetPerformanceName")
local v_u_8 = v_u_1("new:PetRigs")
local v_u_9 = v_u_1("Utilities")
local v_u_10 = v_u_1("ViewportModelFitter")
local v_u_11 = v_u_1("EffectsToggleHelper")
local v_u_12 = v_u_1("package:Sift")
local v_u_13 = v_u_1("package:Promise")
local v_u_14 = game:GetService("RunService")
local v_u_68 = {
    ["transport"] = function(p_u_15)
        return v_u_13.new(function(p16, p17, p18)
            local v19
            if p_u_15.item_entry.unreleased or p_u_15.item_entry.permanently_delete_all_copies_of_this_item_from_the_game then
                v19 = nil
            else
                v19 = v_u_4.promise_download_copy("Vehicles", p_u_15.item_entry.kind):expect()
            end
            if p18() and v19 then
                v19:Destroy()
                return
            elseif v19 then
                p16(v19)
            else
                p17("Could not find transport model")
            end
        end):andThen(function(p_u_20)
            local v21 = p_u_20:FindFirstChild("VehicleSeat", true)
            p_u_20.PrimaryPart = v21
            local v22 = p_u_20:GetDescendants()
            local v25 = v_u_12.List.filter(v22, function(p23)
                local v24 = p23:IsA("BasePart")
                if v24 then
                    v24 = p23.Transparency < 1
                end
                return v24
            end)
            local v26 = v_u_9.getAlignedBoundingBox(v25, v21.CFrame.Rotation)
            p_u_20.PrimaryPart = nil
            p_u_20.WorldPivot = v26
            p_u_20:PivotTo(CFrame.fromAxisAngle(Vector3.new(0, 1, 0), 3.141592653589793))
            p_u_20.Parent = p_u_15.viewport_frame.WorldModel
            local v_u_27 = Instance.new("Camera")
            v_u_27.FieldOfView = 70
            v_u_27.Parent = p_u_15.viewport_frame
            p_u_15.viewport_frame.CurrentCamera = v_u_27
            local v28 = v_u_10.new(p_u_15.viewport_frame, v_u_27, p_u_20, {
                ["ignore_transparent"] = true
            }):get_fit_distance()
            v_u_27.CFrame = CFrame.fromEulerAnglesYXZ(-0.3490658503988659, 0.7853981633974483, 0) * CFrame.new(0, 0, v28)
            if p_u_15.options.starter_color then
                v_u_3.apply_vehicle_color({
                    ["category"] = "transport"
                }, p_u_20, p_u_15.options.starter_color)
            end
            local v29 = p_u_15.options.update_signal
            if v29 then
                p_u_15.polaroid_maid:GiveTask(v29:Connect(function(p30)
                    v_u_3.apply_vehicle_color({
                        ["category"] = "transport"
                    }, p_u_20, p30)
                end))
            end
            p_u_15.polaroid_maid:GiveTask(function()
                p_u_20:Destroy()
                v_u_27:Destroy()
            end)
        end):catch(function(p31)
            warn(p31)
            if p_u_15.options.on_error then
                p_u_15.options.on_error()
            end
        end):finally(function()
            if p_u_15.viewport_frame:FindFirstChild("LoadingImage") then
                p_u_15.viewport_frame.LoadingImage.Visible = false
            end
        end)
    end,
    ["pets"] = function(p_u_32)
        local v_u_33 = v_u_1("PetEntityManager")
        local v_u_34 = v_u_1("PetEntityHelper")
        p_u_32.variant = p_u_32.options.variant
        return v_u_13.new(function(p35, p36, p37)
            local v38
            if p_u_32.item_entry.unreleased or p_u_32.item_entry.permanently_delete_all_copies_of_this_item_from_the_game then
                v38 = nil
            else
                v38 = v_u_4.promise_download_copy("Pets", p_u_32.item_entry.kind):expect()
            end
            if p37() and v38 then
                v38:Destroy()
                return
            elseif v38 then
                p35(v38)
            else
                p36("Could not find pet model")
            end
        end):andThen(function(p_u_39)
            return v_u_13.new(function(p40, p41, p42)
                p_u_39:SetPrimaryPartCFrame(CFrame.new())
                p_u_39.Parent = p_u_32.viewport_frame.WorldModel
                local v_u_43 = v_u_33.create_pet_entity(p_u_39, p_u_32.item_entry)
                local function v44()
                    if v_u_43 then
                        v_u_33.remove_pet_entity_by_entity(v_u_43)
                    end
                    p_u_39:Destroy()
                end
                if p42() then
                    if v_u_43 then
                        v_u_33.remove_pet_entity_by_entity(v_u_43)
                    end
                    p_u_39:Destroy()
                    return
                else
                    p_u_32.polaroid_maid:GiveTask(v44)
                    if v_u_43 then
                        p40(v_u_43)
                    else
                        p41("Could not create pet entity")
                    end
                end
            end)
        end):andThen(function(p_u_45)
            local v_u_46 = Instance.new("Camera")
            p_u_32.viewport_frame.CurrentCamera = v_u_46
            v_u_46.FieldOfView = 70
            v_u_46.Parent = p_u_32.viewport_frame
            local v_u_47 = p_u_32:_get_neon_transformation_function(p_u_45)
            if p_u_32.variant == "neon" or p_u_32.variant == "mega_neon" then
                v_u_47()
            end
            local v48 = p_u_45.base.pet_model
            if p_u_32.item_entry.baked_in_accessory_parts then
                for _, v49 in p_u_32.item_entry.baked_in_accessory_parts do
                    for _, v50 in v49 do
                        local v51 = v_u_8.get(v48).get_geo_part(v48, v50)
                        if v51 then
                            v51.Transparency = 1
                        end
                    end
                end
            end
            v_u_34.stage_performance(p_u_45, {
                ["name"] = v_u_7.AnimationProvider,
                ["options"] = {
                    ["anim_name"] = v_u_6.get_anims(p_u_32.item_entry).idle,
                    ["anim_speed"] = p_u_32.options.freeze_pets and 0 or nil,
                    ["anim_fade_time"] = p_u_32.options.freeze_pets and 0 or nil
                }
            })
            local v52 = v_u_10.new(p_u_32.viewport_frame, v_u_46, p_u_45.base.pet_model, {
                ["ignore_transparent"] = true
            })
            local v53 = v52.model_cframe
            local v_u_54 = p_u_45.base.pet_model.HumanoidRootPart:FindFirstChildWhichIsA("Motor6D")
            local v_u_55 = 180
            local v_u_56 = CFrame.new()
            local v_u_57 = CFrame.new()
            local v58 = p_u_32.item_entry.origin_entry.viewport_override or {}
            v58.offset = v48:GetAttribute("journal_offset") and CFrame.new(v48:GetAttribute("journal_offset")) or v58.offset
            v58.distance = v48:GetAttribute("journal_distance") or v58.distance
            local v_u_59 = v58.offset or v_u_54.Part1.CFrame:Inverse() * v53
            local v_u_60 = v58.distance or v52:get_fit_distance()
            local v64 = v_u_14.Stepped:Connect(function(_, p61)
                local v62 = v_u_55
                local v63 = 20 * p61
                v_u_55 = v62 + math.rad(v63)
                v_u_56 = v_u_54.Part1.CFrame * v_u_59
                v_u_57 = p_u_32.options.locked_orientation or CFrame.fromEulerAnglesYXZ(-0.3490658503988659, v_u_55, 0)
                v_u_46.CFrame = CFrame.new(v_u_56.Position) * v_u_57 * CFrame.new(0, 0, v_u_60)
                p_u_32.viewport_frame.LightDirection = -v_u_57.ZVector
            end)
            p_u_32.polaroid_maid:GiveTask(v64)
            p_u_32.polaroid_maid:GiveTask(function()
                v_u_34.end_performance(p_u_45, v_u_7.AnimationProvider)
            end)
            local v65 = p_u_32.options.update_signal
            if v65 then
                p_u_32.polaroid_maid:GiveTask(v65:Connect(function(p66)
                    p_u_32.variant = p66
                    v_u_47()
                end))
            end
            p_u_32.polaroid_maid:GiveTask(v_u_46)
        end):catch(function(p67)
            warn(p67)
            if p_u_32.options.on_error then
                p_u_32.options.on_error()
            end
        end):finally(function()
            if p_u_32.viewport_frame:FindFirstChild("LoadingImage") then
                p_u_32.viewport_frame.LoadingImage.Visible = false
            end
        end)
    end
}
local v69 = v2("Polaroid")
function v69.__init(p70, p71, p72, p73)
    p70.item_entry = p71
    p70.viewport_frame = p72
    p70.options = p73 or {}
    p70.polaroid_maid = v_u_5.new()
    p70.request = p70:_request_polaroid()
end
function v69.Destroy(p74)
    p74.request:cancel()
    p74.polaroid_maid:Destroy()
    p74.viewport_frame = nil
end
function v69._request_polaroid(p75)
    return v_u_68[p75.item_entry.category](p75)
end
function v69._get_neon_transformation_function(p_u_76, p_u_77)
    local v_u_78 = p_u_77.base.pet_model
    local v_u_79 = p_u_77.base.entry
    local v_u_80 = {}
    for _, v81 in { v_u_79.neon_parts, v_u_79.mega_neon_parts } do
        for v82, v83 in v81 do
            local v84 = v_u_8.get(v_u_78).get_geo_part(v_u_78, v82)
            if v84 then
                if v84:IsA("MeshPart") and v84.TextureID ~= "" then
                    v84.TextureID = ""
                end
                v_u_80[v82] = v_u_80[v82] or {}
                for v85, _ in v83 do
                    v_u_80[v82][v85] = v84[v85]
                end
            end
        end
    end
    return function()
        local v86 = p_u_76.variant == "neon" and true or p_u_76.variant == "mega_neon"
        local v87 = p_u_76.variant == "mega_neon"
        local v88 = nil
        if v87 then
            v88 = v_u_79.mega_neon_parts
        elseif v86 then
            v88 = v_u_79.neon_parts
        end
        for v89, v90 in v_u_80 do
            local v91 = v_u_8.get(v_u_78).get_geo_part(v_u_78, v89)
            if v91 then
                for v92, v93 in v90 do
                    v91[v92] = v93
                end
            end
        end
        for _, v94 in v_u_78:GetDescendants() do
            if v94.Name == "DisplayPart" then
                local v95 = v_u_80[v94.Parent.Name]
                if v95 then
                    for v96, v97 in v95 do
                        v94[v96] = v97
                    end
                end
            end
        end
        if v88 then
            for v98, v99 in v88 do
                local v100 = v_u_8.get(v_u_78).get_geo_part(v_u_78, v98)
                if v100 then
                    for v101, v102 in v99 do
                        v100[v101] = v102
                    end
                    v100:SetAttribute("is_neon_transformed", true)
                end
            end
            for _, v103 in v_u_78:GetDescendants() do
                if v103.Name == "DisplayPart" then
                    local v104 = v88[v103.Parent.Name]
                    if v104 then
                        for v105, v106 in v104 do
                            v103[v105] = v106
                        end
                    end
                end
            end
        end
        if v_u_78:FindFirstChild("NeonEffects") then
            v_u_11.toggle_effects(v_u_78.NeonEffects:GetDescendants(), v86)
        end
        if v_u_78:FindFirstChild("NonNeonEffects") then
            v_u_11.toggle_effects(v_u_78.NonNeonEffects:GetDescendants(), not v86)
        end
        p_u_77.mega_neon.force_visible = v86 and v87
    end
end
return v69