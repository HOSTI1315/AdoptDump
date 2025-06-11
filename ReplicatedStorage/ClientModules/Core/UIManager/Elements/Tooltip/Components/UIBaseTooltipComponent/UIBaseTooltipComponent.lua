--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.Components.UIBaseTooltipComponent (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("TableUtil")
local v4 = v2("UIBaseTooltipComponent")
function v4.__init(p5, p6, p7, p8)
    p5.UIManager = p6
    p5.instance = p7
    p5.tooltip = p8
    p5.options = {}
end
function v4._validate_options(_, _)
    error("Option validation has not been implemented.")
end
function v4.start(_) end
function v4.update(_) end
function v4.get_options(p9)
    return v_u_3.deep_copy(p9.options)
end
function v4.set_options(p10, p11)
    local v12, v13 = p10:_validate_options(p11)
    if not v12 then
        error(("Option validation failed for %s component: %s"):format(p10.ClassName, v13))
    end
    p10.options = p11
end
function v4.set_visible(p14, p15)
    p14.instance.Visible = p15
end
function v4.destroy(p16)
    if p16.flipbook then
        p16.flipbook:destroy()
    end
    p16.instance:Destroy()
end
return v4