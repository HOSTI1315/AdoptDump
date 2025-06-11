--// ReplicatedStorage.ClientServices.DropInvalidUISelectionService (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("XboxSupport")
local v_u_2 = game:GetService("GuiService")
return {
    ["init"] = function()
        v_u_2:GetPropertyChangedSignal("SelectedObject"):Connect(function()
            local v3 = v_u_2.SelectedObject
            if v3 then
                local v4, v5 = v_u_1.is_valid_selection(v3)
                if v4 then
                    local v6 = v_u_1.get_watch_from_parent(v3, true)
                    if not (v6 and v6:is_active()) then
                        v_u_2.SelectedObject = nil
                    end
                else
                    warn(("GuiService.SelectedObject was set to an invalid object, so the selection was dropped.\nReason: %s\nObject path: %s"):format(v5, v3:GetFullName()))
                    v_u_2.SelectedObject = nil
                    return
                end
            else
                return
            end
        end)
    end
}