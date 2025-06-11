--// ReplicatedStorage.ClientModules.UI.PizzaShopOrderTabletGui.story (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("package:Roact")
local v_u_2 = require(script.Parent.PizzaShopOrderTabletGui)
return function(p3)
    local v4 = v_u_1.createElement("Frame", {
        ["Size"] = UDim2.new(0, 96, 0, 96),
        ["BackgroundTransparency"] = 1,
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
    }, { v_u_1.createElement(v_u_2, {
            ["GetIsActive"] = function()
                return false
            end,
            ["GetHasAccess"] = function()
                return math.random(1, 2) == 1
            end,
            ["OnOrdered"] = function(...)
                print("OnOrdered", ...)
            end,
            ["OnRejected"] = function()
                print("OnRejected")
            end
        }) })
    local v_u_5 = v_u_1.mount(v4, p3, "CardBan")
    return function()
        v_u_1.unmount(v_u_5)
    end
end