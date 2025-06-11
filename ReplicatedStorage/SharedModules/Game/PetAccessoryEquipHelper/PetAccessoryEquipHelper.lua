--// ReplicatedStorage.SharedModules.Game.PetAccessoryEquipHelper (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v_u_2("CharacterScale")
local v_u_4 = v_u_2("ResizeM")
local v_u_5 = v_u_2("Maid")
local v_u_6 = v_u_2("Utilities")
local v_u_7 = v_u_2("InventoryDB")
local v_u_8 = v_u_2("PetAccessoryEffectsHelper")
local v_u_9 = v_u_2("new:PetRigs")
local v10 = v_u_2("package:t")
local v_u_11 = game:GetService("CollectionService")
local v_u_12 = {
    "head_crown",
    "head_top",
    "head_headphones",
    "head_hood",
    "head_corner",
    "face_eyes",
    "face_single_eye",
    "face_mouth",
    "neck_collar",
    "neck_front",
    "chest_badge",
    "back_wings",
    "back_backpack",
    "back_wings_alt"
}
local v_u_13 = { "shoe", "earring_left", "earring_right" }
local v_u_14 = { "WingsAttachment" }
local function v_u_17(p15)
    for _, v16 in ipairs(v_u_12) do
        if p15:FindFirstChild(v16 .. "_attachment", true) then
            return v16
        end
    end
end
local function v_u_20(p18)
    for _, v19 in ipairs(p18:GetDescendants()) do
        if v19:IsA("BasePart") then
            v19.Anchored = false
            v19.CanCollide = false
            v19.Massless = true
        end
    end
end
local function v_u_24(p21)
    local v22 = {}
    for _, v23 in ipairs(p21:GetDescendants()) do
        if v23.Name == "shoe_attachment" then
            table.insert(v22, v23)
        end
    end
    return v22
end
local function v_u_30(p25)
    local v26 = {}
    for _, v27 in v_u_24(p25) do
        local v28 = v27:FindFirstChild("PartsToHide")
        if v28 then
            for _, v29 in v28:GetChildren() do
                table.insert(v26, v29)
            end
        end
    end
    return v26
end
local function v_u_36(p31, p32)
    local v33 = game.ReplicatedStorage.Resources.Particles:FindFirstChild(p32 and "SmallEquipPoof" or "EquipPoof")
    for _, v34 in pairs(v33:GetChildren()) do
        local v35 = v34:Clone()
        v35.Parent = p31
        v35:Emit(20)
        game:GetService("Debris"):AddItem(v35, 10)
    end
