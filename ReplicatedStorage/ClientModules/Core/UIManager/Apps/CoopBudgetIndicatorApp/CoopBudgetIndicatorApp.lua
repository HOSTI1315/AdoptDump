--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.CoopBudgetIndicatorApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v_u_1("ClientData")
v_u_1("PlatformM")
v_u_1("RouterClient")
local v2 = v_u_1("Class")
local v3 = v_u_1("PlatformM")
local v_u_4 = v_u_1("CurrencyIndicatorBaseApp")
local v5 = v2("CoopBudgetIndicatorApp", v_u_4)
v3.get_platform()
function v5.get_currency(_)
    local v6 = v_u_1("HouseClient").get_current_house_coop()
    if v6 then
        v6 = v6.budget
    end
    return v6 or 0
end
function v5.on_currency_changed(_, p_u_7)
    local v_u_8 = v_u_1("HouseClient")
    local v_u_9 = nil
    local function v12()
        local v10 = v_u_9 == nil
        local v11 = v_u_1("HouseClient").get_current_house_coop()
        if v11 then
            v11 = v11.budget
        end
        v_u_9 = v11
        if v_u_9 then
            p_u_7(v_u_9, v10)
        end
    end
    v_u_8.house_interior_changed:Connect(v12)
    v_u_8.housing_coop_changed:Connect(function(p13, _)
        if p13 == v_u_8.get_current_house_owner() then
            local v14 = v_u_9 == nil
            local v15 = v_u_1("HouseClient").get_current_house_coop()
            if v15 then
                v15 = v15.budget
            end
            v_u_9 = v15
            if v_u_9 then
                p_u_7(v_u_9, v14)
            end
        end
    end)
end
function v5.start(p16)
    v_u_4.start(p16, "coop_budget", "%s")
    coroutine.wrap(function()
        v_u_1("HouseClient").house_interior_changed:Connect(function()
            v_u_1("UIManager").refresh_all_apps()
        end)
    end)()
end
return v5