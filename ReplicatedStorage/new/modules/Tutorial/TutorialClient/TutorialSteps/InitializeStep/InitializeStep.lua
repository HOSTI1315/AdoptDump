--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.InitializeStep (ModuleScript)

local v1 = require(script.Parent.BaseTutorialStep)
local v_u_2 = require(script.Parent.Parent.Parent.Parent.NPCBehaviors.NPCController)
local v_u_3 = require(script.Parent.Parent.Parent.Parent.ABTest.ABTests.TutorialAB)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_5 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_6 = require(script.Parent.Parent.Parent.Parent.LegacyLoad)("MinigameForcedState")
local v_u_7 = {}
v_u_7.__index = v_u_7
setmetatable(v_u_7, v1)
function v_u_7.new(p8)
    local v9 = v_u_7
    local v10 = setmetatable({
        ["tutorial"] = p8
    }, v9)
    v10:init()
    return v10
end
function v_u_7.start(p_u_11)
    v_u_6.enable(v_u_5.Dictionary.mergeDeep(v_u_6.RESTRICT_ALL, {
        ["forced_equips"] = v_u_5.None,
        ["filter_equips"] = function(p12)
            return v_u_3:get_value("valid_pet_kinds")[p12.kind] or false
        end
    }))
    local v_u_13 = {}
    local v_u_14 = {}
    local v15 = v_u_3:get_value("valid_pet_kinds")
    local v20 = v_u_5.List.join({ v_u_4.try(function()
            local v16 = v_u_2.create_from_npc_kind_async("sir_woofington", {
                ["pet_kind"] = "dog"
            })
            local v17 = v16.model:FindFirstChild("PlacementBlock")
            v16.model.PrimaryPart = v17
            v16.model:PivotTo(p_u_11.tutorial.placement_cframes.sir_woofington)
            v17:Destroy()
            v_u_13.sir_woofington = v16
        end) }, v_u_5.List.map(v_u_5.Dictionary.keys(v15), function(p_u_18)
        return v_u_4.try(function()
            local v19 = p_u_11:_create_controller(p_u_18)
            v_u_14[p_u_18] = v19.model:Clone()
            v_u_13[p_u_18] = v19
        end)
    end))
    v_u_4.all(v20):andThen(function()
        p_u_11.tutorial.memory.controllers = v_u_13
        p_u_11.tutorial.memory.model_cache = v_u_14
        p_u_11.signal:Fire()
    end)
end
function v_u_7._create_controller(p21, p22)
    local v23 = v_u_2.create_from_pet_kind_async(p22)
    v23.model:PivotTo(p21.tutorial.placement_cframes[p22])
    return v23
end
function v_u_7.skip(p24)
    p24:start()
end
return v_u_7