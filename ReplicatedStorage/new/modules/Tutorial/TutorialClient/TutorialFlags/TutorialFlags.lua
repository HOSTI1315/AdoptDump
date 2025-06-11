--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialFlags (ModuleScript)

local v_u_1 = {
    ["hide_pet_prompt_when_moving"] = false,
    ["started_playground_nav"] = false,
    ["picked_up_squeaky_bone"] = false,
    ["started_home_nav"] = true,
    ["completed_this_session"] = false
}
local v_u_2 = require(script.Parent.Parent.Parent.LegacyLoad)("Signal").new()
return {
    ["get"] = function(p3)
        local v4 = v_u_1[p3] ~= nil
        local v5 = ("Flag %* is not valid."):format(p3)
        assert(v4, v5)
        return v_u_1[p3]
    end,
    ["set"] = function(p6, p7)
        local v8 = v_u_1[p6] ~= nil
        local v9 = ("Flag %* is not valid."):format(p6)
        assert(v8, v9)
        v_u_1[p6] = p7
        v_u_2:Fire(p6, p7)
    end,
    ["get_changed_signal"] = function()
        return v_u_2
    end
}