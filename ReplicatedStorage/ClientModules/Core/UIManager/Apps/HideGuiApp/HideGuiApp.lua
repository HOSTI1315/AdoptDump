--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.HideGuiApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("QueueEffect")
local v4 = v2("HideGuiApp", v1("UIBaseApp"))
function v4._get_merged_exceptions_set(p5)
    local v6 = 0
    local v7 = {}
    for _, v8 in p5.exceptions_by_id do
        v6 = v6 + 1
        for _, v9 in v8 do
            if not v7[v9] then
                v7[v9] = 0
            end
            v7[v9] = v7[v9] + 1
        end
    end
    local v10 = {}
    for v11, v12 in v7 do
        if v12 == v6 then
            v10[v11] = true
        end
    end
    return v10
end
function v4.should_hide_app(p13, p14)
    return p13.all_guis_hidden and not p13.exceptions_merged_set[p14] and true or false
end
function v4.hide_all(p15, p16, p17)
    p15.exceptions_by_id[p16] = p17 or {}
    p15.hide_all_controller:set(p16)
end
function v4.unhide_all(p18, p19)
    p18.exceptions_by_id[p19] = nil
    p18.hide_all_controller:clear(p19)
end
function v4.show(_) end
function v4.hide(_) end
function v4.start(p_u_20)
    p_u_20.all_guis_hidden = false
    p_u_20.exceptions_by_id = {}
    p_u_20.exceptions_merged_set = {}
    p_u_20.hide_all_controller = v_u_3.new({
        ["refresh"] = function(p21)
            p_u_20.all_guis_hidden = p21 ~= nil
            p_u_20.exceptions_merged_set = p_u_20:_get_merged_exceptions_set()
            p_u_20.UIManager.refresh_all_apps()
        end
    })
end
return v4