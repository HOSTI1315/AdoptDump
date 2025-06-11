--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppBackpack (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("new:ActionHelper")
local v3 = v1("Class")
local v_u_4 = v1("InventoryDB")
local v_u_5 = v1("PlatformM")
local v6 = v1("TweenHelper")
local v_u_7 = v1("TweenPromise")
local v_u_8 = v1("new:UseItemHelper")
local v_u_9 = v1("package:Promise")
local v_u_10 = {
    ["PetLeash"] = true,
    ["ChewToyTool"] = true,
    ["FlyingDiscTool"] = true,
    ["ThrowToyTool"] = true,
    ["SqueakyToyTool"] = true
}
local v_u_11 = v6.tween_info({
    ["time"] = 0.12
})
local v12 = v3("FocusPetAppBackpack", v1("UIBaseElement"))
function v12._update_size(p13)
    v_u_7.new(p13.ui_scale, v_u_11, {
        ["Scale"] = p13.hovering and 1.1 or 1
    })
end
function v12.toggle_backpack(p_u_14)
    if p_u_14.hidden then
        return
    elseif p_u_14.UIManager.is_visible("BackpackApp") then
        p_u_14.UIManager.set_app_visibility("BackpackApp", false)
    else
        local v19 = v_u_9.try(function()
            local v16 = {
                ["visible_backpack_categories"] = { "food", "toys", "strollers" },
                ["allow_callback"] = function(p15)
                    return p15.category ~= "toys" and true or v_u_10[v_u_4[p15.category][p15.kind].tool]
                end
            }
            return p_u_14.UIManager.apps.BackpackApp:pick_item(v16)
        end):andThen(function(p17)
            if p17 then
                local v18 = p_u_14.UIManager.apps.FocusPetApp.char_wrapper
                v_u_8.use_item(v18, p17)
            end
        end)
        v19:finally(function()
            p_u_14.UIManager.apps.BackpackApp:try_pick_item(nil)
        end)
        v_u_2.run_promise(v19, { "dialog" })
    end
end
function v12.show(p20)
    p20.hidden = false
    p20.instance.Visible = true
end
function v12.hide(p21)
    p21.hidden = true
    p21.instance.Visible = false
end
function v12.start(p_u_22)
    p_u_22.ui_scale = p_u_22.instance.UIScale
    p_u_22.hidden = false
    p_u_22.hovering = false
    p_u_22.instance.MouseEnter:connect(function()
        p_u_22.hovering = true
        p_u_22:_update_size()
    end)
    p_u_22.instance.MouseLeave:connect(function()
        p_u_22.hovering = false
        p_u_22:_update_size()
    end)
    p_u_22.instance[v_u_5.mouse_down_or_click()]:connect(function()
        p_u_22:toggle_backpack()
    end)
    p_u_22.UIManager.wrap(p_u_22.instance.XboxButton, "GamepadIcon"):start({
        ["key"] = Enum.KeyCode.ButtonY
    })
end
return v12