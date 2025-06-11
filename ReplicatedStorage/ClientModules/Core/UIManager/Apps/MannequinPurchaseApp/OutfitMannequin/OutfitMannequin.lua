--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MannequinPurchaseApp.OutfitMannequin (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("ClientData")
local v_u_4 = v_u_1("CloneHelper")
local v_u_5 = v_u_1("RouterClient")
local v_u_6 = v_u_1("ViewportModelFitter")
local v_u_7 = v_u_1("BaseMannequin")
local v_u_8 = v_u_1("AnimationManager")
local v_u_9 = v_u_1("FurnitureMannequinsHelper")
local v10 = v_u_1("package:t")
local v_u_11 = v_u_1("package:Sift")
local v12 = v2("OutfitMannequin", v_u_7)
local v_u_13 = v10.strictInterface({
    ["price"] = v10.integer,
    ["for_sale"] = v10.boolean,
    ["outfit_name"] = v10.string,
    ["outfit_version"] = v10.string,
    ["owner"] = v10.instanceIsA("Player")
})
function v12.__init(p14, p15, p16, p17, p18)
    local v19 = v_u_13
    assert(v19(p18))
    p16:PivotTo(p15)
    v_u_7.__init(p14, p15, p16, "mannequin", p17)
    p14.skip_recolor = true
    p14.content = {
        ["price"] = p18.price,
        ["for_sale"] = p18.for_sale,
        ["outfit_name"] = p18.outfit_name,
        ["outfit_version"] = p18.outfit_version,
        ["owner"] = p18.owner,
        ["is_owner"] = p18.owner == game.Players.LocalPlayer
    }
    p14.accessory_part_to_color_map = {}
    p14.accessory_part_to_texture_map = {}
    local v20 = {
        ["AbsoluteSize"] = workspace.CurrentCamera.ViewportSize
    }
    p14.viewport_model_fitter = v_u_6.new(v20, {
        ["FieldOfView"] = 40
    }, p14.model, {
        ["model_size_axis"] = Enum.Axis.Y
    })
    p14.animation_tracks = {
        ["idle"] = p16:FindFirstChild("Animator", true):LoadAnimation(v_u_8.get_track("NPCIdle"))
    }
end
function v12._refresh_shadow_mode(p21)
    local v22 = p21.is_shadow
    local v23 = p21.model
    if v22 then
        for _, v24 in v23:GetDescendants() do
            if v24:IsA("BasePart") then
                p21.accessory_part_to_color_map[v24] = v24.Color
                v24.Color = Color3.fromRGB(12, 4, 39)
                if v24:IsA("MeshPart") then
                    p21.accessory_part_to_texture_map[v24] = v24.TextureID
                    v24.TextureID = ""
                end
            elseif v24:IsA("Clothing") or v24:IsA("Decal") then
                p21.accessory_part_to_color_map[v24] = v24.Color3
                v24.Color3 = Color3.fromRGB(12, 4, 39)
            elseif v24:IsA("SpecialMesh") then
                p21.accessory_part_to_texture_map[v24] = v24.TextureId
                v24.TextureId = ""
            end
        end
    else
        for v25, v26 in p21.accessory_part_to_texture_map do
            if v25:IsA("MeshPart") then
                v25.TextureID = v26
            else
                v25.TextureId = v26
            end
        end
        for v27, v28 in p21.accessory_part_to_color_map do
            if v27:IsA("BasePart") then
                v27.Color = v28
            else
                v27.Color3 = v28
            end
        end
    end
end
function v12.build_virtual_mannequin_model(p29)
    local v30, v31 = v_u_4.clone_and_match(p29.model)
    local v32 = {}
    local v33 = {}
    for v34, v35 in v31 do
        if v34:IsA("BasePart") then
            v32[v34] = v35
            local v36 = p29.accessory_part_to_texture_map[v34]
            local v37 = p29.accessory_part_to_color_map[v34]
            if v36 then
                v35.TextureID = v36
            end
            if v37 then
                v35.Color = v37
            end
        elseif v34:IsA("Clothing") or v34:IsA("Decal") then
            local v38 = p29.accessory_part_to_color_map[v34]
            if v38 then
                v35.Color3 = v38
            end
        elseif v34:IsA("SpecialMesh") then
            local v39 = p29.accessory_part_to_texture_map[v34]
            if v39 then
                v35.TextureId = v39
            end
        elseif v34:IsA("Bone") then
            v33[v34] = v35
        end
    end
    return v30, v32, v33
end
function v12.get_camera_rotation(p40)
    return p40:get_front_facing_cframe() * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), 3.141592653589793) * CFrame.fromOrientation(-0.1308996938995747, 0, 0)
end
function v12.get_focus_cframe(p41)
    local v42 = p41.viewport_model_fitter.model_cframe
    local v43 = p41:get_front_facing_cframe()
    return CFrame.new(v43.X, v42.Y, v43.Z)
end
function v12.get_camera_distance(p44)
    local v45 = p44.viewport_model_fitter:get_fit_distance()
    return v45 + v45 * 0.15000000000000002 / p44.viewport_model_fitter.trig_cache.tan_y_fov2
end
function v12.get_screen_position(_, p46)
    return Vector2.new(p46.X * 0.5, p46.Y * 0.55)
end
function v12.buy(p47, p48)
    local v_u_49 = p47:get_content()
    local v50 = v_u_49.is_owner
    if not v50 then
        local v51 = v_u_3.get("outfits") or {}
        v50 = v_u_11.Dictionary.some(v51, function(p52)
            return p52.source_outfit_version == v_u_49.outfit_version
        end)
    end
    local v53 = v_u_49.outfit_version
    local v54 = v_u_49.price
    if not v50 then
        local v55 = v_u_1("ShopM")
        local v56 = v_u_1("UIManager")
        if not v55.try_prompt_not_enough_money("money", v54) then
            return
        end
        local v57 = {
            ["text"] = string.format("ui.buy_label_item_question_with_bucks [%s] [%d]", "Outfit", v54),
            ["left"] = "Cancel",
            ["right"] = "Buy"
        }
        if v56.apps.DialogApp:dialog(v57) ~= "Buy" then
            return
        end
        if not v_u_5.get("AvatarAPI/BuyMannequinOutfit"):InvokeServer(v_u_49.owner, p47.mannequin_id, v53, v54) then
            return
        end
        p48()
    end
    v_u_9.prompt_wear_or_save_outfit(v_u_49.owner, p47.mannequin_id, v53)
end
return v12