--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.SpecialEffectsApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("AltCurrencyData")
local v_u_3 = v_u_1("BattlePassDB")
local v_u_4 = v_u_1("CharWrapperClient")
local v5 = v_u_1("Class")
local v_u_6 = v_u_1("Debug")
local v_u_7 = v_u_1("InteractionsEngine")
local v_u_8 = v_u_1("InventoryDB")
local v_u_9 = v_u_1("package:Promise")
local v_u_10 = v_u_1("RouterClient")
local v_u_11 = v_u_1("SoundPlayer")
local v_u_12 = v_u_1("new:StreamingHelper")
local v_u_13 = v_u_1("TweenPromise")
local v_u_14 = v_u_1("Utilities")
local v_u_15 = v5("SpecialEffectsApp", v_u_1("UIBaseApp"))
function v_u_15.show(_) end
function v_u_15.hide(_) end
local v_u_16 = { "Babies", "Pets", "Dolls" }
local function v_u_28(p17)
    local v_u_18 = v_u_1("PetEntityManager")
    local v_u_19 = v_u_1("PetEntityHelper")
    local v_u_20 = v_u_1("PetPerformanceName")
    for _, v_u_21 in p17 do
        local v_u_22 = nil
        v_u_9.try(function()
            local v23 = v_u_12.get(v_u_21)
            if v23 then
                v_u_22 = v_u_18.get_pet_entity(v23)
                if v23 then
                    v23 = v23:FindFirstChild("Head")
                end
                if v23 then
                    if v_u_22 then
                        local v24 = v_u_19.stage_performance
                        local v25 = v_u_22
                        local v26 = {
                            ["name"] = v_u_20.SoundProvider,
                            ["options"] = {
                                ["looping_sounds"] = { "HealingLoop" }
                            }
                        }
                        v24(v25, v26)
                    end
                    local v27 = game.ReplicatedStorage:WaitForChild("Resources"):WaitForChild("Particles"):WaitForChild("HealingAura"):clone()
                    v_u_14.weld(v27.Root, v27.A)
                    v_u_14.weld(v27.Root, v27.B)
                    v27.Root.CFrame = v23.CFrame * CFrame.new(0, 1.2, 0)
                    v_u_14.weld(v23, v27.Root)
                    v27.Parent = workspace
                    v_u_9.delay(8):await()
                    v27:Destroy()
                end
            else
                return
            end
        end):finally(function()
            if v_u_22 then
                v_u_19.end_performance(v_u_22, v_u_20.SoundProvider)
            end
        end)
    end
end
local function v_u_36(p29, p30)
    local v31
    if p29 then
        v31 = p29:WaitForChild("HumanoidRootPart", 5)
    else
        v31 = p29
    end
    if v31 then
        local v32 = v31:FindFirstChild("Sick1")
        local v33 = v31:FindFirstChild("Sick2")
        if v32 then
            v32:Destroy()
        end
        if v33 then
            v33:Destroy()
        end
        local v34 = v_u_4.get_team(p29)
        if p30 and table.find(v_u_16, v34) then
            local v35 = game.ReplicatedStorage:WaitForChild("Resources"):WaitForChild("Particles")
            v35:WaitForChild("Sick1"):clone().Parent = v31
            v35:WaitForChild("Sick2"):clone().Parent = v31
        end
    end
end
function v_u_15.glow_effect(_, p_u_37, p38)
    if p_u_37:GetAttribute("GlowSpecialEffect") then
        return v_u_9.reject("The glow effect is already running")
    end
    p_u_37:SetAttribute("GlowSpecialEffect", true)
    local v39 = p38 or {}
    local v_u_40 = v39.duration or 1
    local v41 = v39.transition_start_length or 0.7
    local v_u_42 = v39.transition_end_length or 0.7
    local v_u_43 = {}
    local v_u_44 = {}
    local v_u_45 = {}
    for _, v46 in p_u_37:GetDescendants() do
        if v46:IsA("BasePart") then
            v_u_43[v46] = {
                ["Color"] = v46.Color,
                ["Material"] = v46.Material
            }
            v_u_44[v46] = v_u_13.new(v46, TweenInfo.new(v41, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["Color"] = v39.color or Color3.new(1, 1, 1)
            })
        end
    end
    local v_u_52 = v_u_9.delay(v41 * 0.35):andThen(function()
        for v47, _ in v_u_43 do
            v47.Material = Enum.Material.Neon
        end
        return v_u_9.all(v_u_44)
    end):andThen(function()
        return v_u_9.delay(v_u_40)
    end):andThen(function()
        for v48, v49 in v_u_43 do
            v_u_45[v48] = v_u_13.new(v48, TweenInfo.new(v_u_42, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Color"] = v49.Color
            })
        end
        return v_u_9.delay(v_u_42 * 0.65)
    end):andThen(function()
        for v50, v51 in v_u_43 do
            v50.Material = v51.Material
        end
        return v_u_9.all(v_u_45)
    end)
    v_u_9.try(function()
        v_u_52:await()
        for _, v53 in v_u_44 do
            v53:cancel()
        end
        for _, v54 in v_u_45 do
            v54:cancel()
        end
        for v55, v56 in v_u_43 do
            v55.Color = v56.Color
            v55.Material = v56.Material
        end
        p_u_37:SetAttribute("GlowSpecialEffect", nil)
    end)
    return v_u_52
