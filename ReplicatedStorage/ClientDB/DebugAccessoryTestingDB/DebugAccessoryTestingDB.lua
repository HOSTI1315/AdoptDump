--// ReplicatedStorage.ClientDB.DebugAccessoryTestingDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InventoryDB")
local v_u_3 = v1("AnimationManager")
local v_u_4 = v1("PetAccessoryEquipHelper")
local v_u_5 = v1("PetAccessoryCompatHelper")
local v_u_6 = v1("package:Sift")
local v_u_7 = {
    "running",
    "idle",
    "sleep",
    "sit",
    "hold",
    "double_hold",
    "eating"
}
local function v_u_13(p8, p9, p10)
    local v11 = Instance.new("BillboardGui")
    v11.Size = UDim2.new(0, 100, 0, 24)
    v11.StudsOffsetWorldSpace = p10
    local v12 = Instance.new("TextLabel")
    v12.Parent = v11
    v12.Text = p9
    v12.Size = UDim2.new(0, 100, 0, 24)
    v12.TextScaled = true
    v12.BackgroundTransparency = 1
    v12.TextColor3 = Color3.new(1, 1, 1)
    v12.TextStrokeTransparency = 0
    v12.TextStrokeColor3 = Color3.new(0, 0, 0)
    v12.TextXAlignment = Enum.TextXAlignment.Center
    v12.Font = Enum.Font.RobotoMono
    v11.Parent = p8
end
local function v_u_17(p14)
    local v15 = game.ServerStorage.ServerResources.Pets[p14.model]:Clone()
    for _, v16 in pairs(v15:GetDescendants()) do
        if v16:IsA("BasePart") then
            v16.Anchored = false
            v16.CanCollide = false
            v16.Massless = true
        end
    end
    v15.HumanoidRootPart.Anchored = true
    v15.PrimaryPart = v15.HumanoidRootPart
    return v15
end
local v18 = {}
local function v_u_27(p19, p20)
    p19.state.animation = p20
    for _, v21 in ipairs(p19.state.displays) do
        if v21.playing_track then
            v21.playing_track:Stop()
            v21.playing_track:Destroy()
            v21.playing_track = nil
        end
        local v22 = v21.pet_model
        local v23 = v21.pet_entry
        local v24 = v22.AnimationController
        local v25 = v23.anims[p20]
        local v26
        if v25 then
            v26 = v24:LoadAnimation((v_u_3.get_track(v25)))
        else
            v26 = nil
        end
        if v26 then
            v26:Play()
            v26:AdjustSpeed(p19.state.animation_speed)
            v21.playing_track = v26
        end
    end
end
local function v_u_38(p28, p29)
    p28.state.accessory = p29
    local v30 = v_u_2.pet_accessories[p29]
    for _, v31 in ipairs(p28.state.displays) do
        if v31.equipped_accessory then
            v31.equipped_accessory.unequip()
            v31.equipped_accessory = nil
        end
        if v_u_5.can_equip_on_pet(v30.kind, v31.pet_entry.kind) then
            local v32 = {
                ["pet_model"] = v31.pet_model,
                ["accessory_base_asset"] = game.ServerStorage.Downloadable.PetAvatarResources:FindFirstChild(v30.model_handle),
                ["accessory_item_entry"] = v30
            }
            v31.equipped_accessory = v_u_4.equip_accessory(v32)
        end
    end
    local v33 = p28.accessory_display_sign
    v33.RenderImage.Image = v30.image
    local v34 = v30.name
    local v35 = v30.rarity
    local v36 = not v30.cost and "None" or ("%d %s"):format(v30.cost, v30.currency_id or "bucks")
    local v37 = v30.is_in_hatshop_rotation and "Yes" or "No"
    v33.TextLabel.Text = ("Name: %s\nRarity: %s\nCost: %s\nCan appear randomly in hat shop?: %s\n"):format(v34, v35, v36, v37)
