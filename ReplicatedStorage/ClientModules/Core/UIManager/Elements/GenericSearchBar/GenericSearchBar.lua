--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.GenericSearchBar (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")("GenericSearchBar", v1("UIBaseElement"))
function v2.get_search_param(p3)
    return p3.search_param
end
function v2.reset_search(p4)
    p4.instance.Text = ""
    p4.search_param = nil
end
function v2.start(p_u_5, p_u_6)
    p_u_5.search_param = nil
    p_u_5.instance.FocusLost:Connect(function()
        local v7 = p_u_5
        local v8 = p_u_5.instance.Text
        local v9
        if not v8 or v8:gsub("%s+", "") == "" then
            v9 = nil
        else
            v9 = v8:gsub("^%s+", "")
        end
        v7.search_param = v9
        p_u_6(p_u_5.search_param)
    end)
    p_u_5:reset_search()
    return p_u_5
end
return v2