--// ReplicatedStorage.ClientDB.Housing.NeonFusionDevice (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("InventoryDB")
local v_u_3 = v_u_1("EquippedPets")
local v_u_4 = v_u_1("PetPerformanceName")
local v_u_5 = v_u_1("package:Promise")
local v_u_6 = game:GetService("Workspace")
local v_u_7 = {
    "neon_spot_1",
    "neon_spot_2",
    "neon_spot_3",
    "neon_spot_4"
}
local function v_u_17(p8, p9, p10, p11)
    local v12 = v_u_1("UIManager")
    local v13 = v_u_1("PetEntityManager")
    local v14 = p8.placed_pets[p10]
    if v14 then
        if not p11 then
            v12.apps.BackpackApp:remove_item_unique_hidden(v14.unique_id, "neon_fusion")
        end
        v13.remove_pet_entity_by_entity(v14.pet_entity)
        v14.pet_entity.base.char:Destroy()
        p8.placed_pets[p10] = nil
    end
    p8.set_particle_effect_enabled(p9, p10, false)
    local v15 = false
    for _, v16 in ipairs(v_u_7) do
        if p8.placed_pets[v16] then
            v15 = true
            break
        end
    end
    p8.set_particle_effect_enabled(p9, "center_spot", v15)
end
local function v_u_25(p18, p19)
    local v20 = v_u_1("PetEntityManager")
    local v21 = p18:Clone()
    local v22 = v21:GetAttribute("StreamingId")
    if v22 then
        v21:RemoveTag("HasStreamingId")
        v21:RemoveTag(v22)
        v21:SetAttribute("StreamingId", nil)
    end
    local v23 = v21:FindFirstChild("StateConnection", true)
    if v23 then
        v23:Destroy()
    end
    local v24 = v21:FindFirstChild("SpeechBubbleApp", true)
    if v24 then
        v24:Destroy()
    end
    v21.Parent = v_u_6
    if v21:FindFirstChild("BodyGyro", true) then
        v21.HumanoidRootPart.BodyGyro:Destroy()
    end
    if v21.HumanoidRootPart:FindFirstChild("BodyVelocity", true) then
        v21.HumanoidRootPart.BodyVelocity:Destroy()
    end
    return v20.create_pet_entity(v21, p19)
end
local function v_u_46(p_u_26, p_u_27)
    local v_u_28 = v_u_1("ClientData")
    local v29 = v_u_1("InteriorsM")
    p_u_26.placed_pets = {}
    function p_u_26.set_particle_effect_enabled(p30, p31, p32)
        local v33 = p30:FindFirstChild(p31):FindFirstChild("ParticlePart")
        for _, v34 in pairs(v33:GetChildren()) do
            if v34:IsA("Beam") or v34:IsA("ParticleEmitter") then
                v34.Enabled = p32
            end
        end
    end
    v_u_28.register_callback_plus_existing("pet_char_wrappers", function(_, p35, _)
        for _, v36 in p35 do
            local v37 = v36.pet_unique or v36.unique
            for v38, v39 in pairs(p_u_26.placed_pets) do
                if v39.unique_id == v37 then
                    v_u_17(p_u_26, p_u_27, v38)
                end
            end
        end
    end)
    v_u_28.register_callback("inventory", function()
        local v40 = v_u_28.get("inventory")
        for v41, v42 in pairs(p_u_26.placed_pets) do
            local v43 = false
            for _, v44 in pairs(v40.pets) do
                if v42.unique_id == v44.unique then
                    v43 = true
                    break
                end
            end
            if not (v43 or p_u_26.is_fusing) then
                v_u_17(p_u_26, p_u_27, v41)
            end
        end
    end)
    v29.on_location_changed:Connect(function()
        for v45, _ in pairs(p_u_26.placed_pets) do
            if p_u_26.placed_pets[v45] then
                v_u_17(p_u_26, p_u_27, v45)
            end
        end
    end)