end
local v_u_149 = {
    ["default"] = function(p_u_37, p38, p39, p40)
        local v41 = p40 or {}
        local v_u_42 = Instance.new("Model")
        v_u_42.Name = p39.name
        v_u_42:SetAttribute("PetAvatarItemKind", p39.kind)
        local v43 = v_u_17(p38) .. "_attachment"
        local v44 = v_u_3.get_scale_params(p_u_37.Parent)
        local v_u_45 = v44 and v44.scale or 1
        local v46 = p_u_37:FindFirstChild(v43, true)
        local v47 = v46:FindFirstChild("AccessoryScale")
        local v48 = (v47 and v47.Value or 1) * v_u_45
        local v49 = p38:Clone()
        local v50 = v49:FindFirstChild(v43, true)
        v_u_4.scale(v49, v48, v50.WorldPosition)
        v_u_20(v49)
        v49:SetAttribute("AccessoryNetScale", v48)
        local v51 = v50.Parent
        local v52 = Instance.new("RigidConstraint")
        v52.Attachment0 = v46
        v52.Attachment1 = v50
        v52.Parent = v51
        v49.Parent = v_u_42
        local v53 = v49:FindFirstChild("AnimationController")
        if v53 then
            local v54 = v46:FindFirstChild("AccessoryScale")
            local v55 = v54 and v54.Value or 1
            local v56 = Instance.new("NumberValue")
            v56.Value = v55
            v56.Name = "AnimationScale"
            v56.Parent = v53
            v_u_11:AddTag(v56, "AnimationScale")
        end
        v_u_42.Parent = p_u_37
        pcall(function()
            local v57 = p_u_37.HumanoidRootPart
            v57:SetNetworkOwner((v57:GetNetworkOwner()))
        end)
        if v41.play_poof_effect then
            v_u_36(v50.Parent, v41.is_small_poof)
        end
        return {
            ["accessory"] = v_u_42,
            ["post_effect"] = function()
                v_u_3.register_prescaled_instance(v_u_42, v_u_45)
            end,
            ["cleanup"] = function()
                v_u_42:Destroy()
            end
        }
    end,
    ["earrings"] = function(p_u_58, p59, p60, p61)
        local v_u_62 = Instance.new("Model")
        v_u_62.Name = p60.name
        v_u_62:SetAttribute("PetAvatarItemKind", p60.kind)
        local v63 = p59:Clone()
        v_u_20(v63)
        local v64 = v_u_3.get_scale_params(p_u_58.Parent)
        local v_u_65 = v64 and v64.scale or 1
        local v66 = p61 or {}
        local v67 = {}
        for _, v68 in ipairs({ "earring_left_attachment", "earring_right_attachment" }) do
            local v69 = v63:FindFirstChild(v68, true)
            local v70 = p_u_58:FindFirstChild(v68, true)
            local v71 = v70:FindFirstChild("AccessoryScale")
            local v72 = (v71 and v71.Value or 1) * v_u_65
            local v73 = v69.Parent.Parent
            v_u_4.scale(v73, v72, v69.WorldPosition)
            local v74 = v69.Parent
            local v75 = Instance.new("RigidConstraint")
            v75.Attachment0 = v70
            v75.Attachment1 = v69
            v75.Parent = v74
            if v66.play_poof_effect then
                local v76 = v69.Parent
                table.insert(v67, v76)
            end
            v63.Parent = v_u_62
            local v77 = v63:FindFirstChild("AnimationController")
            if v77 then
                local v78 = v70:FindFirstChild("AccessoryScale")
                local v79 = v78 and v78.Value or 1
                local v80 = Instance.new("NumberValue")
                v80.Value = v79
                v80.Name = "AnimationScale"
                v80.Parent = v77
                v_u_11:AddTag(v80, "AnimationScale")
            end
        end
        v_u_62.Parent = p_u_58
        pcall(function()
            local v81 = p_u_58.HumanoidRootPart
            v81:SetNetworkOwner((v81:GetNetworkOwner()))
        end)
        for _, v82 in ipairs(v67) do
            v_u_36(v82, v66.is_small_poof)
        end
        return {
            ["accessory"] = v_u_62,
            ["post_effect"] = function()
                v_u_3.register_prescaled_instance(v_u_62, v_u_65)
            end,
            ["cleanup"] = function()
                v_u_62:Destroy()
            end
        }
    end,
    ["shoes"] = function(p_u_83, p84, p85, p86)
        local v_u_87 = Instance.new("Model")
        v_u_87.Name = p85.name
        v_u_87:SetAttribute("PetAvatarItemKind", p85.kind)
        local v88 = p84:Clone()
        v_u_20(v88)
        local v89 = v_u_3.get_scale_params(p_u_83.Parent)
        local v_u_90 = v89 and v89.scale or 1
        local v_u_91 = v_u_5.new()
        local v92 = v_u_24(p_u_83)
        local v93 = p86 or {}
        local v94 = {}
        local v_u_95 = {}
        for _, v96 in ipairs(v92) do
            local v97 = v88:Clone()
            local v98 = v97:FindFirstChild("shoe_attachment", true)
            local v99 = v96:FindFirstChild("AccessoryScale")
            local v100 = (v99 and v99.Value or 1) * v_u_90
            v_u_4.scale(v97, v100, v98.WorldPosition)
            local v101 = v98.Parent
            local v102 = Instance.new("RigidConstraint")
            v102.Attachment0 = v96
            v102.Attachment1 = v98
            v102.Parent = v101
            if v93.play_poof_effect then
                local v103 = v98.Parent
                table.insert(v94, v103)
            end
            v97.Parent = v_u_87
        end
        local v104 = p84:FindFirstChild("RootPart")
        if v104 then
            v104 = p84:FindFirstChild("RootPart"):GetAttribute("ShowPetFeet")
        end
        local v105 = v_u_30(p_u_83)
        if v105 and not v104 then
            for _, v106 in v105 do
                local v_u_107 = v_u_9.get(p_u_83).get_geo_part(p_u_83, v106.Name)
                if v_u_107 then
                    v_u_95[v_u_107] = v_u_107.Transparency
                    local v_u_108 = false
                    v_u_107.Transparency = 1
                    v_u_91:GiveTask(v_u_107:GetPropertyChangedSignal("Transparency"):Connect(function()
                        if not v_u_108 then
                            v_u_108 = true
                            v_u_95[v_u_107] = v_u_107.Transparency
                            v_u_107.Transparency = 1
                            v_u_108 = false
                        end
                    end))
                end
            end
        end
        v_u_87.Parent = p_u_83
        pcall(function()
            local v109 = p_u_83.HumanoidRootPart
            v109:SetNetworkOwner((v109:GetNetworkOwner()))
        end)
        for _, v110 in ipairs(v94) do
            v_u_36(v110, v93.is_small_poof)
        end
        return {
            ["accessory"] = v_u_87,
            ["post_effect"] = function()
                v_u_3.register_prescaled_instance(v_u_87, v_u_90)
            end,
            ["cleanup"] = function()
                v_u_91:Destroy()
                for v111, v112 in pairs(v_u_95) do
                    v111.Transparency = v112
                end
                v_u_87:Destroy()
            end
        }
    end,
    ["wings"] = function(p_u_113, p114, p115, p116)
        local v117 = p116 or {}
        local v_u_118
        if v_u_1:IsServer() then
            v_u_118 = v_u_2("CharacterWrapper").get(p_u_113.Parent)
            v_u_118:set_property("custom_wings", p115.id)
        else
            v_u_118 = nil
        end
        if not (v117.is_mannequin or v117.play_poof_effect) then
            return {
                ["accessory"] = nil,
                ["post_effect"] = function() end,
                ["cleanup"] = function()
                    if v_u_118 then
                        v_u_118:set_property("custom_wings", nil)
                    end
                end
            }
        end
        local v119 = v_u_1:IsServer() and v_u_2("StateManager") or v_u_2("StateManagerClient")
        local v120 = v119.get(p_u_113.Parent)
        local v121
        if v120 then
            v121 = v120:has_state("PetBeingFlown")
        else
            v121 = v120
        end
        if v121 then
            if v_u_1:IsServer() then
                v119.get(v120.player.Character):exit_all_states()
            else
                v_u_2("StateManagerClient").exit_seat_states()
            end
        end
        local v_u_122 = v_u_2("TweenPromise")
        local v123 = v_u_2("package:Promise")
        local v124 = v_u_2("package:Sift")
        local v_u_125 = Instance.new("Model")
        v_u_125.Name = v117.is_mannequin and (p115.name or "temp_wings_equipped") or "temp_wings_equipped"
        v_u_125:SetAttribute("PetAvatarItemKind", p115.kind)
        local v126 = v_u_3.get_scale_params(p_u_113.Parent)
        local v_u_127 = v126 and v126.scale or 1
        local v128 = p_u_113:FindFirstChild("WingsAttachment", true)
        local v129 = v128:FindFirstChild("AccessoryScale")
        local v130 = (v129 and v129.Value or 1) * v_u_127
        local v131 = p114:Clone()
        local v132 = v131:FindFirstChild("WingsAttachment", true)
        v_u_4.scale(v131, v130, v132.WorldPosition)
        v_u_20(v131)
        v131:SetAttribute("AccessoryNetScale", v130)
        local v133 = v132.Parent
        local v134 = Instance.new("RigidConstraint")
        v134.Attachment0 = v128
        v134.Attachment1 = v132
        v134.Parent = v133
        v131.Parent = v_u_125
        v_u_125.PrimaryPart = v131.PrimaryPart
        v_u_125.Parent = p_u_113
        pcall(function()
            local v135 = p_u_113.HumanoidRootPart
            v135:SetNetworkOwner((v135:GetNetworkOwner()))
        end)
        if not v117.is_mannequin then
            v_u_36(v132.Parent, v117.is_small_poof)
        end
        if v_u_118 then
            local v136 = v_u_2("InventoryDB").pets[v_u_118.pet_id]
            if v136.flying_wings_color and v131:FindFirstChild("Colorable") then
                for _, v137 in v131.Colorable:GetDescendants() do
                    if v137:IsA("BasePart") then
                        v137.Color = v136.flying_wings_color
                    end
                end
            end
        end
        local v138 = v131:FindFirstChild("AnimationController")
        local v_u_139
        if v138 then
            local v140 = v128:FindFirstChild("AccessoryScale")
            local v141 = v140 and v140.Value or 1
            local v142 = Instance.new("NumberValue")
            v142.Value = v141
            v142.Name = "AnimationScale"
            v142.Parent = v138
            v_u_11:AddTag(v142, "AnimationScale")
            v_u_139 = v138:LoadAnimation((v_u_2("AnimationManager").get_track(p115.flap_animation or "PetFlyingWingFlap")))
            v_u_139:Play()
        else
            v_u_139 = nil
        end
        local v_u_143
        if v117.is_mannequin then
            v_u_143 = nil
        else
            local v_u_145 = v124.Dictionary.map(v_u_125:GetDescendants(), function(p144)
                if p144:IsA("BasePart") then
                    return p144.Transparency, p144
                else
                    return nil
                end
            end)
            v_u_143 = v123.delay(2):andThen(function()
                if v_u_125 then
                    return v_u_122.callback(0, 1, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), function(p146)
                        for v147, v148 in v_u_145 do
                            v147.Transparency = v148 + (1 - v148) * p146
                        end
                    end)
                end
            end):andThen(function()
                if v_u_125 then
                    v_u_125:Destroy()
                end
                if v_u_139 then
                    v_u_139:Stop(0)
                    v_u_139:Destroy()
                end
            end)
        end
        return {
            ["accessory"] = v_u_125,
            ["post_effect"] = function()
                v_u_3.register_prescaled_instance(v_u_125, v_u_127)
            end,
            ["cleanup"] = function()
                if v_u_143 then
                    v_u_143:cancel()
                end
                if v_u_125 then
                    v_u_125:Destroy()
                end
                if v_u_139 then
                    v_u_139:Stop(0)
                    v_u_139:Destroy()
                end
            end
        }
    end
}
local function v_u_159(p150, p151)
    local v152, v153 = v_u_6.getAlignedBoundingBox(p150:GetDescendants(), p151.CFrame)
    local v154 = p151.Size.X / v153.X
    local v155 = p151.Size.Y / v153.Y
    local v156 = p151.Size.Z / v153.Z
    local v157 = math.min(1, v154, v155, v156)
    v_u_4.scale(p150, v157, v152.Position)
    local v158 = p150.WorldPivot:ToObjectSpace(v152)
    p150:PivotTo(p151.CFrame * v158:Inverse())
