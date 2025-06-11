--// ReplicatedStorage.RoactComponents.Apps.HouseEditorApp.VerticalDottedLine (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Roact")
return function(p2)
    local v3 = 1 / p2.NumberOfDots
    local v4 = {}
    for v5 = 1, p2.NumberOfDots do
        v4[v5] = v_u_1.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["BackgroundColor3"] = p2.Color,
            ["Size"] = UDim2.new(1, 0, v3, -p2.Padding),
            ["Position"] = UDim2.new(0, 0, (v5 - 1) * v3, 0)
        })
    end
    return v_u_1.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["Position"] = p2.Position,
        ["Size"] = p2.Size
    }, v4)
end