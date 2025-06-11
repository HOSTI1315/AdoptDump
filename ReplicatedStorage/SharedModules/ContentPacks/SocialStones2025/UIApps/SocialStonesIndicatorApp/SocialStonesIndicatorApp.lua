--// ReplicatedStorage.SharedModules.ContentPacks.SocialStones2025.UIApps.SocialStonesIndicatorApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("SharedConstants")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("CurrencyIndicatorBaseApp")
local v6 = v2("SocialStonesIndicatorApp", v_u_5)
function v6.start(p_u_7)
    v_u_5.start(p_u_7, "social_stones_2025", "%s")
    local v8 = p_u_7.instance.CurrencyIndicator
    v8.Container.Backing.Image = v_u_3.social_stones.indicator_backing
    v8.Container.Amount.TextColor3 = v_u_3.social_stones.indicator_color
    p_u_7.toast_label_template.Label.TextColor3 = v_u_3.social_stones.indicator_color
    v8.LayoutOrder = 2000
    if v_u_4.get_platform() ~= "tablet" then
        local v9 = {
            ["on_press"] = function()
                v_u_5.on_click(p_u_7)
            end
        }
        p_u_7.UIManager.apps.SharedLayoutsApp:register_to_topbar(v8, v9)
    end
end
return v6