end
local v_u_197 = {
    ["default"] = function(p160, p161)
        local v162 = game.ServerStorage.Downloadable.PetAvatarResources:FindFirstChild(p160.model_handle):Clone()
        v_u_20(v162)
        v162.Name = "AccessoryModel"
        v162.Parent = p161
        local v163 = v_u_17(v162)
        local v164 = v162:FindFirstChild(v163 .. "_attachment", true)
        local v165 = p161:FindFirstChild(v163 .. "_attachment", true)
        local v166 = v165:FindFirstChild("AccessoryScale") and (v165.AccessoryScale.Value or 1) or 1
        v_u_4.scale(v162, v166, (Vector3.new()))
        local v167 = v162:GetPivot():ToObjectSpace(v164.Parent.CFrame * v164.CFrame)
        v162:PivotTo(v165.Parent.CFrame * v165.CFrame * v167:Inverse())
        v_u_159(v162, p161.ConstraintBox)
        v_u_6.weld(v164.Parent, v165.Parent)
    end,
    ["earrings"] = function(p168, p169)
        local v170 = game.ServerStorage.Downloadable.PetAvatarResources:FindFirstChild(p168.model_handle):Clone()
        v_u_20(v170)
        v170.Name = "AccessoryModel"
        v170.Parent = p169
        local v171 = {}
        for _, v172 in { "earring_left_attachment", "earring_right_attachment" } do
            local v173 = v170:FindFirstChild(v172, true)
            if v173 then
                table.insert(v171, v173)
                local v174 = v173:FindFirstAncestorWhichIsA("Model")
                local v175 = p169:FindFirstChild(v172, true)
                local v176 = v175:FindFirstChild("AccessoryScale") and (v175.AccessoryScale.Value or 1) or 1
                v_u_4.scale(v174, v176, (Vector3.new()))
                local v177 = v174.WorldPivot:ToObjectSpace(v173.Parent.CFrame * v173.CFrame)
                v174:PivotTo(v175.Parent.CFrame * v175.CFrame * v177:Inverse())
            end
        end
        v_u_159(v170, p169.ConstraintBox)
        for _, v178 in v171 do
            v_u_6.weld(v178.Parent, p169.ConstraintBox)
        end
    end,
    ["shoes"] = function(p179, p180)
        local v181 = Instance.new("Model")
        v181.Name = "AccessoryModel"
        v181.Parent = p180
        local v182 = game.ServerStorage.Downloadable.PetAvatarResources:FindFirstChild(p179.model_handle)
        local v183 = {}
        for _, v184 in p180:GetDescendants() do
            if v184:IsA("Attachment") and v184.Name == "shoe_attachment" then
                local v185 = v182:Clone()
                v_u_20(v185)
                v185.Parent = v181
                local v186 = v185:FindFirstChild("shoe_attachment", true)
                table.insert(v183, v186)
                local v187 = v184:FindFirstChild("AccessoryScale") and (v184.AccessoryScale.Value or 1) or 1
                v_u_4.scale(v185, v187, (Vector3.new()))
                local v188 = v185.WorldPivot:ToObjectSpace(v186.Parent.CFrame * v186.CFrame)
                v185:PivotTo(v184.Parent.CFrame * v184.CFrame * v188:Inverse())
            end
        end
        v_u_159(v181, p180.ConstraintBox)
        for _, v189 in v183 do
            v_u_6.weld(v189.Parent, p180.ConstraintBox)
        end
    end,
    ["wings"] = function(p190, p191)
        local v192 = game.ServerStorage.Downloadable.PetAvatarResources:FindFirstChild(p190.model_handle):Clone()
        v_u_20(v192)
        v192.Name = "AccessoryModel"
        v192.Parent = p191
        local v193 = v192:FindFirstChild("WingsAttachment", true)
        local v194 = p191:FindFirstChild("WingsAttachment", true)
        local v195 = v194:FindFirstChild("AccessoryScale") and (v194.AccessoryScale.Value or 1) or 1
        v_u_4.scale(v192, v195, (Vector3.new()))
        local v196 = v192:GetPivot():ToObjectSpace(v193.Parent.CFrame * v193.CFrame)
        v192:PivotTo(v194.Parent.CFrame * v194.CFrame * v196:Inverse())
        v_u_159(v192, p191.ConstraintBox)
        v_u_6.weld(v193.Parent, p191.ConstraintBox)
        v_u_6.weld(p191.RightMount, v192.PrimaryPart)
    end
}
local function v_u_202(p198)
    local v199 = {}
    for _, v200 in ipairs(p198:GetChildren()) do
        if v200:IsA("Model") then
            local v201 = v200:GetAttribute("PetAvatarItemKind")
            if v201 then
                v199[v201] = {
                    ["model"] = v200
                }
            end
        end
    end
    return v199
