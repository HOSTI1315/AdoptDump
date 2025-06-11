--// ReplicatedStorage.ClientModules.UI.PizzaShopOrderBoardGui.story (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("package:Roact")
local v_u_2 = require(script.Parent.PizzaShopOrderBoardGui)
return function(p3)
    local v4 = {
        "Cheese",
        "Pepperoni",
        "Veggie",
        "Hawaiian"
    }
    local v5 = {}
    for _ = 1, 32 do
        local v6 = {
            ["pizza_type"] = v4[math.random(1, #v4)],
            ["from_player"] = math.random(1, 2) == 1,
            ["time_remaining"] = math.random(1, 300)
        }
        table.insert(v5, v6)
    end
    local v7 = 1203 * 0.75
    local v8 = 420 * 0.75
    local v9 = v_u_1.createElement("Frame", {
        ["Size"] = UDim2.new(0, v7, 0, v8),
        ["BackgroundTransparency"] = 1,
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
    }, { v_u_1.createElement(v_u_2, {
            ["Orders"] = v5
        }) })
    local v_u_10 = v_u_1.mount(v9, p3, "CardBan")
    return function()
        v_u_1.unmount(v_u_10)
    end
end