--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppMockAilment (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("FocusPetAppAilments")
local v5 = v2("FocusPetAppMockAilment", v1("UIBaseElement"))
function v5.capture_focus(p6)
    p6.maid:DoCleaning()
    p6:update_ailment(nil)
end
function v5.release_focus(p7)
    p7.maid:DoCleaning()
    p7:hide()
end
function v5.move_to_slot(p8, p9, p10)
    v_u_4.move_to_slot(p8, p9, p10)
    p9.End.Position = UDim2.fromScale(0.5, 0)
end
function v5.show(p11)
    p11.hidden = false
    p11.instance.Visible = true
end
function v5.hide(p12)
    p12.hidden = true
    p12.instance.Visible = false
end
function v5.update_ailment(p13, p14)
    p13.ailment:update_ailment(p14)
    if p14 then
        if p13.hidden then
            p13:show()
            return
        end
    elseif not p13.hidden then
        p13:hide()
    end
end
function v5.set_slot(p15, p16)
    p15.slot_num = p16
    p15:move_to_slot(p15.instance.AilmentContainer, p16)
    p15.containers = {}
    for v17 = 1, p16 do
        local v18 = p15.containers
        local v19
        if v17 == p16 then
            v19 = p15.instance.AilmentContainer
        else
            v19 = nil
        end
        v18[v17] = v19
    end
end
function v5.get_slot(p20)
    if p20.ailment.background.Visible then
        return p20.slot_num
    else
        return nil
    end
end
function v5.start(p21)
    p21.maid = v_u_3.new()
    p21.hidden = true
    p21.instance.Visible = false
    p21:set_slot(1)
    p21.ailment = p21.UIManager.wrap(p21.instance.AilmentContainer.End, "Ailment")
    p21.ailment:start({
        ["show_percentage"] = true,
        ["hide_empty_outline"] = true
    })
end
return v5