end
local function v_u_217(p203)
    local v204 = 0
    local v205 = v_u_9.get(p203).get_part(p203, "Head")
    if v205 then
        local v206 = v205.CFrame * CFrame.new(0, v205.Size.Y / 2, 0)
        for v207, v208 in v_u_202(p203) do
            local v209 = v_u_7.pet_accessories[v207]
            if v209.accessory_type == "hats" then
                local v210 = v208.model:FindFirstChild(v209.model_handle)
                local v211
                if v210 then
                    v211 = v210:GetAttribute("HatHeightOverride")
                else
                    v211 = v210
                end
                if v211 then
                    local v212 = v211 * (v210:GetAttribute("AccessoryNetScale") or 1)
                    local v213 = tonumber(v212) or 0
                    v204 = math.max(v204, v213)
                else
                    local v214, v215 = v208.model:GetBoundingBox()
                    local v216 = v206:ToObjectSpace(v214 * CFrame.new(0, v215.Y / 2, 0)).Y
                    v204 = math.max(v204, v216)
                end
            end
        end
        p203:SetAttribute("MaxHatHeight", v204)
    end
end
local v_u_218 = v10.strictInterface({
    ["pet_model"] = v10.instanceOf("Model"),
    ["accessory_base_asset"] = v10.instanceOf("Model"),
    ["accessory_item_entry"] = v10.table,
    ["play_poof_effect"] = v10.optional(v10.boolean),
    ["is_mannequin"] = v10.optional(v10.boolean)
})
return {
    ["get_accessory_attachment_type"] = v_u_17,
    ["get_hold_model_for_accessory"] = function(p219)
        local v220 = p219.equip_type or "default"
        local v221 = game.ReplicatedStorage.AccessoryHandleTemplate:Clone()
        v_u_197[v220](p219, v221)
        return v221
    end,
    ["get_accessory_attachment_types_for_pet"] = function(p222)
        local v223 = {}
        for _, v224 in ipairs(v_u_12) do
            if p222:FindFirstChild(v224 .. "_attachment", true) then
                table.insert(v223, v224)
            end
        end
        for _, v225 in ipairs(v_u_13) do
            if p222:FindFirstChild(v225 .. "_attachment", true) then
                table.insert(v223, v225)
            end
        end
        for _, v226 in ipairs(v_u_14) do
            if p222:FindFirstChild(v226, true) then
                table.insert(v223, v226)
            end
        end
        return v223
    end,
    ["get_item_kind_from_accessory_model"] = function(p227)
        return p227:GetAttribute("PetAvatarItemKind")
    end,
    ["get_equipped_accessories_from_pet_model"] = v_u_202,
    ["get_has_shoes"] = function(p228)
        for v229 in v_u_202(p228) do
            local v230 = v_u_7.pet_accessories[v229].equip_type
            if v230 and v230 == "shoes" then
                return true
            end
        end
        return false
    end,
    ["get_shoe_hide_parts"] = v_u_30,
    ["equip_accessory"] = function(p231)
        local v232 = v_u_218
        assert(v232(p231))
        local v_u_233 = p231.pet_model
        local v234 = p231.accessory_base_asset
        local v235 = p231.accessory_item_entry
        local v236 = {
            ["play_poof_effect"] = p231.play_poof_effect,
            ["is_mannequin"] = p231.is_mannequin
        }
        local v237 = v_u_149[v235.equip_type or "default"](v_u_233, v234, v235, v236)
        local v238 = v237.accessory
        local v_u_239 = v237.cleanup
        local v_u_240 = {}
        if v235.static_effects then
            for _, v241 in ipairs(v235.static_effects) do
                local v242 = v_u_8.apply_effect(v_u_233, v238, v235, v241)
                table.insert(v_u_240, v242)
            end
        end
        v237.post_effect()
        v_u_217(v_u_233)
        return {
            ["accessory"] = v238,
            ["unequip"] = function()
                for _, v243 in ipairs(v_u_240) do
                    v243()
                end
                v_u_239()
                v_u_217(v_u_233)
            end
        }
    end,
    ["emit_poof"] = v_u_36
}