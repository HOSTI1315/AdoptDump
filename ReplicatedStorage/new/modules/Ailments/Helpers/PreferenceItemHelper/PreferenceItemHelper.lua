--// ReplicatedStorage.new.modules.Ailments.Helpers.PreferenceItemHelper (ModuleScript)

local v_u_1 = require(script.Parent.Parent.PreferenceItemGroupsDB)
return {
    ["is_correct_item"] = function(p2, p3)
        if p2 == p3 then
            return true
        else
            local v4 = v_u_1[p2]
            if v4 then
                return v4[p3] or false
            else
                return false
            end
        end
    end
}