end
return function(p_u_47)
    return {
        ["use_text"] = function(p48)
            local v49 = p48.placed_pets
            if not p48.is_fusing then
                return v49 and v49[p_u_47] and "Remove Pet" or "Place Pet"
            end
        end,
        ["use_permissions"] = "EVERYONE",
        ["temp_init"] = function(p50, p51)
            if not p50.is_setup then
                p50.is_setup = true
                v_u_46(p50, p51)
            end
            if not p50.anim_controller then
                p50.anim_controller = p51:FindFirstChild("AnimationController")
            end
        end,
        ["client_use"] = function(p_u_52, _, p_u_53)
            local v_u_54 = v_u_1("UIManager")
            local v55 = v_u_1("ClientData")
            local v_u_56 = v_u_1("ClientToolManager")
            local v57 = v_u_1("PetEntityHelper")
            local v_u_58 = v_u_1("RouterClient")
            local v59 = v_u_1("PetMovementTarget")
            local v60 = p_u_53:WaitForChild(p_u_47):WaitForChild("Stone")
            local v_u_61 = p_u_53:WaitForChild("center_spot")
            local v_u_62 = v_u_61:WaitForChild("Stone")
            local v63 = p_u_52.placed_pets
            if v63 then
                v63 = p_u_52.placed_pets[p_u_47]
            end
            if v63 then
                v_u_17(p_u_52, p_u_53, p_u_47)
                return
            end
            local v64 = v_u_3.get_equipped_char_wrappers()
            local _, v65 = next(p_u_52.placed_pets)
            local v_u_66
            if v65 == nil then
                v_u_66 = nil
            else
                v_u_66 = v55.get("inventory")
                if v_u_66 then
                    if v65 then
                        v_u_66 = v_u_66.pets[v65.unique_id]
                    else
                        v_u_66 = v65
                    end
                end
            end
            local function v69(p67)
                if v_u_66 then
                    if v_u_66.kind ~= p67.kind then
                        return false
                    end
                    if v_u_66.properties.neon ~= p67.properties.neon then
                        return false
                    end
                end
                local v68 = p67.category == "pets" and not p67.properties.mega_neon
                if v68 then
                    v68 = p67.properties.age == 6
                end
                return v68
            end
            local v70
            if #v64 == 1 then
                v70 = v64[1]
            else
                v70 = v_u_3.choose_wrapper()
            end
            if v70 then
                local v71 = v_u_3.get_item_from_wrapper(v70)
                local v72 = ((not v_u_66 or v_u_66.kind == v71.kind and v_u_66.properties.neon == v71.properties.neon) and true or false) and (v71.category == "pets" and not v71.properties.mega_neon)
                if v72 then
                    v72 = v71.properties.age == 6
                end
                if v72 then
                    ::l25::
                    if v70 then
                        local v73 = v_u_3.get_item_from_wrapper(v70)
                        if v73 then
                            local v74 = v_u_2.pets[v73.id]
                            if v73.properties.mega_neon then
                                v_u_54.apps.DialogApp:dialog({
                                    ["text"] = "This pet has already fused spirits, and already is Mega Neon.",
                                    ["button"] = "Okay"
                                })
                                return
                            elseif v73.properties.age < 6 then
                                v_u_54.apps.DialogApp:dialog({
                                    ["text"] = "Pets must be fully grown to fuse their spirits.",
                                    ["button"] = "Okay"
                                })
                                return
                            elseif v74.is_doll then
                                v_u_54.apps.DialogApp:dialog({
                                    ["text"] = "Dolls cannot fuse spirits.",
                                    ["button"] = "Okay"
                                })
                                return
                            elseif v74.is_egg then
                                v_u_54.apps.DialogApp:dialog({
                                    ["text"] = "Eggs cannot fuse spirits. Try hatching and full aging your pet first.",
                                    ["button"] = "Okay"
                                })
                                return
                            elseif v_u_54.is_visible("TradeApp") then
                                v_u_54.apps.DialogApp:dialog({
                                    ["text"] = "You can not fuse spirits while trading.",
                                    ["button"] = "Okay"
                                })
                                p_u_52.in_use = false
                            else
                                if v_u_66 then
                                    if v73.properties.neon ~= v_u_66.properties.neon then
                                        v_u_54.apps.DialogApp:dialog({
                                            ["text"] = "You can not fuse the spirits of regular pets and Neon pets.",
                                            ["button"] = "Okay"
                                        })
                                        return
                                    end
                                    if v74.id ~= v65.kind then
                                        v_u_54.apps.DialogApp:dialog({
                                            ["text"] = "All pets must be the same species and type to fuse spirits.",
                                            ["button"] = "Okay"
                                        })
                                        return
                                    end
                                end
                                p_u_52.placed_pets[p_u_47] = nil
                                local v75 = v_u_25(v70.char, v74)
                                v_u_56.unequip(v73)
                                local v76 = {
                                    ["unique_id"] = v73.unique,
                                    ["kind"] = v74.id,
                                    ["pet_entity"] = v75
                                }
                                p_u_52.placed_pets[p_u_47] = v76
                                v_u_54.apps.BackpackApp:set_item_unique_hidden(v70.pet_unique, "neon_fusion")
                                v57.stage_performance(v75, {
                                    ["name"] = v_u_4.TargetProvider,
                                    ["options"] = {
                                        ["movement_target"] = v59.new({
                                            ["target"] = v60
                                        }),
                                        ["rotation_target"] = v59.new({
                                            ["target"] = v_u_62
                                        })
                                    }
                                })
                                p_u_52.set_particle_effect_enabled(p_u_53, p_u_47, true)
                                p_u_52.set_particle_effect_enabled(p_u_53, "center_spot", true)
                                local v77 = true
                                for _, v78 in ipairs(v_u_7) do
                                    if not p_u_52.placed_pets[v78] then
                                        v77 = false
                                    end
                                end
                                if v77 then
                                    local v_u_79 = {}
                                    for _, v80 in pairs(p_u_52.placed_pets) do
                                        local v81 = v80.unique_id
                                        table.insert(v_u_79, v81)
                                    end
                                    v_u_5.promisify(function()
                                        p_u_52.is_fusing = true
                                        local v82, v83 = v_u_58.get("PetAPI/DoNeonFusion"):InvokeServer(v_u_79)
                                        assert(v82, "Unique for neon pet not found")
                                        assert(v83, "Kind for neon pet not found")
                                        return v82, v83
                                    end)():andThen(function(p_u_84, p_u_85)
                                        coroutine.wrap(function()
                                            local v86 = game.ReplicatedStorage:WaitForChild("Resources"):WaitForChild("Particles"):WaitForChild("Hatch"):GetChildren()
                                            local v87 = {}
                                            for _, v88 in ipairs(v_u_7) do
                                                for _, v89 in pairs(v86) do
                                                    local v90 = v89:Clone()
                                                    table.insert(v87, v90)
                                                    v90.Parent = p_u_53[v88].ParticlePart.A2
                                                    v90.Enabled = true
                                                end
                                            end
                                            v_u_54.apps.BackpackApp:reset_hidden_item_tag("neon_fusion")
                                            v_u_5.delay(0.2):await()
                                            p_u_52.is_fusing = false
                                            for _, v91 in ipairs(v_u_7) do
                                                v_u_17(p_u_52, p_u_53, v91, true)
                                            end
                                            for _, v92 in pairs(v87) do
                                                v92.Enabled = false
                                            end
                                            v_u_5.delay(3.6):await()
                                            local v93 = {}
                                            for _, v94 in pairs(v86) do
                                                local v95 = v94:Clone()
                                                table.insert(v93, v95)
                                                v95.Parent = v_u_61.ParticlePart.A2
                                                v95.Enabled = true
                                            end
                                            v_u_5.delay(0.2):await()
                                            local v96 = {
                                                ["category"] = "pets",
                                                ["kind"] = p_u_85,
                                                ["id"] = p_u_85,
                                                ["unique"] = p_u_84
                                            }
                                            local v97 = v_u_56.equip
                                            local v98 = {}
                                            local v99 = v_u_62.CFrame
                                            local v100 = v_u_62.Size.Y / 2 + 5
                                            v98.spawn_cframe = v99 + Vector3.new(0, v100, 0)
                                            v97(v96, v98)
                                            for _, v101 in ipairs(v93) do
                                                v101.Enabled = false
                                            end
                                            for _, v102 in ipairs(v_u_7) do
                                                p_u_52.set_particle_effect_enabled(p_u_53, v102, false)
                                            end
                                            p_u_52.set_particle_effect_enabled(p_u_53, "center_spot", false)
                                            v_u_5.delay(4):await()
                                            for _, v103 in pairs(v93) do
                                                v103:Destroy()
                                            end
                                        end)()
                                    end):catch(function()
                                        p_u_52.is_fusing = false
                                        for _, v104 in ipairs(v_u_7) do
                                            v_u_17(p_u_52, p_u_53, v104)
                                        end
                                        p_u_52.placed_pets = {}
                                        v_u_54.apps.BackpackApp:reset_hidden_item_tag("neon_fusion")
                                        v_u_54.apps.DialogApp:dialog({
                                            ["yields"] = false,
                                            ["text"] = "There was a problem fusing the spirits of your pets.",
                                            ["button"] = "Okay"
                                        })
                                    end)
                                end
                            end
                        else
                            return
                        end
                    else
                        return
                    end
                end
            end
            v_u_54.apps.BackpackApp:select_category("pets")
            local v105 = v_u_54.apps.BackpackApp:pick_item({
                ["visible_backpack_categories"] = { "favorites", "pets" },
                ["allow_callback"] = v69
            })
            if not v105 or v105.category ~= "pets" then
                return
            end
            if v_u_56.equip(v105) then
                local v106 = tick()
                while tick() - v106 < 8 do
                    v70 = v_u_3.get_wrapper_from_item(v105)
                    if v70 and v70.char then
                        break
                    end
                    wait(0.1)
                end
            end
            goto l25
        end
    }
end