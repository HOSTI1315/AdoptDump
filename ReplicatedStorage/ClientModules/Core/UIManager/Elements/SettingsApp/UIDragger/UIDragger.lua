--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.SettingsApp.UIDragger (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Signal")
local v3 = v1("Class")
local v_u_4 = v1("Maid")
local v_u_5 = {
    [Enum.UserInputType.MouseButton1] = true,
    [Enum.UserInputType.Touch] = true
}
local v_u_6 = {
    [Enum.UserInputType.MouseMovement] = true,
    [Enum.UserInputType.Touch] = true
}
local v_u_7 = game:GetService("UserInputService")
local v8 = v3("UIDragger", v1("UIBaseElement"))
function v8.force_start_drag(p9, p10)
    p9.is_dragging = true
    p9.drag_started:Fire(p9.instance, p10)
end
function v8.force_end_drag(p11, p12)
    p11.is_dragging = false
    p11.drag_ended:Fire(p11.instance, p12)
end
function v8.destroy(p13)
    p13.maid:DoCleaning()
end
function v8.start(p_u_14)
    p_u_14.is_dragging = false
    p_u_14.drag_started = v_u_2.new()
    p_u_14.drag_ended = v_u_2.new()
    p_u_14.drag_changed = v_u_2.new()
    p_u_14.maid = v_u_4.new()
    p_u_14.maid:GiveTask(p_u_14.drag_started)
    p_u_14.maid:GiveTask(p_u_14.drag_ended)
    p_u_14.maid:GiveTask(p_u_14.drag_changed)
    p_u_14.maid:GiveTask(p_u_14.instance.InputBegan:Connect(function(p15)
        if not p_u_14.is_dragging and v_u_5[p15.UserInputType] then
            p_u_14.is_dragging = true
            p_u_14.drag_started:Fire(p_u_14.instance, p15)
        end
    end))
    p_u_14.maid:GiveTask(v_u_7.InputEnded:Connect(function(p16)
        if p_u_14.is_dragging and v_u_5[p16.UserInputType] then
            p_u_14.is_dragging = false
            p_u_14.drag_ended:Fire(p_u_14.instance, p16)
        end
    end))
    p_u_14.maid:GiveTask(v_u_7.InputChanged:Connect(function(p17)
        if p_u_14.is_dragging and v_u_6[p17.UserInputType] then
            p_u_14.drag_changed:Fire(p_u_14.instance, p17)
        end
    end))
    return p_u_14
end
return v8