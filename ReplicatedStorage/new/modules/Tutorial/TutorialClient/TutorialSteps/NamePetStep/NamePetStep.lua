--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.NamePetStep (ModuleScript)

local v1 = require(script.Parent.BaseTutorialStep)
local v_u_2 = require(script.Parent.Parent.TutorialHelper)
local v3 = require(script.Parent.Parent.Parent.Parent.LegacyLoad)
local v_u_4 = v3("ControlsDisabler")
local v_u_5 = v3("EquippedPets")
local v_u_6 = v3("InventoryDB")
local v_u_7 = v3("PetEntityHelper")
local v_u_8 = v3("PetEntityManager")
local v_u_9 = v3("PetReactionName")
local v_u_10 = v3("RouterClient")
local v_u_11 = v3("UIManager")
local v_u_12 = {}
v_u_12.__index = v_u_12
setmetatable(v_u_12, v1)
function v_u_12.new(p13)
    local v14 = v_u_12
    local v15 = setmetatable({
        ["tutorial"] = p13
    }, v14)
    v15:init()
    return v15
end
function v_u_12.start(p16)
    v_u_4.enable_controls("tutorial")
    p16.maid:GiveTask(v_u_2.run_fireworks(p16.tutorial.shared_model, p16.tutorial.memory.pet_kind))
    local v17 = v_u_8.wait_for_local_owned_pet_entities()[1]
    v_u_7.stage_reaction(v17, {
        ["name"] = v_u_9.GreetOnJoinReaction
    })
    v_u_7.promise_reaction_ended(v17, v_u_9.GreetOnJoinReaction):expect()
    local v18 = p16:_name_pet()
    p16.signal:Fire({
        ["named_pet"] = v18 ~= nil
    })
end
function v_u_12._name_pet(p19)
    local v20 = p19.tutorial.memory.pet_kind
    local v21 = v_u_6.pets[v20]
    if v21.is_egg then
        return
    else
        local v22 = v21.name
        if v_u_11.apps.DialogApp:dialog({
            ["text"] = ("Do you want to name your new %*?"):format(v22),
            ["left"] = "Maybe later",
            ["right"] = "Yes"
        }) == "Yes" then
            local v23, v24 = v_u_11.apps.DialogApp:dialog({
                ["dialog_type"] = "FreeResponseDialog",
                ["text"] = ("What\'s your %*\'s name?"):format(v22),
                ["left"] = "Cancel",
                ["right"] = "Save"
            })
            if v23 == "Save" then
                local v25 = v_u_5.get_my_equipped_char_wrappers()[1]
                local v26 = v_u_10.get("SettingsAPI/SetPetRoleplayName"):InvokeServer(v25.pet_unique, v24)
                p19.tutorial.memory.pet_name = v26
                return v26
            end
        end
    end
end
function v_u_12.skip(p27)
    v_u_4.enable_controls("tutorial")
    p27.signal:Fire()
end
return v_u_12