end
v18.test_accessory = {
    ["init"] = function(p39)
        p39.accessory_display_sign.Enabled = true
        p39.state.displays = {}
        for _, v40 in pairs(v_u_2.pets) do
            if not v40.is_egg and (v40.is_customizable and not v40.permanently_delete_all_copies_of_this_item_from_the_game) then
                local v41 = {
                    ["pet_model"] = v_u_17(v40),
                    ["pet_entry"] = v40
                }
                local v42 = p39.state.displays
                table.insert(v42, v41)
            end
        end
        table.sort(p39.state.displays, function(p43, p44)
            return p43.pet_entry.id < p44.pet_entry.id
        end)
        local v45 = p39.start_corner
        for v46, v47 in ipairs(p39.state.displays) do
            local v48 = v46 % 15
            local v49 = v46 / 15
            local v50 = math.floor(v49)
            local v51 = v45 * CFrame.new(-v48 * 8, 0, v50 * 8)
            local v52 = v47.pet_model
            local _ = v47.pet_entry
            local v53 = v52:GetAttribute("HipHeight")
            v52:SetPrimaryPartCFrame(v51 * CFrame.new(0, v52.HumanoidRootPart.Size.Y / 2 + v53, 0), 0)
            v52.Parent = workspace
        end
        v_u_38(p39, "cowboy_hat")
        v_u_27(p39, "idle")
    end,
    ["cleanup"] = function(p54)
        for _, v55 in ipairs(p54.state.displays) do
            if v55.equipped_accessory then
                v55.equipped_accessory.unequip()
            end
            v55.pet_model:Destroy()
        end
    end,
    ["set_debug_option"] = function(p56, p57, p58)
        if p57 == "accessory" then
            v_u_38(p56, p58)
            return ("Accessory has been set to %s."):format(p58)
        end
        if p57 == "animation" then
            v_u_27(p56, p58)
            return ("Animation has been set to %s."):format(p58)
        end
    end,
    ["get_cmdr_debug_option_enum"] = function(p59)
        return p59.Cmdr.Util.MakeEnumType("Debug Option", { "accessory", "animation" })
    end,
    ["get_cmdr_debug_option_arg"] = function(p60, p61)
        if p61 == "accessory" then
            return {
                ["Type"] = p60.Cmdr.Util.MakeEnumType("Accessory", v_u_6.Dictionary.keys(v_u_2.pet_accessories)),
                ["Name"] = "Accessory",
                ["Description"] = "Accessory to display on all pets."
            }
        end
        if p61 == "animation" then
            return {
                ["Type"] = p60.Cmdr.Util.MakeEnumType("Animation", v_u_7),
                ["Name"] = "Animation",
                ["Description"] = "Animation to play on all pets."
            }
        end
    end
}
local function v_u_82(p62, p63)
    p62.state.pet = p63
    local v64 = v_u_2.pets[p63]
    for v65 = 1, #p62.state.displays do
        local v66 = p62.state.displays[v65]
        if v66.equipped_accessory then
            v66.equipped_accessory.unequip()
        end
        v66.pet_model:Destroy()
    end
    p62.state.displays = {}
    local v67 = p62.start_corner
    local v68 = 1
    for _, v69 in pairs(v_u_2.pet_accessories) do
        local v70 = v68 % 15
        local v71 = v68 / 15
        local v72 = math.floor(v71)
        local v73 = v67 * CFrame.new(-v70 * 8, 0, v72 * 8)
        local v74 = {}
        local v75 = v_u_17(v64)
        local v76 = v75:GetAttribute("HipHeight")
        v75:SetPrimaryPartCFrame(v73 * CFrame.new(0, v75.HumanoidRootPart.Size.Y / 2 + v76, 0), 0)
        v75.Parent = workspace
        v74.pet_model = v75
        if v_u_5.can_equip_on_pet(v69.kind, v64.kind) then
            local v77 = {
                ["pet_model"] = v75,
                ["accessory_base_asset"] = game.ServerStorage.Downloadable.PetAvatarResources:FindFirstChild(v69.model_handle),
                ["accessory_item_entry"] = v69
            }
            v74.equipped_accessory = v_u_4.equip_accessory(v77)
        end
        if p62.state.animation then
            local v78 = p62.state.animation
            local v79 = v75.AnimationController
            local v80 = v64.anims[v78]
            local v81
            if v80 then
                v81 = v79:LoadAnimation((v_u_3.get_track(v80)))
            else
                v81 = nil
            end
            if v81 then
                v81:Play()
                v81:AdjustSpeed(p62.state.animation_speed)
                v74.playing_track = v81
            end
        end
        p62.state.displays[v68] = v74
        v68 = v68 + 1
    end
end
local function v_u_90(p83, p84)
    p83.state.animation = p84
    local v85 = v_u_2.pets[p83.state.pet]
    for _, v86 in ipairs(p83.state.displays) do
        if v86.playing_track then
            v86.playing_track:Stop()
            v86.playing_track:Destroy()
            v86.playing_track = nil
        end
        local v87 = v86.pet_model.AnimationController
        local v88 = v85.anims[p84]
        local v89
        if v88 then
            v89 = v87:LoadAnimation((v_u_3.get_track(v88)))
        else
            v89 = nil
        end
        if v89 then
            v89:Play()
            v89:AdjustSpeed(p83.state.animation_speed)
            v86.playing_track = v89
        end
    end
