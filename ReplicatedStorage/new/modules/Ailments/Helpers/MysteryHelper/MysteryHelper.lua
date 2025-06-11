--// ReplicatedStorage.new.modules.Ailments.Helpers.MysteryHelper (ModuleScript)

require(script.Parent.Parent.AilmentAction)
require(script.Parent.Parent.AilmentComponent)
require(script.Parent.Parent.AilmentTypes)
local v_u_1 = require(script.Parent.Parent.Parent.Utilities.WeightedRandom)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v3 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_4 = v3("CloudValues")
local v_u_5 = v3("InventoryDB")
local v_u_6 = v3("TableUtil")
local v_u_7 = game:GetService("RunService")
local v_u_8 = {}
local function v_u_12(p9)
    local v10 = v_u_4:getValue("ailments", "mysteryAilmentCategoryWeights")
    local v11 = v_u_1.get_values(v10, 3, p9)
    if not v_u_2.List.find(v11, "DEFAULT") then
        v11[Random.new(p9):NextInteger(1, 3)] = "DEFAULT"
    end
    return v11
end
local function v_u_20(p13, p_u_14)
    local v15 = Random.new(p13)
    local v19 = v_u_2.List.filter(v_u_4:getValue("ailments", "mysteryAilmentsList"), function(p16)
        local v17 = require(script.Parent.Parent.AilmentsDB)[p16]
        local v18 = v_u_5.pets[p_u_14.pet_id]
        if v17.not_for_eggs and v18.is_egg then
            return false
        elseif v17.not_for_dolls and v18.is_doll then
            return false
        else
            return (not v17.can_distribute or v17.can_distribute(p_u_14)) and true or false
        end
    end)
    return v_u_6.shuffle(v19, v15)
end
local function v_u_32(p21, p_u_22, p23)
    local v24 = v_u_20(p21, p23)
    local v26 = v_u_2.List.filter(v24, function(p25)
        return not p_u_22[p25]
    end)
    local v27 = {}
    for v28, v_u_29 in v_u_12(p21) do
        local v31 = v_u_2.List.findWhere(v26, function(p30)
            return require(script.Parent.Parent.AilmentsDB)[p30].category == v_u_29
        end)
        if v31 then
            v27[v28] = v26[v31]
            v26 = v_u_2.List.removeIndex(v26, v31)
        end
    end
    return v27
end
function v_u_8.get_action(p33)
    local v34 = v_u_7
    assert(v34:IsClient())
    local v35 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
    local v36 = require(v35.MysteryAilmentClient)
    local v37 = p33.components.mystery
    return v36.new({
        ["ailment_key"] = v37.ailment_key,
        ["components"] = v37.components,
        ["random_seed"] = v37.random_seed,
        ["get_ailment_slots"] = v_u_32
    })
end
function v_u_8.get_components(p38, p39)
    local v40 = v_u_7
    assert(v40:IsServer())
    local v41 = game.ServerScriptService.new.modules.Ailments.ServerComponents
    local v42 = require(v41.MysteryAilmentServer)
    local v43 = p38.mystery or nil
    local v44 = {}
    local v45 = {
        ["ailment_key"] = p39,
        ["get_valid_ailment_kinds_shuffled"] = v_u_20,
        ["get_ailment_slots"] = v_u_32
    }
    v44.mystery = v42.new(v45, v43)
    return v44
end
function v_u_8.is_from_mystery(p46)
    return p46.mystery_status and p46.mystery_status.completed or false
end
function v_u_8.get_completed_component()
    local v47 = v_u_7
    assert(v47:IsServer())
    local v48 = game.ServerScriptService.new.modules.Ailments.ServerComponents
    return require(v48.Memory).new({
        ["completed"] = true
    })
end
function v_u_8.persist_or_create(p49, p50)
    local v51 = v_u_7
    assert(v51:IsServer())
    return v_u_8.is_from_mystery(p49) and {
        ["mystery_status"] = v_u_8.get_completed_component()
    } or (not p50 and {} or p50())
end
return v_u_8