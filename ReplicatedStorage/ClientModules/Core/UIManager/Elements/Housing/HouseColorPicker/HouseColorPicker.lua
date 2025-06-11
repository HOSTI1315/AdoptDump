--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Housing.HouseColorPicker (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")("HouseColorPicker", v1("UIBaseElement"))
function v2.get_color(p3)
    return p3.selected_color
end
function v2.set_color(p4, p5)
    p4.selected_color = p5
    local v6, v7, v8 = Color3.toHSV(p5)
    local v9 = Color3.fromHSV
    local v10 = v8 - 0.3
    local v11 = v9(v6, v7, (math.clamp(v10, 0, 1)))
    local v12 = Color3.fromHSV
    local v13 = v8 - 0.22
    local v14 = v12(v6, v7, (math.clamp(v13, 0, 1)))
    p4.instance.Face.Colors.Base.BackgroundColor3 = p5
    p4.instance.Face.Colors.Circle.BackgroundColor3 = v14
    p4.instance.Shadow.Colors.Middle.BackgroundColor3 = v14
    p4.instance.Outline.BackgroundColor3 = v11
end
function v2.start(p_u_15, p_u_16)
    p_u_15:set_color(p_u_16.initial_color)
    p_u_15.choosing_color = false
    p_u_15.button = p_u_15.UIManager.wrap(p_u_15.instance, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            if p_u_15.choosing_color then
                return
            else
                p_u_15.choosing_color = true
                local v17 = p_u_15.UIManager.apps.ColorPickerApp:pick_color({
                    ["request_source"] = "house_exterior",
                    ["no_advanced"] = true,
                    ["starter_color"] = p_u_15.selected_color
                })
                p_u_15.choosing_color = false
                if v17 then
                    p_u_15:set_color(v17)
                    p_u_16.on_color_picked(v17)
                end
            end
        end
    })
    return p_u_15
end
return v2