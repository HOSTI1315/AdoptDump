--// ReplicatedStorage.SharedModules.PetObjectHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("InventoryDB")
local v_u_3 = v_u_1("new:StreamingHelper")
local v_u_4 = v_u_1("TweenPromise")
local v_u_5 = v_u_1("package:Promise")
local v_u_6 = v_u_1("package:Sift")
local v_u_7 = game:GetService("TweenService")
local v_u_8 = game:GetService("RunService")
local v_u_9 = game.ReplicatedStorage.Resources.Particles:FindFirstChild("EquipPoof")
local v_u_10 = Random.new()
local v_u_11 = {}
local function v_u_47(p_u_12, p13, p14)
    local v15 = v_u_8
    assert(v15:IsClient())
    local v_u_16 = v_u_1("SoundPlayer")
    local v17 = v_u_1("ToolHandleHelper")
    local v18 = v_u_1("UIManager").is_visible("FocusPetApp")
    local v_u_19, v20 = v_u_3.await_many(5, p13, p14)
    if v_u_19 and v20 then
        local v21 = v20:FindFirstChild("HumanoidRootPart")
        local v22 = v20:FindFirstChild("Humanoid")
        if v21 and v22 then
            local v_u_23 = v22.HipHeight + v21.Size.Y / 2
            local v24 = CFrame.new
            local v25 = v21.CFrame + v21.CFrame.LookVector * 5
            local v26 = -v_u_23
            local v_u_27 = v24((v25 + Vector3.new(0, v26, 0)).Position)
            local v28 = RaycastParams.new()
            v28.FilterDescendantsInstances = { v20, p_u_12.Character }
            local v29 = v_u_27.Position - v21.Position
            local v30 = 2.2 * v_u_23
            local v31 = v29 + Vector3.new(0, v30, 0)
            local v32 = workspace:Blockcast(v21.CFrame, Vector3.new(1, 1, 1), v31, v28)
            local v33 = v_u_19.PrimaryPart
            if v32 or v18 then
                if p_u_12 == game.Players.LocalPlayer then
                    v_u_11.equip_item_from_pet_object(v_u_19)
                end
                v_u_19:Destroy()
                v33 = p_u_12.Character
                if v33 then
                    v33 = p_u_12.Character:FindFirstChild("RightHand")
                end
            end
            if v_u_9 and (v33 and not v18) then
                for _, v34 in v_u_9 and v_u_9:GetChildren() or {} do
                    local v35 = v34:Clone()
                    v35.Parent = v33
                    v35:Emit(20)
                    game:GetService("Debris"):AddItem(v35, 10)
                end
                v_u_16.FX:play("AgePotionSpawn", v33)
            end
            if not (v32 or v18) then
                local v_u_36 = v17.get_largest_part(v_u_19:GetDescendants())
                v_u_19.PrimaryPart = v_u_36
                v_u_36.Anchored = true
                task.delay(2.1, function()
                    v_u_16.FX:play("AgePotionShakeFly", v_u_36)
                end)
                v_u_4.callback(0, 1, TweenInfo.new(3.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), function(p37)
                    local v38 = CFrame.Angles(0, 25.132741228718345 * p37, 0)
                    if p37 > 0.5 then
                        local v39 = 0.10471975511965977 * v_u_7:GetValue((p37 - 0.5) / 0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
                        v38 = v38 * CFrame.Angles(v39 * v_u_10:NextNumber(-1, 1), v39 * v_u_10:NextNumber(-1, 1), v39 * v_u_10:NextNumber(-1, 1))
                    end
                    local v40 = v_u_19
                    local v41 = v_u_27 * v38
                    local v42 = 2.2 * v_u_23 * p37
                    v40:PivotTo(v41 + Vector3.new(0, v42, 0))
                end):finally(function()
                    if v_u_36 and v_u_36:IsDescendantOf(workspace) then
                        v_u_36.Anchored = false
                        if p_u_12 == game.Players.LocalPlayer then
                            v_u_36.AssemblyLinearVelocity = CFrame.Angles(0, v_u_10:NextNumber(0, 6.283185307179586), 0).LookVector * 50 + Vector3.new(0, 25, 0)
                            local v43 = v_u_36
                            local v44 = v_u_10:NextNumber()
                            local v45 = v_u_10:NextNumber()
                            local v46 = v_u_10
                            v43.AssemblyAngularVelocity = Vector3.new(v44, v45, v46:NextNumber()) * 8
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
end
local function v_u_58(p48, p49, p50)
    local v51 = v_u_1("ClientData")
    local v52 = v_u_1("ClientToolManager")
    local v53 = v_u_1("PetEntityManager")
    local v54 = v_u_3.await(p50, 5)
    local v55 = v54 and v53.get_pet_entity(v54)
    if v55 then
        v55.sounds.play_sound("ReturnFetchToy")
    end
    local v56 = v51.get("inventory")
    if v56 then
        v56 = v56[p48]
    end
    if v56 then
        local v57 = v56[p49]
        if v57 then
            v52.equip(v57)
        end
    else
        return
    end
end
function v_u_11.get_item_entry(p59, p60)
    local v61 = v_u_8
    assert(v61:IsServer())
    local v62 = v_u_1("DataM")
    if p60.unique_id then
        return v62.get_store(p59):get("inventory"):get_item(p60.unique_id).entry
    elseif p60.category and p60.kind then
        return v_u_2[p60.category][p60.kind]
    else
        return nil
    end
end
function v_u_11.equip_item_from_pet_object(p63)
    local v64 = v_u_8
    assert(v64:IsClient())
    local v65 = v_u_1("ClientToolManager")
    local v66 = v_u_1("ClientData")
    local v67 = p63:FindFirstChild("ItemUniqueId")
    local v68 = p63:FindFirstChild("ItemCategory")
    if v67 or not v68 then
        local v69 = v67.Value
        local v70 = v68.Value
        local v71 = v66.get("inventory")
        if v71 then
            v71 = v71[v70]
        end
        if v71 then
            local v72 = v71[v69]
            if v72 then
                v65.equip(v72)
            end
        else
            return
        end
    else
        return
    end
end
function v_u_11.grab_pet_object(p73, p74, p_u_75)
    local v76 = v_u_8
    assert(v76:IsServer())
    local v77 = v_u_1("new:AilmentsServer")
    local v78 = v_u_1("CharacterWrapper")
    local v79 = v_u_1("PetObjectManager")
    local v80 = v_u_1("FamilyHelper")
    if p74 and (p74.Parent and (p_u_75 and p_u_75.Parent)) then
        local v_u_81 = v78.get(p74)
        if v_u_81 then
            local v82 = v79.get_object_owner(p_u_75)
            if v82 == p73 or v80.are_friends_or_family(v82, p73) then
                local v_u_83 = p74.PetModel:FindFirstChild("HumanoidRootPart")
                if v_u_83 then
                    if v_u_81:get_property("grabbed_pet_object") == nil then
                        local v84 = v_u_81.pet_id
                        local v85 = v_u_2.pets[v84]
                        if v85 then
                            local v86 = v85.is_doll
                            local v87 = v85.is_egg
                            if v86 then
                                v86 = not v87
                            end
                            if v86 then
                                local v88 = p74.PetModel:FindFirstChild("RightMount")
                                local v89 = p_u_75:FindFirstChild("RightMount")
                                if v89 and v88 then
                                    local v90 = Instance.new("Weld")
                                    v90.Name = "GrabbedObjectWeld"
                                    v90.Part0 = v89
                                    v90.Part1 = v88
                                    for _, v91 in p_u_75:GetDescendants() do
                                        if v91:IsA("BasePart") then
                                            v91.CanCollide = false
                                            v91.Massless = true
                                        end
                                    end
                                    v90.Parent = v89
                                    v_u_81:set_property("grabbed_pet_object", p_u_75)
                                end
                            elseif v_u_11.weld_object_to_mouth(p74, p_u_75) ~= nil then
                                v_u_81:set_property("grabbed_pet_object", p_u_75)
                            end
                            local v_u_92 = v_u_83:GetNetworkOwner()
                            v_u_5.defer(function()
                                if v_u_81:get_property("grabbed_pet_object") == p_u_75 then
                                    v_u_83:SetNetworkOwner(v_u_92)
                                end
                            end)
                            local v93 = p_u_75:FindFirstChild("ProjectileTrail")
                            if v93 then
                                v93.Enabled = false
                            end
                            if p_u_75:FindFirstChild("ItemCategory") and p_u_75.ItemCategory.Value == "toys" then
                                v77.add_progress(v_u_81, "play", 0.3333333333333333)
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
    else
        return
    end
end
function v_u_11.weld_object_to_mouth(p94, p95, p96)
    local v97 = p96 or {}
    local v98 = nil
    for _, v99 in ipairs(p94.PetModel:GetDescendants()) do
        if v99:IsA("Attachment") and v99.Name == "Mouth" then
            v98 = v99
            break
        end
    end
    local v100 = p95:FindFirstChild("MouthAttachment", true) or p95:FindFirstChild("Mouth", true)
    local v101 = v100 ~= nil
    local v102 = ("PetObject \'%*\' is missing MouthAttachment"):format(p95.Name)
    assert(v101, v102)
    if not (v98 and v100) then
        return nil
    end
    local v103 = Instance.new("RigidConstraint")
    v103.Name = "GrabbedObjectWeld"
    v103.Attachment0 = v98
    v103.Attachment1 = v100
    if not v97.keep_collision then
        for _, v104 in p95:GetDescendants() do
            if v104:IsA("BasePart") then
                v104.CanCollide = false
                v104.Massless = true
            end
        end
    end
    v103.Parent = v100.Parent
    return v103
end
function v_u_11.get_family_char_wrappers_in_range(p_u_105, p_u_106)
    local v107 = v_u_8:IsServer()
    assert(v107, "PetObjectHelper.get_family_char_wrappers_in_range() can only be run on the server.")
    local v108 = v_u_1("CloudValues")
    local v_u_109 = v_u_1("FamilyHelper")
    local v110 = v_u_1("CharacterWrapper")
    local v_u_111 = v108:getValue("ailments", "petObjectClaimRange")
    local v_u_112
    if p_u_105.Character then
        v_u_112 = v110.get(p_u_105.Character)
    else
        v_u_112 = nil
    end
    local v_u_113
    if v_u_112 and v_u_112.char then
        v_u_113 = v_u_112.char:FindFirstChild("HumanoidRootPart")
    else
        v_u_113 = nil
    end
    return not v_u_113 and {} or v_u_6.List.filter(v110.get_all_char_wrappers(), function(p114)
        if not p114:is_non_player() then
            return false
        end
        if p114.player ~= p_u_105 and not v_u_109.are_friends_or_family(p114.player, p_u_105) then
            return false
        end
        if p_u_106 and not p_u_106(p114) then
            return false
        end
        if p114.player == p_u_105 then
            return true
        end
        local v115
        if p114.char then
            v115 = p114.char:FindFirstChild("HumanoidRootPart")
        else
            v115 = nil
        end
        local v116 = v115 ~= nil and v_u_112:is_in_same_location_as(p114)
        if v116 then
            v116 = (v115.CFrame.Position - v_u_113.CFrame.Position).Magnitude <= v_u_111
        end
        return v116
    end)
end
function v_u_11.get_pets_preferring_item(p117, p118, p119)
    local v120 = v_u_8
    assert(v120:IsServer())
    local v121 = v_u_1("new:AilmentsServer")
    local v122 = v_u_1("PetObjectHelper")
    local v123 = v_u_1("StateManager")
    local v124 = v122.get_family_char_wrappers_in_range(p117, p119)
    local v125 = {}
    local v126 = {}
    local v127 = {}
    local v128 = {}
    local v129 = {}
    local v130
    if p118 then
        v130 = p118.kind
    else
        v130 = nil
    end
    local v131
    if p118 then
        v131 = p118.ailment_to_boost
    else
        v131 = nil
    end
    local v132 = not v131 and (p118 and p118.category == "toys") and "play" or (not v131 and (p118 and p118.category == "strollers") and "ride" or v131)
    for _, v133 in v124 do
        local v134
        if v132 then
            v134 = v121.get_ailment_of_kind(v133, v132)
        else
            v134 = nil
        end
        local v135
        if v134 and v130 then
            v135 = v134.components.preference
        else
            v135 = nil
        end
        if v135 then
            if v135.item_kind == p118.kind then
                table.insert(v125, v133)
            else
                table.insert(v127, v133)
            end
        elseif v134 then
            table.insert(v126, v133)
        else
            local v136 = v123.get(v133.char):get_states("Sit")
            if next(v136) then
                table.insert(v129, v133)
            else
                table.insert(v128, v133)
            end
        end
    end
    return {
        v125,
        v126,
        v127,
        v128,
        v129
    }
end
function v_u_11.choose_multiple_pet_wrappers_for_item(p_u_137, p138, p139, p140)
    local v141 = {}
    for _, v142 in v_u_11.get_pets_preferring_item(p_u_137, p138, p140) do
        if next(v142) then
            local v146 = v_u_6.List.sort(v142, function(p143, p144)
                local v145
                if p143.player == p_u_137 then
                    v145 = p144.player ~= p_u_137
                else
                    v145 = false
                end
                return v145
            end)
            while next(v146) and #v141 < p139 do
                local v147 = table.remove
                table.insert(v141, v147(v146, 1))
            end
            if p139 <= #v141 then
                break
            end
        end
    end
    return v141
end
function v_u_11.choose_pet_to_take_item(p148, p149, p150)
    local v151 = v_u_11.choose_multiple_pet_wrappers_for_item(p148, p149, 1, p150)
    if v151 and v151[1] then
        return v151[1]:get_property("pet_unique")
    else
        return nil
    end
end
function v_u_11.item_belongs_to_pet(p152, p153)
    return p153:GetAttribute("PetUnique") == p152.base.char_wrapper.pet_unique
end
function v_u_11.can_pet_chase_item(p154, p155)
    if v_u_11.item_belongs_to_pet(p154, p155) then
        return true
    end
    local v156 = p155:FindFirstChild("OwnerPlayer")
    return (v156 and v156.Value or nil) == p154.base.char_wrapper.entity_controller
end
function v_u_11.init()
    if v_u_8:IsClient() then
        local v157 = v_u_1("RouterClient")
        v157.get_event("PetObjectAPI/SpawnInFrontOfPet").OnClientEvent:connect(v_u_47)
        v157.get_event("PetObjectAPI/RemotePetReturnedObject").OnClientEvent:connect(v_u_58)
    end
end
return v_u_11