end
v18.test_pet_accessories = {
    ["init"] = function(p91)
        p91.accessory_display_sign.Enabled = false
        p91.state.displays = {}
        v_u_82(p91, "dog")
        v_u_90(p91, "idle")
    end,
    ["cleanup"] = function(p92)
        for _, v93 in ipairs(p92.state.displays) do
            if v93.equipped_accessory then
                v93.equipped_accessory.unequip()
            end
            v93.pet_model:Destroy()
        end
    end,
    ["set_debug_option"] = function(p94, p95, p96)
        if p95 == "pet" then
            v_u_82(p94, p96)
            return ("Pet has been set to %s."):format(p96)
        end
        if p95 == "animation" then
            v_u_90(p94, p96)
            return ("Animation has been set to %s."):format(p96)
        end
    end,
    ["get_cmdr_debug_option_enum"] = function(p97)
        return p97.Cmdr.Util.MakeEnumType("Debug Option", { "pet", "animation" })
    end,
    ["get_cmdr_debug_option_arg"] = function(p98, p99)
        if p99 == "pet" then
            return {
                ["Type"] = p98.Cmdr.Util.MakeEnumType("Pet", v_u_6.Dictionary.keys(v_u_2.pets)),
                ["Name"] = "Pet",
                ["Description"] = "Pet to test."
            }
        end
        if p99 == "animation" then
            return {
                ["Type"] = p98.Cmdr.Util.MakeEnumType("Animation", v_u_7),
                ["Name"] = "Animation",
                ["Description"] = "Animation to play on all pets."
            }
        end
    end
}
local function v_u_128(p100, p101)
    p100.state.pet = p101
    local v102 = v_u_2.pets[p101]
    for v103 = 1, #p100.state.displays do
        p100.state.displays[v103].pet_model:Destroy()
    end
    p100.state.displays = {}
    local v104 = p100.start_corner
    local v105 = 1
    for _, v106 in ipairs(v_u_7) do
        local v107 = v105 % 15
        local v108 = v105 / 15
        local v109 = math.floor(v108)
        local v110 = v104 * CFrame.new(-v107 * 8, 0, v109 * 8)
        local v111 = {}
        local v112 = v_u_17(v102)
        local v113 = v112:GetAttribute("HipHeight")
        v112:SetPrimaryPartCFrame(v110 * CFrame.new(0, v112.HumanoidRootPart.Size.Y / 2 + v113, 0), 0)
        v112.Parent = workspace
        v111.pet_model = v112
        local v114 = v112.AnimationController
        local v115 = v102.anims[v106]
        local v116
        if v115 then
            v116 = v114:LoadAnimation((v_u_3.get_track(v115)))
        else
            v116 = nil
        end
        if v116 then
            v116:Play()
            v116:AdjustSpeed(p100.state.animation_speed)
            v111.playing_track = v116
        end
        p100.state.displays[v105] = v111
        v_u_13(v112.HumanoidRootPart, v106, Vector3.new(0, 4, 0))
        v105 = v105 + 1
    end
    if v102.tricks then
        for _, v117 in v102.tricks do
            local v118 = v117[1]
            local v119 = v117[2]
            local v120 = v105 % 15
            local v121 = v105 / 15
            local v122 = math.floor(v121)
            local v123 = v104 * CFrame.new(-v120 * 8, 0, v122 * 8)
            local v124 = {}
            local v125 = v_u_17(v102)
            local v126 = v125:GetAttribute("HipHeight")
            v125:SetPrimaryPartCFrame(v123 * CFrame.new(0, v125.HumanoidRootPart.Size.Y / 2 + v126, 0), 0)
            v125.Parent = workspace
            v124.pet_model = v125
            local v127 = v125.AnimationController:LoadAnimation((v_u_3.get_track(v119)))
            v127.Looped = true
            v127:Play()
            v127:AdjustSpeed(p100.state.animation_speed)
            v124.playing_track = v127
            p100.state.displays[v105] = v124
            v_u_13(v125.HumanoidRootPart, ("%s : %s"):format(v118, v119), Vector3.new(0, 4, 0))
            v105 = v105 + 1
        end
    end
end
v18.test_pet_animations = {
    ["init"] = function(p129)
        p129.accessory_display_sign.Enabled = false
        p129.state.displays = {}
        v_u_128(p129, "dog")
    end,
    ["cleanup"] = function(p130)
        for _, v131 in ipairs(p130.state.displays) do
            v131.pet_model:Destroy()
        end
    end,
    ["set_debug_option"] = function(p132, p133, p134)
        if p133 == "pet" then
            v_u_128(p132, p134)
            return ("Pet has been set to %s."):format(p134)
        end
    end,
    ["get_cmdr_debug_option_enum"] = function(p135)
        return p135.Cmdr.Util.MakeEnumType("Debug Option", { "pet" })
    end,
    ["get_cmdr_debug_option_arg"] = function(p136, p137)
        if p137 == "pet" then
            return {
                ["Type"] = p136.Cmdr.Util.MakeEnumType("Pet", v_u_6.Dictionary.keys(v_u_2.pets)),
                ["Name"] = "Pet",
                ["Description"] = "Pet to test."
            }
        end
    end
}
return v18