end
function v_u_15.sprout_image(_, p57, p58, p59, p60)
    local v61 = game.Players.LocalPlayer.Character
    if v61 then
        v61 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    end
    if v61 then
        local v62 = p57 and p57.Character
        if v62 then
            v62 = p57.Character:FindFirstChild("HumanoidRootPart")
        end
        if v62 then
            if (v61.Position - v62.Position).magnitude <= 300 then
                if not (p60 and p60.mute) then
                    v_u_11.FX:play("Roleplay/JobPay", v62)
                end
                local v63 = game.ReplicatedStorage:WaitForChild("Resources"):WaitForChild("Particles")
                local v64 = {
                    ["A"] = v63:WaitForChild("BucksSproutA-" .. p58):Clone(),
                    ["B"] = v63:WaitForChild("BucksSproutB-" .. p58):Clone()
                }
                for v65, v66 in v64 do
                    if p59 then
                        if v65 == "A" then
                            v66.Texture = "rbxassetid://4508224937"
                        else
                            v66.Texture = p59
                        end
                    end
                    v66.Name = ("Sprout%s-%s"):format(v65, p58)
                    v66.Parent = v62
                end
                task.wait(p58 == "small" and 1 or 4)
                for _, v67 in v64 do
                    v67.Enabled = false
                    game.Debris:AddItem(v67, 4)
                end
            end
        else
            return
        end
    else
        return
    end
end
function v_u_15.sprout_currency(_, p68, p69, p70, p71)
    if p70 == v_u_2.name then
        if v_u_2.developer_products and v_u_2.developer_products[1] then
            v_u_15:sprout_image(p68, p69, v_u_2.developer_products[1].image_id, p71)
        end
    else
        v_u_15:sprout_image(p68, p69, nil, p71)
        return
    end
end
function v_u_15.sprout_battle_pass_xp(_, p72, p73, p74, p75)
    local v76 = p75 or {}
    local v77 = v_u_3[p73]
    if v77 then
        local v78 = v77.sprout_images
        if v78 then
            local v79 = game.Players.LocalPlayer.Character
            if v79 then
                v79 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            end
            if v79 then
                local v80 = p72 and p72.Character
                if v80 then
                    v80 = p72.Character:FindFirstChild("HumanoidRootPart")
                end
                if v80 then
                    if (v79.Position - v80.Position).magnitude <= 300 then
                        if not v76.mute then
                            v_u_11.FX:play("Roleplay/JobPay", v80)
                        end
                        local v81 = game.ReplicatedStorage:WaitForChild("Resources"):WaitForChild("Particles")
                        local v82 = {
                            ["A"] = v81:WaitForChild("BucksSproutA-" .. p74):Clone(),
                            ["B"] = v81:WaitForChild("BucksSproutB-" .. p74):Clone()
                        }
                        for v83, v84 in v82 do
                            v84.Texture = v78[v83]
                            v84.Name = ("%sSprout%s-%s"):format(v77.display_name, v83, p74)
                            v84.Parent = v80
                        end
                        task.wait(p74 == "small" and 1 or 4)
                        for _, v85 in v82 do
                            v85.Enabled = false
                            game.Debris:AddItem(v85, 4)
                        end
                    end
                else
                    return
                end
            else
                return
            end
        else
            return
        end
    else
        return
    end
