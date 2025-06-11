--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.DisplayStandUseHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("AnimationManager")
local v_u_3 = v_u_1("HouseTradeUseHelper")
local v_u_4 = v_u_1("InventoryDB")
local v_u_5 = v_u_1("Utilities")
local v_u_6 = v_u_1("package:Sift")
local v_u_7 = v_u_1("package:Promise")
local v_u_8 = game:GetService("Players")
local v_u_9 = game:GetService("RunService")
local v10 = {}
local v_u_11 = {
    ["pet"] = "Pet",
    ["stroller"] = "Stroller",
    ["vehicle"] = "Vehicle",
    ["holdable"] = "Item",
    ["pet_accessory"] = "Pet Accessory"
}
local v_u_12 = {
    ["pet"] = { "pets" },
    ["stroller"] = { "strollers" },
    ["vehicle"] = { "transport" },
    ["holdable"] = { "toys", "food", "gifts" },
    ["pet_accessory"] = { "pet_accessories", "wings" }
}
local v_u_13 = {
    ["RootMount"] = { "HumanoidRootPart" },
    ["LeftMount"] = {
        "HumanoidRootPart",
        "LowerTorso",
        "UpperTorso",
        "LeftUpperArm",
        "LeftLowerArm",
        "LeftHand"
    },
    ["RightMount"] = {
        "HumanoidRootPart",
        "LowerTorso",
        "UpperTorso",
        "RightUpperArm",
        "RightLowerArm",
        "RightHand"
    },
    ["UpperTorsoMount"] = { "HumanoidRootPart", "LowerTorso", "UpperTorso" }
}
function v10.DISPLAY_STAND(p_u_14)
    local v_u_15 = v_u_1("ColorableItemHelper")
    local v_u_16 = v_u_1("DisplayStandHelper")
    local v17 = table.find(v_u_16.valid_display_types, p_u_14)
    local v18 = tostring(p_u_14)
    assert(v17, ("Invalid display_type %s"):format(v18))
    local v_u_19 = v_u_11[p_u_14]
    return {
        ["use_permissions"] = "HOUSE_OWNER",
        ["dont_automatically_mark_furniture_change_after_use"] = true,
        ["hide_interaction_when_listed_for_trade"] = true,
        ["init"] = function(p_u_20, p_u_21, p22, p23)
            local v24 = v_u_1("DataM")
            if p23 then
                local v_u_25 = v24.get_store(p23)
                local v_u_26 = v_u_25:get("equip_manager")
                local v27 = v_u_25:get_on_key_changed_event("equip_manager")
                local v28 = v_u_25:get_on_key_changed_event("pet_saved_worn_items")
                if p_u_20.display_item_unique then
                    task.spawn(function()
                        if not v_u_25:get("inventory"):get_item(p_u_20.display_item_unique) then
                            p_u_20.display_item_unique = nil
                            p_u_20.displayed_item_is_in_use = false
                            p_u_21()
                        end
                    end)
                end
                local function v_u_34()
                    local v29 = p_u_20.display_item_unique
                    local v30 = false
                    if v29 == nil then
                        p_u_20.displayed_worn_items = nil
                    else
                        local v31 = v_u_25:get("inventory"):get_item(p_u_20.display_item_unique)
                        local v32 = v31 and v_u_4[v31.category]
                        if v32 then
                            v32 = v_u_4[v31.category][v31.kind]
                        end
                        if not v32 or (v32.category ~= "pets" or not v32.is_customizable) then
                            p_u_20.displayed_worn_items = nil
                            return v30
                        end
                        local v33 = v_u_25:get("pet_saved_worn_items"):get_worn_items_for_pet(v29)
                        if p_u_20.displayed_worn_items == nil or not v_u_6.Dictionary.equalsDeep(v33, p_u_20.displayed_worn_items) then
                            p_u_20.displayed_worn_items = v33
                            return true
                        end
                    end
                    return v30
                end
                p22.furniture = p_u_20
                p22.house_owner_store = v_u_25
                p22.equip_manager_changed_conn = v27:Connect(function()
                    local v35 = p_u_20.display_item_unique
                    local v36 = false
                    if v35 == nil then
                        p_u_20.displayed_item_is_in_use = false
                    else
                        local v37 = v_u_26:has_equipped(v35)
                        if v37 ~= p_u_20.displayed_item_is_in_use then
                            p_u_20.displayed_item_is_in_use = v37
                            v36 = true
                        end
                    end
                    if v36 then
                        p_u_21()
                    end
                end)
                p22.worn_items_changed_conn = v28:Connect(function()
                    if v_u_34() then
                        p_u_21()
                    end
                end)
                local v38 = p_u_20.display_item_unique
                if v38 == nil then
                    p_u_20.displayed_item_is_in_use = false
                else
                    local v39 = v_u_26:has_equipped(v38)
                    if v39 ~= p_u_20.displayed_item_is_in_use then
                        p_u_20.displayed_item_is_in_use = v39
                    end
                end
                v_u_34()
                v_u_16.mapping_set_furniture_to_display_item(v_u_25, p_u_20, p_u_20.display_item_unique)
                p22.mapping_changed_conn = v_u_25:get_on_key_changed_event("furniture_to_display_item_unique_map"):Connect(function()
                    if p_u_20.display_item_unique ~= nil and v_u_16.mapping_get_display_item_from_furniture(v_u_25, p_u_20) == nil then
                        p_u_20.display_item_unique = nil
                        p_u_20.displayed_item_is_in_use = false
                        p_u_21()
                    end
                end)
            end
        end,
        ["server_furniture_deactivated"] = function(p40)
            if p40.equip_manager_changed_conn then
                p40.equip_manager_changed_conn:Disconnect()
            end
            if p40.mapping_changed_conn then
                p40.mapping_changed_conn:Disconnect()
            end
            if p40.worn_items_changed_conn then
                p40.worn_items_changed_conn:Disconnect()
            end
            local v41 = p40.house_owner_store
            local v42 = p40.furniture
            v_u_16.mapping_set_furniture_to_display_item(v41, v42, nil)
        end,
        ["use_text"] = function(p43)
            if p43.display_item_unique then
                return ("Remove %s"):format(v_u_19)
            else
                return ("Place %s"):format(v_u_19)
            end
        end,
        ["client_get_data_for_server_use"] = function(p44, _, _)
            if p44.display_item_unique then
                return {
                    ["display_item_changed"] = true,
                    ["new_display_item_unique"] = nil
                }
            end
            local v46 = v_u_1("UIManager").apps.BackpackApp:pick_item({
                ["visible_backpack_categories"] = v_u_6.List.concat({ "favorites" }, v_u_12[p_u_14]),
                ["allow_callback"] = function(p45)
                    return v_u_16.is_item_valid_for_display_type(p_u_14, p45)
                end
            })
            return v46 and {
                ["display_item_changed"] = true,
                ["new_display_item_unique"] = v46.unique
            } or {
                ["display_item_changed"] = false
            }
        end,
        ["server_use"] = function(p47, p48, p49, p50, p51)
            local v52 = v_u_1("DataM")
            if p51 == p47 then
                local v53 = p50.display_item_changed
                local v54 = p50.new_display_item_unique
                if v53 then
                    if p48.display_item_unique == v54 then
                        return
                    end
                    local v_u_55 = v52.get_store(p51)
                    local v_u_56 = v_u_55:get("inventory"):get_item(v54)
                    task.spawn(function()
                        local v57 = v_u_55:get("equip_manager")
                        if v_u_56 then
                            v57:unequip(v_u_56)
                        end
                    end)
                    p48.display_item_unique = v54
                    p48.displayed_item_is_in_use = false
                    if v54 then
                        v_u_16.mapping_remove_display_item_from_all_furniture(v_u_55, v54)
                    end
                    v_u_16.mapping_set_furniture_to_display_item(v_u_55, p48, v54)
                    local v58 = v_u_56 and v_u_4[v_u_56.category]
                    if v58 then
                        v58 = v_u_4[v_u_56.category][v_u_56.kind]
                    end
                    if v58 and (v58.category == "pets" and v58.is_customizable) then
                        p48.displayed_worn_items = v_u_55:get("pet_saved_worn_items"):get_worn_items_for_pet(v_u_56.unique)
                    else
                        p48.displayed_worn_items = nil
                    end
                    p49()
                end
            end
        end,
        ["render"] = function(p_u_59, p_u_60, _, _, p61)
            if v_u_3.is_viewing_listed_house() then
                return
            else
                local v_u_62 = v_u_1("PetAccessoryEquipHelper")
                local v_u_63 = v_u_1("DownloadClient")
                local v_u_64 = v_u_1("PetNeonHelper")
                local v_u_65 = v_u_1("ResizeM")
                local v_u_66 = game:GetService("ContentProvider")
                local v67 = p_u_59.display_item_unique
                if v67 ~= nil then
                    local v_u_68 = Instance.new("BindableEvent")
                    v_u_68.Name = "DisplayModelReady"
                    v_u_68.Parent = p_u_60
                    local v_u_69 = p61.props.player
                    local v70 = {
                        ["owner_player"] = v_u_69,
                        ["display_type"] = p_u_14,
                        ["item_unique"] = v67
                    }
                    v_u_63.promise_download_display_data_for_item(v70):andThen(function(p_u_71)
                        if p_u_71 then
                            local v_u_72 = p_u_71.category
                            local v_u_73 = p_u_71.kind
                            local v_u_74 = p_u_71.properties
                            local v_u_75 = v_u_4[v_u_72][v_u_73]
                            if v_u_75 then
                                if p_u_60:IsDescendantOf(workspace) then
                                    local v76 = v_u_16.get_item_paths(v_u_72, v_u_73, v_u_75)
                                    v_u_63.promise_download_copy_many(v76):andThen(function(p77)
                                        if p_u_60:IsDescendantOf(workspace) then
                                            local v_u_78
                                            if #p77 > 1 then
                                                v_u_78 = Instance.new("Model")
                                                for _, v79 in p77 do
                                                    v79.Parent = v_u_78
                                                end
                                            else
                                                v_u_78 = p77[1]
                                            end
                                            local v80 = p_u_59.displayed_item_is_in_use
                                            if v_u_72 == "pets" then
                                                local v81 = p_u_60.DisplayBlock
                                                local v_u_82 = v_u_78.PetModel
                                                local v83 = v_u_78.HumanoidRootPart
                                                v_u_78.PrimaryPart = v83
                                                v_u_78.PrimaryPart.Anchored = true
                                                v_u_78:SetPrimaryPartCFrame(v81.CFrame * CFrame.new(0, v83.Size.Y / 2 + v_u_78.Humanoid.HipHeight, 0))
                                                local v84 = nil
                                                if v_u_74.neon then
                                                    v84 = v_u_75.neon_parts
                                                elseif v_u_74.mega_neon then
                                                    v84 = v_u_75.mega_neon_parts
                                                end
                                                if v84 then
                                                    v_u_64.apply_neon(v_u_82, v84)
                                                end
                                                if v_u_74.sealed_colors then
                                                    v_u_1("PetColorHelper").color_pet(v_u_78, v_u_74.sealed_colors, {
                                                        ["seal_colors"] = true
                                                    })
                                                end
                                                if v_u_74.mega_neon then
                                                    local v_u_85 = {}
                                                    local v_u_86 = nil
                                                    v_u_68.Event:Connect(function()
                                                        v_u_86 = v_u_9.Heartbeat:Connect(function()
                                                            if v_u_78:IsDescendantOf(workspace) then
                                                                v_u_64.step_mega_neon(v_u_85, v_u_82, v_u_75)
                                                            else
                                                                v_u_86:Disconnect()
                                                            end
                                                        end)
                                                    end)
                                                end
                                            elseif v_u_72 == "transport" then
                                                local v87 = p_u_60.DisplayBlock
                                                v_u_78.PrimaryPart = v_u_78:FindFirstChild("VehicleSeat", true)
                                                for _, v88 in v_u_78:GetDescendants() do
                                                    if v88:IsA("BasePart") then
                                                        v88.Anchored = true
                                                        v88.CanCollide = false
                                                    end
                                                end
                                                local v89 = v_u_78:GetDescendants()
                                                local v90
                                                if v_u_78:FindFirstChild("FrontWheelComplex") or v_u_78:FindFirstChild("BackWheelComplex") then
                                                    v90 = v_u_6.List.filter(v89, function(p91)
                                                        return p91.Parent.Name == "FrontWheelComplex" and true or p91.Parent.Name == "BackWheelComplex"
                                                    end)
                                                else
                                                    v90 = v_u_6.List.filter(v89, function(p92)
                                                        local v93 = p92:IsA("BasePart")
                                                        if v93 then
                                                            v93 = p92.Transparency < 1
                                                        end
                                                        return v93
                                                    end)
                                                end
                                                local v94, v95 = v_u_5.getAlignedBoundingBox(v90, CFrame.new())
                                                v_u_78.PrimaryPart = nil
                                                v_u_78.WorldPivot = v94
                                                local v96 = v87.Size.X / v95.X
                                                local v97 = v87.Size.y / v95.Y
                                                local v98 = v87.Size.Z / v95.Z
                                                local v99 = math.min(1, v96, v97, v98)
                                                if v99 < 1 then
                                                    v_u_65.scale(v_u_78, v99, v94.Position)
                                                    v95 = v95 * v99
                                                end
                                                v_u_78:PivotTo(v87.CFrame * CFrame.new(0, -v87.Size.Y / 2 + v95.Y / 2, 0))
                                                if v_u_74.color then
                                                    local v100 = Color3.new
                                                    local v101 = v_u_74.color
                                                    local v102 = v100(unpack(v101))
                                                    v_u_15.apply_vehicle_color(v_u_75, v_u_78, v102)
                                                end
                                            elseif v_u_72 == "strollers" or (v_u_72 == "toys" or (v_u_72 == "food" or v_u_72 == "gifts")) then
                                                local v103 = p_u_60.DisplayBlock
                                                local v104 = {}
                                                local v105 = 0
                                                for _, v106 in v_u_78:GetDescendants() do
                                                    if v106:IsA("BasePart") then
                                                        v106.Anchored = true
                                                        v106.CanCollide = false
                                                        local v107 = v106.Name
                                                        if v107 == "RootMount" or (v107 == "UpperTorsoMount" or (v107 == "RightMount" or v107 == "LeftMount")) then
                                                            v106.Transparency = 1
                                                            v104[v106.Name] = v106
                                                            v105 = v105 + 1
                                                        end
                                                    end
                                                end
                                                local v108 = {}
                                                for v109, v110 in v104 do
                                                    v108[v109] = v110.Parent
                                                    v108[v109].PrimaryPart = v110
                                                end
                                                local v111 = v_u_72 == "strollers" and CFrame.new() or CFrame.new(0, 0.25, 0)
                                                local v112 = p_u_71.hold_pose
                                                for _, v113 in {
                                                    "RootMount",
                                                    "UpperTorsoMount",
                                                    "RightMount",
                                                    "LeftMount"
                                                } do
                                                    if v104[v113] then
                                                        local v114 = CFrame.new()
                                                        if v112 then
                                                            for _, v115 in v_u_13[v113] do
                                                                v114 = v114 * v112[v115]
                                                            end
                                                        end
                                                        local v116 = v108[v113]
                                                        local _, _ = v116:GetBoundingBox()
                                                        v116:SetPrimaryPartCFrame(v103.CFrame * v114)
                                                        v116.PrimaryPart:Destroy()
                                                        local v117, v118 = v_u_5.getAlignedBoundingBox(v116, v103.CFrame)
                                                        v116.PrimaryPart = nil
                                                        v116.WorldPivot = v117
                                                        v116:PivotTo(v103.CFrame * v111 * CFrame.new(0, -v103.Size.Y / 2 + v118.Y / 2, 0))
                                                        v111 = v111 * CFrame.new(0, v118.Y + 0.25, 0)
                                                    end
                                                end
                                                if v_u_74.color then
                                                    local v119 = Color3.new
                                                    local v120 = v_u_74.color
                                                    local v121 = v119(unpack(v120))
                                                    v_u_15.apply_holdables_color(v_u_75, v_u_78, v121)
                                                end
                                            elseif v_u_72 == "pet_accessories" then
                                                if v_u_75.equip_type == "wings" then
                                                    local v122 = v_u_75.flying_scale or 1
                                                    v_u_65.scale(v_u_78, v122, v_u_78:GetPivot().Position)
                                                end
                                                local v_u_123 = v_u_62.equip_accessory({
                                                    ["pet_model"] = p_u_60.MannequinBase,
                                                    ["accessory_base_asset"] = v_u_78,
                                                    ["accessory_item_entry"] = v_u_75,
                                                    ["play_poof_effect"] = false,
                                                    ["is_mannequin"] = true
                                                })
                                                local v_u_124 = v_u_123.accessory
                                                local v125 = v_u_75.wings_offset
                                                if not v125 then
                                                    local v126 = p_u_60.MannequinBase.HumanoidRootPart.Size.X / 5
                                                    v125 = Vector3.new(v126, 0, 0)
                                                end
                                                if v_u_124.PrimaryPart then
                                                    local v127 = v_u_124.PrimaryPart:FindFirstChild("WingRoot")
                                                    if v127 then
                                                        for _, v128 in v127:GetChildren() do
                                                            if string.match(v128.Name:lower(), "^l") then
                                                                v128.Position = v128.Position - v125
                                                            end
                                                            if string.match(v128.Name:lower(), "^r") then
                                                                v128.Position = v128.Position + v125
                                                            end
                                                        end
                                                    end
                                                end
                                                v_u_124.AncestryChanged:Connect(function()
                                                    if not v_u_124:IsDescendantOf(game) then
                                                        v_u_123.unequip()
                                                    end
                                                end)
                                                v_u_78 = v_u_124
                                            else
                                                warn("Unknown item category: " .. v_u_72)
                                            end
                                            v_u_78.Name = "DisplayModel"
                                            v_u_78:SetAttribute("ItemCategory", v_u_72)
                                            v_u_78:SetAttribute("ItemKind", v_u_73)
                                            v_u_78:SetAttribute("ItemIsInUse", v80)
                                            v_u_78:SetAttribute("ItemOwnerUserId", v_u_69.UserId)
                                            local v129 = { v_u_78 }
                                            if v_u_72 == "pets" then
                                                local v130 = v_u_75.anims
                                                local v131 = v_u_2.get_track(v130.idle)
                                                table.insert(v129, v131)
                                                local v132 = v_u_2.get_track(v130.sit)
                                                table.insert(v129, v132)
                                            end
                                            v_u_66:PreloadAsync(v129)
                                            if p_u_60:IsDescendantOf(workspace) then
                                                if v80 then
                                                    local function v134(p133)
                                                        if p133:IsA("BasePart") then
                                                            p133.Material = Enum.Material.ForceField
                                                            if p133:IsA("MeshPart") then
                                                                p133.TextureID = ""
                                                            end
                                                            if p133:FindFirstChildWhichIsA("SpecialMesh") then
                                                                p133.Transparency = p133.Transparency + (1 - p133.Transparency) * 0.9
                                                            else
                                                                p133.Transparency = p133.Transparency + (1 - p133.Transparency) * 0.2
                                                            end
                                                        elseif p133:IsA("SpecialMesh") then
                                                            p133.TextureId = ""
                                                            return
                                                        elseif p133:IsA("Texture") or p133:IsA("Decal") then
                                                            p133.Transparency = 1
                                                            return
                                                        elseif p133:IsA("ParticleEmitter") or (p133:IsA("Beam") or p133:IsA("Trail")) then
                                                            p133.Enabled = false
                                                        elseif p133:IsA("GuiObject") then
                                                            p133.Visible = false
                                                        end
                                                    end
                                                    for _, v135 in v_u_78:GetDescendants() do
                                                        v134(v135)
                                                    end
                                                    v_u_78.DescendantAdded:Connect(v134)
                                                end
                                                v_u_78.Parent = p_u_60
                                                v_u_68:Fire(v_u_78)
                                            end
                                        else
                                            return
                                        end
                                    end):expect()
                                end
                            else
                                return
                            end
                        else
                            return
                        end
                    end):catch(warn)
                end
            end
        end,
        ["post_render"] = function(p_u_136, p_u_137)
            if v_u_3.is_viewing_listed_house() then
                local v138 = p_u_137:FindFirstChild("MannequinBase") or p_u_137.DisplayBlock
                v_u_3.make_not_included_tag(v138)
                return
            else
                local v_u_139 = v_u_1("DownloadClient")
                local v_u_140 = v_u_1("PetAccessoryEquipHelper")
                local v141 = p_u_137:FindFirstChild("DisplayModelReady")
                if v141 then
                    v141.Event:Connect(function(p142)
                        if p_u_137:IsDescendantOf(workspace) then
                            local v143 = p142:GetAttribute("ItemCategory")
                            local v144 = p142:GetAttribute("ItemKind")
                            local v145 = p142:GetAttribute("ItemIsInUse")
                            if v143 == "pets" then
                                local v146 = v_u_4.pets[v144]
                                local v147 = v146.anims
                                local v148 = v_u_2.get_track(v147.idle)
                                local v149 = v_u_2.get_track(v147.sit)
                                local v_u_150 = p142.PetModel
                                local v151 = v_u_150.AnimationController:LoadAnimation(v148)
                                v151.Priority = Enum.AnimationPriority.Core
                                local v152 = v_u_150.AnimationController:LoadAnimation(v149)
                                v152.Priority = Enum.AnimationPriority.Idle
                                v151:Play(0)
                                v152:Play(0)
                                v_u_9.PostSimulation:Once(function()
                                    v_u_150.Parent = p_u_137.Parent
                                end)
                                p142:GetPropertyChangedSignal("Parent"):Connect(function()
                                    v_u_150:Destroy()
                                end)
                                if v145 then
                                    v151:AdjustSpeed(0)
                                    v152:AdjustSpeed(0)
                                end
                                local v153 = p_u_136.displayed_worn_items or {}
                                local v154 = {}
                                local v155 = v_u_8:GetPlayerByUserId((p142:GetAttribute("ItemOwnerUserId")))
                                if v155 then
                                    for _, v156 in v153 do
                                        for _, v157 in v156 do
                                            local v158 = v_u_139.promise_download_display_data_for_item({
                                                ["owner_player"] = v155,
                                                ["display_type"] = "pet_accessory",
                                                ["item_unique"] = v157
                                            })
                                            table.insert(v154, v158)
                                        end
                                    end
                                    local v159 = v_u_7.all(v154):expect()
                                    if not p_u_137:IsDescendantOf(workspace) then
                                        return
                                    end
                                    local v160 = v146.baked_in_accessory_parts or {}
                                    local v161 = {}
                                    for _, v162 in v159 do
                                        if v162 then
                                            local v163 = v162.kind
                                            local v_u_164 = v_u_4.pet_accessories[v163]
                                            if v_u_164 and v_u_164.equip_type ~= "wings" then
                                                local v165 = v160[v163]
                                                if v165 then
                                                    for _, v166 in v165 do
                                                        local v167 = v_u_150:FindFirstChild(v166)
                                                        if v167 then
                                                            v167.Transparency = 0
                                                        end
                                                    end
                                                else
                                                    local v172 = v_u_139.promise_download_copy("PetAvatarResources", v_u_164.model_handle):andThen(function(p168)
                                                        if p_u_137:IsDescendantOf(workspace) then
                                                            local v169 = {
                                                                ["pet_model"] = v_u_150,
                                                                ["accessory_base_asset"] = p168,
                                                                ["accessory_item_entry"] = v_u_164,
                                                                ["play_poof_effect"] = false,
                                                                ["is_mannequin"] = true
                                                            }
                                                            local v_u_170 = v_u_140.equip_accessory(v169)
                                                            local v_u_171 = v_u_170.accessory
                                                            v_u_171.AncestryChanged:Connect(function()
                                                                if not v_u_171:IsDescendantOf(game) then
                                                                    v_u_170.unequip()
                                                                end
                                                            end)
                                                        end
                                                    end)
                                                    table.insert(v161, v172)
                                                end
                                            end
                                        end
                                    end
                                    v_u_7.all(v161):expect()
                                end
                            end
                        end
                    end)
                end
            end
        end
    }
end
return v10