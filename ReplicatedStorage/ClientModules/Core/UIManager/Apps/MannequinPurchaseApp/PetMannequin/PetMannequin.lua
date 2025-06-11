--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MannequinPurchaseApp.PetMannequin (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AnimationManager")
local v_u_3 = v1("BaseMannequin")
local v4 = v1("Class")
local v_u_5 = v1("CloneHelper")
local v_u_6 = v1("FocusPetAppCamera")
local v_u_7 = v1("InventoryDB")
local v_u_8 = v1("UIManager")
local v9 = v1("package:t")
local v10 = v4("PetMannequin", v_u_3)
local v_u_11 = v9.strictInterface({
    ["pet_kind"] = v9.string,
    ["on_buy"] = v9.callback
})
function v10.__init(p12, p13, p14, p15, p16)
    local v17 = v_u_11
    assert(v17(p16))
    p14:PivotTo(p13)
    v_u_3.__init(p12, p13, p14, "pet", p15)
    p12.skip_recolor = true
    p12.content = {
        ["pet_kind"] = p16.pet_kind,
        ["on_buy"] = p16.on_buy
    }
    p12.accessory_part_to_color_map = {}
    p12.accessory_part_to_texture_map = {}
    local v18 = p14.AnimationController
    local v19 = {}
    local v20 = p14:FindFirstChild("HumanoidRootPart")
    local v21
    if v20 then
        v21 = v20:FindFirstChild("PetFocusPosition")
    else
        v21 = nil
    end
    local v22 = not v21 and "sit" or v21:FindFirstChild("PetFocusAnimName").Value
    local v23 = v_u_7.pets[p16.pet_kind].anims[v22]
    v19.idle = v18:LoadAnimation(v_u_2.get_track(v23))
    p12.animation_tracks = v19
    p12.camera_values = v_u_6.calculate_static_camera_values(p12.model)
end
function v10._refresh_shadow_mode(p24)
    local v25 = p24.is_shadow
    local v26 = p24.model
    if v25 then
        for _, v27 in v26:GetDescendants() do
            if v27:IsA("BasePart") then
                p24.accessory_part_to_color_map[v27] = v27.Color
                v27.Color = Color3.fromRGB(12, 4, 39)
                if v27:IsA("MeshPart") then
                    p24.accessory_part_to_texture_map[v27] = v27.TextureID
                    v27.TextureID = ""
                end
            elseif v27:IsA("Clothing") or v27:IsA("Decal") then
                p24.accessory_part_to_color_map[v27] = v27.Color3
                v27.Color3 = Color3.fromRGB(12, 4, 39)
            elseif v27:IsA("SpecialMesh") then
                p24.accessory_part_to_texture_map[v27] = v27.TextureId
                v27.TextureId = ""
            end
        end
    else
        for v28, v29 in p24.accessory_part_to_texture_map do
            if v28:IsA("MeshPart") then
                v28.TextureID = v29
            else
                v28.TextureId = v29
            end
        end
        for v30, v31 in p24.accessory_part_to_color_map do
            if v30:IsA("BasePart") then
                v30.Color = v31
            else
                v30.Color3 = v31
            end
        end
    end
end
function v10.build_virtual_mannequin_model(p32)
    local v33, v34 = v_u_5.clone_and_match(p32.model)
    local v35 = {}
    local v36 = {}
    for _, v37 in p32.model:GetDescendants() do
        local v38 = v34[v37]
        if v37:IsA("BasePart") then
            v35[v37] = v38
        elseif v37:IsA("Bone") then
            v36[v37] = v38
        end
    end
    return v33, v35, v36
end
function v10.get_camera_rotation(p39)
    return p39.camera_values.rotation
end
function v10.get_focus_cframe(p40)
    return p40.camera_values.focus
end
function v10.get_camera_distance(p41)
    return p41.camera_values.distance
end
function v10.buy(p42, _)
    local v43 = v_u_7.pets[p42.content.pet_kind].name
    if v_u_8.apps.DialogApp:dialog({
        ["text"] = ("Do you want to adopt this %*?"):format(v43),
        ["left"] = "Cancel",
        ["right"] = "Yes"
    }) == "Yes" then
        p42.content.on_buy()
    end
end
return v10