end
function v_u_15.level_up_effect(_, p86)
    local v87 = game.ReplicatedStorage:WaitForChild("Resources"):WaitForChild("Particles"):WaitForChild("LevelUp")
    if p86:IsDescendantOf(workspace) then
        if p86:FindFirstChild("HumanoidRootPart") then
            local v88 = Instance.new("Attachment")
            v88.Parent = p86.HumanoidRootPart
            for _, v89 in pairs(v87:GetChildren()) do
                v89:clone().Parent = v88
            end
            game:GetService("ContentProvider"):PreloadAsync({ v88 })
            for _, v90 in pairs(v88:GetChildren()) do
                v90.Enabled = true
            end
            wait(0.2)
            for _, v91 in pairs(v88:GetChildren()) do
                v91.Enabled = false
            end
            game:GetService("Debris"):AddItem(v88, 10)
        end
    else
        return
    end
end
function v_u_15.level_up_friendship_effect(_, p92)
    local v93 = game.ReplicatedStorage:FindFirstChild("Resources")
    if v93 then
        v93 = game.ReplicatedStorage.Resources:FindFirstChild("Particles")
    end
    if v93 then
        v93 = v93:FindFirstChild("FriendshipLevelUp")
    end
    if v93 then
        v93 = v93:FindFirstChild("FriendshipLevelUpPart")
    end
    if v93 then
        if p92:IsDescendantOf(workspace) then
            if p92:FindFirstChild("HumanoidRootPart") then
                local v94 = v_u_1("PetEntityManager")
                local v95 = v93:Clone()
                v95.Parent = workspace
                local v96 = Instance.new("Weld")
                v96.Part0 = v95
                v96.Part1 = p92.HumanoidRootPart
                v96.Parent = v95
                game:GetService("ContentProvider"):PreloadAsync({ v95 })
                local v97 = v94.get_pet_entity(p92)
                if v97 then
                    v97.sounds.play_sound("FriendshipGlow")
                end
                local v98 = v_u_15:glow_effect(p92, {
                    ["duration"] = 1.6,
                    ["transition_start_length"] = 0.8,
                    ["transition_end_length"] = 0.8,
                    ["color"] = Color3.fromRGB(255, 224, 105)
                })
                v98:catch(function(p99)
                    warn((tostring(p99)))
                end)
                if v98:getStatus() ~= v_u_9.Status.Rejected then
                    task.wait(0.4)
                end
                for _, v100 in v95:GetDescendants() do
                    if v100:IsA("ParticleEmitter") then
                        v100:Emit(v100:GetAttribute("EmitCount"))
                    end
                end
                game:GetService("Debris"):AddItem(v95, 10)
            end
        else
            return
        end
    else
        return
    end
end
function v_u_15.hatch_effect(p101, p_u_102)
    local v103 = v_u_4.get(p_u_102)
    if v103 then
        v103 = v103.player == game.Players.LocalPlayer
    end
    if v103 then
        v_u_7:disable(p101.ClassName)
    end
    v_u_6.pcall_warn_error(function()
        local v104 = game.ReplicatedStorage:WaitForChild("Resources"):WaitForChild("Particles"):WaitForChild("Hatch")
        if p_u_102:IsDescendantOf(workspace) then
            if p_u_102:FindFirstChild("HumanoidRootPart") then
                if p_u_102:FindFirstChild("Humanoid") then
                    if not p_u_102.Humanoid.Sit then
                        p_u_102.HumanoidRootPart.Anchored = true
                    end
                    local v_u_105 = p_u_102.HumanoidRootPart:clone()
                    v_u_105.CanCollide = false
                    v_u_105:ClearAllChildren()
                    v_u_105.Parent = p_u_102.Parent
                    local v_u_106 = Instance.new("Weld")
                    v_u_106.Part0 = p_u_102.HumanoidRootPart
                    v_u_106.Part1 = v_u_105
                    v_u_106.Parent = v_u_105
                    p_u_102.AncestryChanged:connect(function(_, p107)
                        if p107 == nil then
                            v_u_105.Anchored = true
                        end
                    end)
                    local v_u_112 = v_u_10.get_event("PetAPI/PetHatched").OnClientEvent:connect(function(p108, p109)
                        local v110, v111 = v_u_12.await_many(5, p108, p109)
                        if v110 and v111 then
                            if v110 == p_u_102 then
                                v_u_106.Part0 = v111
                                v_u_105.Anchored = false
                            end
                        else
                            return
                        end
                    end)
                    game:GetService("Debris"):AddItem(v_u_105, 15)
                    local v113 = Instance.new("Attachment")
                    v113.Parent = v_u_105
                    for _, v114 in pairs(v104:GetChildren()) do
                        v114:clone().Parent = v113
                    end
                    game:GetService("ContentProvider"):PreloadAsync({ v113 })
                    for _, v115 in pairs(v113:GetChildren()) do
                        v115.Enabled = true
                    end
                    wait(0.2)
                    for _, v116 in pairs(v113:GetChildren()) do
                        v116.Enabled = false
                    end
                    game:GetService("Debris"):AddItem(v113, 10)
                    task.delay(10, function()
                        v_u_112:Disconnect()
                    end)
                    wait(4)
                end
            else
                return
            end
        else
            return
        end
    end)
    if v103 then
        v_u_7:enable(p101.ClassName)
    end
