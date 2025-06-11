--// ReplicatedStorage.ClientModules.Game.PetWorldState (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("new:AilmentsClient")
local v_u_3 = v1("CharWrapperClient")
local v_u_4 = v1("ClientData")
local v_u_5 = v1("EquippedPets")
local v_u_6 = v1("AdoptMeEnums/PetEntities/PetCommandType")
local v_u_7 = v1("AdoptMeEnums/PetEntities/PetObjectCreatorType")
local v_u_8 = v1("RouterClient")
local v_u_9 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_10 = v1("new:StreamingHelper")
local v_u_11 = v1("TagNames")
local v_u_12 = v1("package:Sift")
local v_u_13 = game:GetService("Players")
local v_u_14 = game:GetService("CollectionService")
local v_u_15 = {}
local function v_u_21(p16)
    local v_u_17 = {}
    v_u_14:GetInstanceAddedSignal(p16):Connect(function(p18)
        v_u_17[p18] = true
    end)
    v_u_14:GetInstanceRemovedSignal(p16):Connect(function(p19)
        v_u_17[p19] = nil
    end)
    for _, v20 in v_u_14:GetTagged(p16) do
        v_u_17[v20] = true
    end
    return v_u_17
end
local v_u_22 = {}
function v_u_15.buffer_command(p_u_23, p24, p25)
    local v_u_27 = {
        ["pet_command_type"] = p24,
        ["options"] = p25,
        ["expiry"] = os.clock() + 4,
        ["acknowledged"] = false,
        ["key"] = p_u_23,
        ["acknowledge"] = function(p26)
            p26.acknowledged = true
            if v_u_22[p26.key] then
                v_u_22[p26.key][p26] = nil
            end
        end
    }
    v_u_22[p_u_23] = v_u_22[p_u_23] or {}
    v_u_22[p_u_23][v_u_27] = true
    task.delay(4, function()
        if v_u_22[p_u_23] then
            v_u_22[p_u_23][v_u_27] = nil
        end
    end)
