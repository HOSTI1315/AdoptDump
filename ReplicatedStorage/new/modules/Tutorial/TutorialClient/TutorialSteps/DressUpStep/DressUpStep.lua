--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.DressUpStep (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.BaseTutorialStep)
local v_u_3 = require(script.Parent.Parent.Parent.Parent.ABTest.ABTests.TutorialAB)
local v_u_4 = require(v1.ClientModules.Core.UIManager.UIManager)
local v_u_5 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_6 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_7 = require(script.Parent.Parent.Parent.Parent.LegacyLoad)("MinigameForcedState")
local v_u_8 = {}
v_u_8.__index = v_u_8
setmetatable(v_u_8, v2)
function v_u_8.new(p9)
    local v10 = v_u_8
    local v11 = setmetatable({
        ["tutorial"] = p9
    }, v10)
    v11:init()
    return v11
end
function v_u_8.start(p_u_12)
    p_u_12:_update_minigame_forced_state()
    v_u_4.apps.DialogApp:dialog({
        ["text"] = "Welcome to Adopt Me!",
        ["button"] = "Next"
    })
    v_u_4.apps.DialogApp:dialog({
        ["text"] = "Let\'s start the day off right - by dressing fashionably, of course!",
        ["button"] = "Start"
    })
    v_u_4.set_app_visibility("AvatarEditorApp", true)
    v_u_5.fromEvent(v_u_4.app_visibilities_changed, function(p13, p14)
        local v15
        if p13 == "AvatarEditorApp" then
            v15 = not p14
        else
            v15 = false
        end
        return v15
    end):andThen(function()
        p_u_12.signal:Fire()
    end)
    local v20 = v_u_5.delay(3):andThen(function()
        local v16, v_u_17 = v_u_4.apps.DialogApp:queue_with_override({
            ["text"] = "There are thousands of outfits to choose from!",
            ["button"] = "Next"
        })
        v16:finally(function()
            v_u_17(nil)
        end)
        local v18, v_u_19 = v_u_4.apps.DialogApp:queue_with_override({
            ["text"] = "Can you find something stylish to put on?",
            ["button"] = "Start"
        })
        v18:finally(function()
            v_u_19(nil)
        end)
        p_u_12.maid:GiveTask(v16)
        p_u_12.maid:GiveTask(v18)
    end)
    p_u_12.maid:GiveTask(v20)
end
function v_u_8._update_minigame_forced_state(_)
    v_u_7.disable()
    local v21 = v_u_7.enable
    local v22 = v_u_6.Dictionary.mergeDeep
    local v23 = v_u_7.RESTRICT_ALL
    local v25 = {
        ["app_visibility"] = {
            ["app_names"] = { "AvatarEditorApp", "GenderStylePickerApp" }
        },
        ["can_edit_avatars"] = true,
        ["forced_equips"] = v_u_6.None,
        ["filter_equips"] = function(p24)
            return v_u_3:get_value("valid_pet_kinds")[p24.kind] or false
        end
    }
    v21(v22(v23, v25))
end
function v_u_8.skip(p26)
    p26:_update_minigame_forced_state()
    p26.signal:Fire()
end
return v_u_8