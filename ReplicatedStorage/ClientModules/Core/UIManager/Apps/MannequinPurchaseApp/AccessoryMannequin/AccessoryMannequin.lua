--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MannequinPurchaseApp.AccessoryMannequin (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("InventoryDB")
local v_u_4 = v_u_1("DownloadClient")
local v_u_5 = v_u_1("UIManager")
local v_u_6 = v_u_1("InteractionsEngine")
local v_u_7 = v_u_1("AnimationManager")
local v_u_8 = v_u_1("ResizeM")
local v_u_9 = v_u_1("DeveloperProductDB")
local v_u_10 = v_u_1("PetAccessoryEquipHelper")
local v_u_11 = v_u_1("HatShopProductDB")
local v_u_12 = v_u_1("CloneHelper")
local v_u_13 = v_u_1("RouterClient")
local v_u_14 = v_u_1("BaseMannequin")
local v_u_15 = v_u_1("FurnitureBlockerHelper")
local v_u_16 = game:GetService("ReplicatedStorage").Resources.MannequinBase
local v_u_17 = Color3.fromRGB(178, 186, 220)
local v18 = v2("AccessoryMannequin", v_u_14)
local function v_u_23(p19, p20)
    local v21 = p20 or 1.36
    v_u_8.scale(p19, v21, (Vector3.new()))
    for _, v22 in ipairs(p19:GetDescendants()) do
        if v22.Name == "AccessoryScale" then
            v22.Value = v22.Value * v21
        end
    end
end
function v18.__init(p24, p25, p26, p27, p28, p29)
    local v30 = p29 or {}
    local v31 = not v30.scale and 1.36 or v30.scale
    local v32
    if v30.color then
        v32 = v30.color
    else
        v32 = v_u_17
    end
    local v33 = not v30.interaction_offset and Vector3.new(0, -3, 0) or v30.interaction_offset
    local v34 = v_u_16:Clone()
    v_u_23(v34, v31)
    local v35, v36 = v34:GetBoundingBox()
    p24.cframe_offset = Vector3.new(0, 1, 0) * (v36.Y / 2)
    v34.PrimaryPart.PivotOffset = v34.PrimaryPart.CFrame:ToObjectSpace(v35 - p24.cframe_offset)
    v34:PivotTo(p25)
    v34.Parent = p26
    v_u_14.__init(p24, p25, v34, p27, p28)
    p24.cached_accessories = nil
    p24.color = v32
    p24.equipped_accessories = {}
    p24.interaction_offset = v33
    p24.animation_tracks = {
        ["idle"] = v34.AnimationController:LoadAnimation(v_u_7.get_track("DogIdle"))
    }
end
function v18._clear_cached_accessories(p37)
    p37.cached_accessories = nil
end
local v_u_38 = 0
function v18._download_and_cache_accessories(p39)
    local v40 = p39.content
    local v41 = p39.cached_accessories
    if v41 == nil then
        v41 = {}
        if p39.content_type == "non_robux_accessory" then
            local v42 = v40.accessory_id
            local v_u_43 = v_u_3.pet_accessories[v42]
            local v48, v49 = pcall(function()
                local v44 = v_u_4.download("PetAvatarResources", v_u_43.model_handle):Clone()
                v_u_4.release("PetAvatarResources", v_u_43.model_handle)
                local v45 = v44:FindFirstChildWhichIsA("AnimationController", true)
                local v46 = v44:GetDescendants()
                table.insert(v46, v44)
                for _, v47 in ipairs(v46) do
                    if v47:IsA("BasePart") then
                        v47.CanCollide = false
                        v47.Anchored = false
                        if not v45 then
                            v_u_38 = v_u_38 + 1
                            v47.Name = ("AccessoryMannequinHandle%d"):format(v_u_38)
                        end
                    elseif v47:IsA("Model") then
                        v_u_38 = v_u_38 + 1
                        v47.Name = ("AccessoryMannequinHandle%d"):format(v_u_38)
                    end
                end
                return v44
            end)
            if not v48 then
                warn(v49)
                v49 = "None"
            end
            v41[v42] = v49
        elseif p39.content_type == "developer_product" then
            local v50 = v_u_11[v40.developer_product_kind].accessory_ids_to_show
            for _, v51 in ipairs(v50) do
                local v_u_52 = v_u_3.pet_accessories[v51]
                local v57, v58 = pcall(function()
                    local v53 = v_u_4.download("PetAvatarResources", v_u_52.model_handle):Clone()
                    v_u_4.release("PetAvatarResources", v_u_52.model_handle)
                    local v54 = v53:FindFirstChildWhichIsA("AnimationController", true)
                    local v55 = v53:GetDescendants()
                    table.insert(v55, v53)
                    for _, v56 in ipairs(v55) do
                        if v56:IsA("BasePart") then
                            v56.CanCollide = false
                            v56.Anchored = false
                            if not v54 then
                                v_u_38 = v_u_38 + 1
                                v56.Name = ("AccessoryMannequinHandle%d"):format(v_u_38)
                            end
                        elseif v56:IsA("Model") then
                            v_u_38 = v_u_38 + 1
                            v56.Name = ("AccessoryMannequinHandle%d"):format(v_u_38)
                        end
                    end
                    return v53
                end)
                if not v57 then
                    warn(v58)
                    v58 = "None"
                end
                v41[v51] = v58
            end
        end
        p39.cached_accessories = v41
    end
    return v41
end
function v18._clear_equipped_accessories(p59)
    for _, v60 in ipairs(p59.equipped_accessories) do
        v60.unequip()
    end
    p59.equipped_accessories = {}
    p59.accessory_part_to_color_map = nil
    p59.accessory_part_to_texture_map = nil
end
function v18._equip_accessories(p61)
    local v62 = p61:_download_and_cache_accessories()
    local v63 = p61.model
    local v64 = {}
    local v65 = {}
    for v66, v67 in pairs(v62) do
        local v68 = {
            ["pet_model"] = v63,
            ["accessory_base_asset"] = v67,
            ["accessory_item_entry"] = v_u_3.pet_accessories[v66],
            ["is_mannequin"] = true
        }
        local v69 = v_u_10.equip_accessory(v68)
        local v70 = p61.equipped_accessories
        table.insert(v70, v69)
        for _, v71 in pairs(v69.accessory:GetDescendants()) do
            if v71:IsA("BasePart") then
                v64[v71] = v71.Color
            end
            if v71:IsA("MeshPart") then
                v65[v71] = v71.TextureID
            end
        end
    end
    p61.accessory_part_to_color_map = v64
    p61.accessory_part_to_texture_map = v65
end
function v18._refresh_accessories(p72)
    p72:_clear_cached_accessories()
    p72:_clear_equipped_accessories()
    p72:_equip_accessories()
end
function v18._refresh_shadow_mode(p73)
    local v74 = p73.is_shadow
    local v75 = p73.model
    if v74 then
        for _, v76 in ipairs(v75:GetChildren()) do
            if v76:IsA("BasePart") then
                v76.Color = Color3.fromRGB(12, 4, 39)
            end
        end
        for _, v77 in ipairs(p73.equipped_accessories) do
            for _, v78 in ipairs(v77.accessory:GetDescendants()) do
                if v78:IsA("BasePart") then
                    v78.Color = Color3.new(0, 0, 0)
                end
                if v78:IsA("MeshPart") then
                    v78.TextureID = ""
                end
            end
        end
    else
        for _, v79 in ipairs(v75:GetChildren()) do
            if v79:IsA("BasePart") then
                v79.Color = p73.color
            end
        end
        for v80, v81 in pairs(p73.accessory_part_to_texture_map) do
            v80.TextureID = v81
        end
        for v82, v83 in pairs(p73.accessory_part_to_color_map) do
            v82.Color = v83
        end
    end
end
function v18._update_interaction(p_u_84)
    local v85 = p_u_84.content
    local v86 = nil
    if p_u_84.content_type == "non_robux_accessory" then
        v86 = ("View %s"):format(v_u_3.pet_accessories[v85.accessory_id].name)
    elseif p_u_84.content_type == "developer_product" then
        v86 = ("View %s"):format(v_u_9[v85.developer_product_kind].name)
    end
    p_u_84.maid.interaction = v_u_6:register({
        ["text"] = v86,
        ["on_selected"] = function()
            v_u_5.apps.MannequinPurchaseApp:enter(p_u_84.mannequin_id)
        end,
        ["part"] = p_u_84.model.HumanoidRootPart,
        ["offset"] = p_u_84.interaction_offset
    })
    v_u_15.protect_critical_interaction(p_u_84.maid.interaction)
end
function v18.build_virtual_mannequin_model(p87)
    local v88, v89 = v_u_12.clone_and_match(p87.model)
    local v90 = {}
    local v91 = {}
    for _, v92 in ipairs(p87.model:GetDescendants()) do
        local v93 = v89[v92]
        if v92:IsA("BasePart") then
            v90[v92] = v93
            local v94 = p87.accessory_part_to_texture_map[v92]
            local v95 = p87.accessory_part_to_color_map[v92]
            if v94 then
                v93.TextureID = v94
            end
            if v95 then
                v93.Color = v95
            end
        elseif v92:IsA("Bone") then
            v91[v92] = v93
        end
    end
    return v88, v90, v91
end
function v18._rebuild(p96)
    p96:_refresh_accessories()
    p96:_refresh_shadow_mode()
    p96:_update_interaction()
end
function v18.update_content(p97, p98)
    p97.content = p98
    p97:_rebuild()
    p97.content_changed_signal:Fire()
end
local v_u_99 = {
    ["head_crown"] = "head",
    ["head_top"] = "head",
    ["head_headphones"] = "head",
    ["head_hood"] = "head",
    ["face_eyes"] = "face",
    ["neck_collar"] = "neck",
    ["neck_front"] = "neck",
    ["chest_badge"] = "chest",
    ["back_wings"] = "back",
    ["back_wings_alt"] = "back",
    ["back_backpack"] = "back"
}
local v_u_100 = {
    ["head"] = CFrame.fromOrientation(-0.2617993877991494, 0, 0),
    ["face"] = CFrame.fromOrientation(-0.2617993877991494, 0, 0),
    ["eyes"] = CFrame.fromOrientation(-0.2617993877991494, 0, 0),
    ["neck"] = CFrame.fromOrientation(0, 0, 0),
    ["chest"] = CFrame.fromOrientation(0, 0, 0),
    ["back"] = CFrame.fromOrientation(-0.2617993877991494, 0, 0),
    ["shoes"] = CFrame.fromOrientation(-0.2617993877991494, 0, 0),
    ["earrings"] = CFrame.fromOrientation(-0.2617993877991494, 0, 0)
}
local v_u_101 = {
    ["head"] = 11,
    ["face"] = 11,
    ["eyes"] = 11,
    ["neck"] = 8,
    ["chest"] = 8,
    ["back"] = 11,
    ["shoes"] = 8,
    ["earrings"] = 8
}
function v18.get_camera_rotation(p102)
    local v103 = p102:get_content_type()
    local v104 = p102:get_front_facing_cframe()
    if v103 == "non_robux_accessory" then
        local v105 = p102:get_content().accessory_id
        local v106 = p102.equipped_accessories[1] and p102.equipped_accessories[1].accessory or nil
        local v107 = v_u_3.pet_accessories[v105].equip_type
        local v108 = v_u_100[v107 == "shoes" and "shoes" or (v107 == "earrings" and "earrings" or (v107 == "wings" and "back" or (v106 and (v_u_99[v_u_10.get_accessory_attachment_type(v106)] or "head") or "head")))]
        local v109 = v104 * CFrame.Angles(0, 3.141592653589793, 0) * v108
        return v109 - v109.p
    end
    if v103 == "developer_product" then
        local v110 = v104 * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.fromOrientation(-0.2617993877991494, 0, 0)
        return v110 - v110.p
    end
end
function v18.get_focus_cframe(p111)
    local v112 = p111:get_content_type()
    local v113 = p111:get_front_facing_cframe()
    local v114 = v113 + Vector3.new(0, 1, 0)
    if v112 == "non_robux_accessory" then
        local v115 = p111:get_content().accessory_id
        local v116 = p111.equipped_accessories[1]
        if v116 then
            local v117 = v_u_3.pet_accessories[v115].equip_type
            if v117 == "shoes" then
                return v113 + Vector3.new(0, -1, 0)
            end
            if v117 == "earrings" then
                return v113 + Vector3.new(0, 1, 0)
            end
            if v117 == "wings" then
                local v118 = v_u_16:FindFirstChild("WingsAttachment", true)
                local v119 = v_u_16.HumanoidRootPart.Position
                local v120 = (v118.WorldPosition - v119).Y
                return v113 + Vector3.new(0, v120, 0)
            end
            local v121 = v116.accessory
            local v122 = v_u_16:FindFirstChild(v_u_10.get_accessory_attachment_type(v121) .. "_attachment", true)
            local v123 = v_u_16.HumanoidRootPart.Position
            local v124 = (v122.WorldPosition - v123).Y
            return v113 + Vector3.new(0, v124, 0)
        end
    elseif v112 == "developer_product" then
        v114 = v113 + Vector3.new(0, 1, 0)
    end
    return v114
end
function v18.get_camera_distance(p125)
    if p125:get_content_type() == "non_robux_accessory" then
        local v126 = p125:get_content().accessory_id
        local v127 = p125.equipped_accessories[1]
        if v127 then
            local v128 = v127.accessory
            local v129 = v_u_3.pet_accessories[v126].equip_type
            return v_u_101[v129 == "shoes" and "shoes" or (v129 == "earrings" and "earrings" or (v129 == "wings" and "back" or (v128 and (v_u_99[v_u_10.get_accessory_attachment_type(v128)] or "head") or "head")))]
        end
    end
    return v_u_14.get_camera_distance(p125)
end
function v18.reset_rotation_for_focus(p130)
    local v131 = nil
    local v132 = p130:get_content_type()
    local v133
    if v132 == "non_robux_accessory" then
        local v134 = p130:get_content().accessory_id
        local v135 = p130.equipped_accessories[1]
        if v135 then
            local v136 = v_u_3.pet_accessories[v134].equip_type
            if v136 == "shoes" or v136 == "earrings" then
                v133 = "reset"
            elseif v136 == "wings" then
                v133 = "reset_turned_around"
            else
                local v137 = v135.accessory
                local v138 = v_u_10.get_accessory_attachment_type(v137)
                v133 = (v138 == "back_backpack" or (v138 == "back_wings" or v138 == "back_wings_alt")) and "reset_turned_around" or "reset"
            end
        else
            v133 = "reset"
        end
    else
        v133 = v132 == "developer_product" and "reset" or v131
    end
    v_u_14.update_rotation_state(p130, v133)
end
function v18.buy(p139, _)
    local v140 = p139:get_content_type()
    local v141 = p139:get_content()
    if v140 == "non_robux_accessory" then
        local v142 = {
            ["category"] = "pet_accessories",
            ["id"] = v141.accessory_id
        }
        v_u_1("ShopM").buy_item(nil, v142)
    elseif v140 == "developer_product" then
        local v143 = v141.developer_product_kind
        v_u_13.get("ProductsAPI/PromptProductPurchase"):FireServer(v143)
    end
end
function v18.destroy(p144)
    v_u_14.destroy(p144)
    p144.model:Destroy()
end
return v18