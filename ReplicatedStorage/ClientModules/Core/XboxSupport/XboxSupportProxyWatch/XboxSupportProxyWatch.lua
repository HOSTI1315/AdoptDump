--// ReplicatedStorage.ClientModules.Core.XboxSupport.XboxSupportProxyWatch (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("XboxSupportWatch")
local v_u_4 = v1("XboxSupportWatchStack")
local v_u_5 = game:GetService("GuiService")
local v6 = v2("XboxSupportProxyWatch", v3)
function v6.__init(p7, p8)
    p7.selection_parent = p8.selection_parent
    p7.activated = p8.activated
    p7.deactivated = p8.deactivated
    p7.selection_parent_overrides = {}
    return p7
end
function v6.activate_from_stack(p9)
    v_u_5.GuiNavigationEnabled = false
    if p9.activated then
        task.defer(p9.activated)
    end
end
function v6.activate(p10)
    if not p10:is_active() then
        v_u_4.push(p10)
    end
end
function v6.deactivate_from_stack(p11)
    v_u_5.SelectedObject = nil
    v_u_5.GuiNavigationEnabled = true
    if p11.deactivated then
        task.defer(p11.deactivated)
    end
end
return v6