end
function v_u_15.placement_effect(_, p117)
    local v_u_118 = game.ReplicatedStorage:WaitForChild("Resources"):WaitForChild("Particles"):WaitForChild("PlacementParticles"):Clone()
    v_u_118:SetPrimaryPartCFrame(p117.CFrame * CFrame.new(0, 2, 0))
    v_u_118.Parent = p117.Parent
    local v119 = {
        [v_u_118.Blast.Circle] = 15,
        [v_u_118.Blast.Cloud1] = 20,
        [v_u_118.Blast.Cloud2] = 20
    }
    for v120, v121 in pairs(v119) do
        v120:Emit(v121)
    end
    task.delay(1, function()
        if v_u_118.Parent then
            v_u_118.Dust.Dust:Emit(10)
        end
    end)
    game:GetService("Debris"):AddItem(v_u_118, 10)
end
function v_u_15.poof_effect(_, p122)
    for _, v123 in game.ReplicatedStorage.Resources.Particles.EquipPoof:GetChildren() do
        local v124 = v123:Clone()
        local v125 = Instance.new("Attachment")
        v124.Parent = v125
        v125.Position = p122
        v125.Parent = workspace.Terrain
        v124:Emit(10)
        game:GetService("Debris"):AddItem(v125, 10)
    end
end
function v_u_15.start(p_u_126)
    v_u_10.get_event("ProductsAPI/CurrencySproutedOutOfCharacterEffect").OnClientEvent:connect(function(...)
        p_u_126:sprout_currency(...)
    end)
    v_u_10.get_event("BattlePassAPI/BattlePassXpSproutedOutOfCharacterEffect").OnClientEvent:connect(function(...)
        p_u_126:sprout_battle_pass_xp(...)
    end)
    v_u_10.get_event("AilmentsAPI/ShowHealingEffect").OnClientEvent:connect(v_u_28)
    v_u_4.register_property_changed("sick", function(p127, p128, _)
        local v129 = v_u_4.get(p127)
        if v129 then
            if v129.is_pet then
                return
            else
                task.wait()
                if v_u_4.get(p127) then
                    v_u_36(p127, p128)
                end
            end
        else
            return
        end
    end)
    v_u_4.register_property_changed("pet_progression", function(p130, p_u_131, p132)
        if p_u_131 and p132 then
            local v133 = v_u_4.get(p130)
            if v133 then
                local v_u_134 = v_u_8.pets[v133.pet_id]
                if p_u_131.age > p132.age then
                    if v_u_134.is_egg then
                        p_u_126:hatch_effect(p130)
                    else
                        if v133.player == game.Players.LocalPlayer then
                            task.delay(1, function()
                                local v135
                                if p_u_131.age > #v_u_134.tricks or v_u_134.is_doll then
                                    v135 = "Your " .. v_u_134.name .. " aged up!"
                                else
                                    v135 = "Your " .. v_u_134.name .. " aged up! New pet trick available"
                                end
                                p_u_126.UIManager.apps.HintApp:hint({
                                    ["text"] = v135
                                })
                            end)
                        end
                        p_u_126:level_up_effect(p130)
                    end
                else
                    if (p_u_131.friendship_level or 0) > (p132.friendship_level or 0) then
                        if v133.player == game.Players.LocalPlayer then
                            task.delay(1, function()
                                p_u_126.UIManager.apps.HintApp:hint({
                                    ["text"] = "Friendship has increased with your " .. v_u_134.name .. "!"
                                })
                            end)
                        end
                        p_u_126:level_up_friendship_effect(p130)
                    end
                    return
                end
            else
                return
            end
        else
            return
        end
    end)
end
return v_u_15