end
local v_u_67 = {
    ["PetObjects"] = {
        ["type"] = "EventBased",
        ["init"] = function()
            local v_u_28 = {}
            local v_u_29 = {}
            local function v32(p30)
                local v31 = p30:FindFirstChild("PetObjectCreatorType")
                if v31 then
                    if v31.Value == v_u_7.PetFood then
                        v_u_28[p30] = true
                    elseif v31.Value == v_u_7.DroppableToy then
                        v_u_29[p30] = true
                    end
                else
                    return
                end
            end
            v_u_14:GetInstanceAddedSignal(v_u_11.PetObject):Connect(v32)
            for _, v33 in v_u_14:GetTagged(v_u_11.PetObject) do
                local v34 = v33:FindFirstChild("PetObjectCreatorType")
                if v34 then
                    if v34.Value == v_u_7.PetFood then
                        v_u_28[v33] = true
                    elseif v34.Value == v_u_7.DroppableToy then
                        v_u_29[v33] = true
                    end
                end
            end
            v_u_14:GetInstanceRemovedSignal(v_u_11.PetObject):Connect(function(p35)
                v_u_28[p35] = nil
                v_u_29[p35] = nil
            end)
            return function(_)
                return {
                    [v_u_9.Food] = v_u_28,
                    [v_u_9.ThrowToy] = v_u_29
                }
            end
        end
    },
    ["Discosplosion"] = {
        ["type"] = "EventBased",
        ["init"] = function()
            local v_u_36 = v_u_21(v_u_11.Discosplosion)
            return function(p_u_37)
                local v39 = v_u_12.Dictionary.filter(v_u_36, function(_, p38)
                    return (p_u_37.base.root.Position - p38.Position).magnitude < 25
                end)
                return {
                    [v_u_9.Discosplosion] = v39
                }
            end
        end
    },
    ["Commands"] = {
        ["type"] = "Declarative",
        ["get"] = function(p40)
            return {
                [v_u_9.Command] = v_u_22[p40.base.char]
            }
        end
    },
    ["EquippedItem"] = {
        ["type"] = "Declarative",
        ["get"] = function()
            local v41 = {}
            local v42 = v_u_4.get("equip_manager") or {}
            local v43 = v42.food[1]
            local v44 = v42.toys[1]
            local v45 = v_u_13.LocalPlayer.character
            if v45 then
                v45 = v45:FindFirstChildOfClass("Tool")
            end
            local v46 = nil
            local v47
            if v45 and v45:FindFirstChild("unique") then
                v47 = v45.unique.Value
            else
                v47 = nil
            end
            if v43 and v47 == v43.unique then
                v44 = v43
            elseif v44 then
                if v47 ~= v44.unique then
                    v44 = v46
                end
            else
                v44 = v46
            end
            v41[1] = v44 or nil
            return {
                [v_u_9.EquippedItem] = v41
            }
        end
    },
    ["CelestialPet"] = {
        ["type"] = "EventBased",
        ["init"] = function()
            local v_u_48 = v_u_21(v_u_11.Pets)
            return function(p_u_49)
                local v_u_50 = { "celestial_2024_glormy_hound", "celestial_2024_glormy_leo", "moon_2025_glormy_dolphin" }
                local v51 = { "moon_2025_glormy_dolphin" }
                local v52 = p_u_49.base.entry.kind
                local v53 = table.find(v_u_50, v52)
                if not v53 then
                    return {
                        [v_u_9.CelestialPet] = {}
                    }
                end
                if not table.find(v51, v52) then
                    table.remove(v_u_50, v53)
                end
                local v57 = v_u_12.Dictionary.filter(v_u_48, function(_, p54)
                    local v55 = v_u_3.get(p54)
                    if not v55 then
                        return false
                    end
                    if v55.pet_unique == p_u_49.base.char_wrapper.pet_unique then
                        return false
                    end
                    if not table.find(v_u_50, v55.pet_id) then
                        return false
                    end
                    local v56 = v55.char
                    return (p_u_49.base.root.Position - v56.HumanoidRootPart.Position).magnitude <= 20
                end)
                return {
                    [v_u_9.CelestialPet] = v57
                }
            end
        end
    },
    ["IceDimensionPet"] = {
        ["type"] = "EventBased",
        ["init"] = function()
            local v_u_58 = v_u_21(v_u_11.Pets)
            return function(p_u_59)
                local v_u_60 = { "winter_2024_frostbite_cub", "ice_dimension_2025_frostbite_bear" }
                local v61 = p_u_59.base.entry.kind
                local v62 = table.find(v_u_60, v61)
                if not v62 then
                    return {
                        [v_u_9.IceDimensionPet] = {}
                    }
                end
                table.remove(v_u_60, v62)
                local v66 = v_u_12.Dictionary.filter(v_u_58, function(_, p63)
                    local v64 = v_u_3.get(p63)
                    if not v64 then
                        return false
                    end
                    if v64.pet_unique == p_u_59.base.char_wrapper.pet_unique then
                        return false
                    end
                    if v_u_60[1] ~= v64.pet_id then
                        return false
                    end
                    local v65 = v64.char
                    return (p_u_59.base.root.Position - v65.HumanoidRootPart.Position).magnitude <= 20
                end)
                return {
                    [v_u_9.IceDimensionPet] = v66
                }
            end
        end
    }
}
function v_u_15.get_world_state(p68)
    debug.profilebegin("PetEntities_GetWorldState")
    local v69 = {}
    for _, v70 in pairs(v_u_67) do
        if v70.get then
            local v71 = v70.get(p68)
            for v72, v73 in pairs(v71) do
                if v69[v72] then
                    table.move(v73, 1, #v73, 1, v69[v72])
                else
                    v69[v72] = v73
                end
            end
        end
    end
    debug.profileend()
    return v69
end
function v_u_15.init()
    for _, v74 in v_u_67 do
        if v74.type == "EventBased" then
            local v75 = v74.init()
            if v75 then
                v74.get = v75
            end
        end
    end
    v_u_2.get_ailment_completed_signal():Connect(function(p76, p77)
        local v78 = v_u_5.get_wrapper_from_unique(p77)
        if v78 then
            v_u_15.buffer_command(v78.char, v_u_6.CompleteAilment, {
                ["ailment_id"] = p76.kind
            })
        end
    end)
    v_u_8.get("PetAPI/BufferPetCommand").OnClientEvent:connect(function(p79, p80, p81)
        local v82 = v_u_10.await(p80, 3)
        if v82 then
            v_u_15.buffer_command(v82, p79, p81)
        end
    end)
end
return v_u_15