--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.ToolApp.ToolAppAddButton (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("TweenPromise")
local v3 = v1("TweenHelper")
local v_u_4 = v1("Signal")
local v5 = v1("UIBaseElement")
local v6, v_u_7 = v1("Class")("ToolAppAddButton", v5)
local v_u_8 = v3.tween_info({
    ["time"] = 0.12
})
function v6.__init(p9, ...)
    v_u_7.__init(p9, ...)
    p9.hovering = false
    p9.using = false
    p9.hidden = true
    p9.instance.UIScale.Scale = 0
    p9.instance.Visible = false
    p9.visibility_changed = v_u_4.new()
end
function v6.show(p10)
    if p10.hidden then
        p10.hidden = false
        p10.visibility_changed:Fire(not p10.hidden)
        p10.instance.UIScale.Scale = 0.1
        p10.instance.Visible = true
        v_u_2.new(p10.instance.UIScale, v_u_8, {
            ["Scale"] = 1
        })
        p10:_update_size()
    end
end
function v6.hide(p_u_11)
    if not p_u_11.hidden then
        p_u_11.hidden = true
        p_u_11.visibility_changed:Fire(not p_u_11.hidden)
        v_u_2.new(p_u_11.instance.UIScale, v_u_8, {
            ["Scale"] = 0
        }):andThen(function()
            if p_u_11.hidden then
                p_u_11.instance.Visible = false
            end
        end)
    end
end
function v6._update_size(p12)
    if not p12.hidden then
        local v13 = p12.using and 1.14 or (p12.hovering and 1.1 or 1)
        v_u_2.new(p12.instance.Add.UIScale, v_u_8, {
            ["Scale"] = v13
        })
    end
end
function v6.start(p_u_14, p_u_15)
    p_u_14.hotbar = p_u_15
    p_u_14.instance.Add.MouseEnter:connect(function()
        p_u_14.hovering = true
        p_u_14:_update_size()
    end)
    p_u_14.instance.Add.MouseLeave:connect(function()
        p_u_14.hovering = false
        p_u_14:_update_size()
    end)
    p_u_14.instance.Add.MouseButton1Down:connect(function()
        if not (p_u_14.hidden or p_u_14.using) then
            p_u_14.using = true
            p_u_14:_update_size()
            p_u_15:pick_item_promise(nil, true):finally(function()
                p_u_14.using = false
                p_u_14:_update_size()
            end)
        end
    end)
    p_u_14.gamepad_support = p_u_14.hotbar.gamepad_support
    p_u_14.gamepad_support:hook_add_button(p_u_14)
end
return v6