--// ReplicatedStorage.ClientModules.UI.PizzaShopDriveThroughSpeechBubbleGui.story (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Roact")
local v_u_3 = v1("Signal")
local v_u_4 = require(script.Parent.PizzaShopDriveThroughSpeechBubbleGui)
return function(p5)
    local v6 = {
        "Cheese",
        "Pepperoni",
        "Veggie",
        "Hawaiian"
    }
    local v_u_7 = v_u_3.new()
    local v_u_8 = v_u_3.new()
    local v9 = v_u_2.createElement
    local v10 = {
        ["Size"] = UDim2.new(0, 128, 0, 128)
    }
    local v11 = {
        ["Fail"] = v_u_2.createElement("TextButton", {
            ["Size"] = UDim2.new(0.5, 0, 0.25, 0),
            ["Position"] = UDim2.new(0, 0, 0.75, 0),
            ["Text"] = "FAIL",
            [v_u_2.Event.Activated] = function()
                v_u_7:Fire("NoBox")
            end
        }),
        ["Succeed"] = v_u_2.createElement("TextButton", {
            ["Size"] = UDim2.new(0.5, 0, 0.25, 0),
            ["Position"] = UDim2.new(0.5, 0, 0.75, 0),
            ["Text"] = "PASS",
            [v_u_2.Event.Activated] = function()
                v_u_8:Fire()
            end
        }),
        ["Test"] = v_u_2.createElement("Frame", {
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.new(0.5, 0, 0.125, 0),
            ["Size"] = UDim2.new(0, 64, 0, 64),
            ["BackgroundTransparency"] = 1,
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
        }, { v_u_2.createElement(v_u_4, {
                ["PizzaType"] = v6[math.random(1, #v6)],
                ["OnFinished"] = function()
                    print("Finished")
                end,
                ["Frustrated"] = v_u_7,
                ["Satisfied"] = v_u_8
            }) })
    }
    local v12 = v9("Frame", v10, v11)
    local v_u_13 = v_u_2.mount(v12, p5, "CardBan")
    return function()
        v_u_2.unmount(v_u_13)
    end
end