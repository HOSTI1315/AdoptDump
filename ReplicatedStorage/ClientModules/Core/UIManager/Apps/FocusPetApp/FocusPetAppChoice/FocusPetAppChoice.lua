--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppChoice (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("PlatformM")
local v5 = v1("Signal")
local v6 = v1("TweenHelper")
local v_u_7 = v1("TweenPromise")
local v8 = v1("package:t")
local v_u_9 = v8.strictInterface({
    ["index"] = v8.optional(v8.number),
    ["choice"] = v8.optional(v8.any),
    ["selected_signal"] = v8.optional(v5.is)
})
local v_u_10 = v6.tween_info({
    ["time"] = 0.12
})
local v11 = v2("FocusPetAppChoice", v1("UIBaseElement"))
function v11._update_size(p12)
    v_u_7.new(p12.ui_scale, v_u_10, {
        ["Scale"] = p12.hovering and 1.1 or 1
    })
end
function v11.hover(p13)
    if not p13.hovering then
        p13.hovering = true
        p13:_update_size()
    end
end
function v11.stop_hovering(p14)
    if p14.hovering then
        p14.hovering = false
        p14:_update_size()
    end
end
function v11.start(p_u_15, p_u_16)
    local v17 = v_u_9
    assert(v17(p_u_16))
    p_u_15.ui_scale = p_u_15.instance.Background.UIScale
    p_u_15.maid = v_u_3.new()
    p_u_15.maid:GiveTask(p_u_15.instance.MouseEnter:connect(function()
        p_u_15:hover()
    end))
    p_u_15.maid:GiveTask(p_u_15.instance.MouseLeave:connect(function()
        p_u_15:stop_hovering()
    end))
    p_u_15.maid:GiveTask(p_u_15.instance.SelectionGained:connect(function()
        p_u_15:hover()
    end))
    p_u_15.maid:GiveTask(p_u_15.instance.SelectionLost:connect(function()
        p_u_15:stop_hovering()
    end))
    p_u_15.maid:GiveTask(p_u_15.instance[v_u_4.mouse_down_or_click()]:connect(function()
        p_u_16.selected_signal:Fire(p_u_16.choice, p_u_16.index)
    end))
end
function v11.destroy(p18)
    p18.maid:DoCleaning()
end
return v11