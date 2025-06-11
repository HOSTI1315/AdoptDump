--// ReplicatedStorage.RoactComponents.Elements.Frames (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v1("UIDB")
local v_u_2 = v1("Roact")
local v3 = {}
local v_u_4 = v_u_2.createElement
function v3.PaddedFrame(p5)
    local v6 = p5.padding or 4
    local v7 = p5.size or UDim2.new(1, 0, 1, 0)
    local v8 = p5.position or UDim2.new()
    return v_u_4("Frame", {
        ["Size"] = v7 + UDim2.new(0, -v6 * 2, 0, -v6 * 2),
        ["Position"] = v8 + UDim2.new(0, v6, 0, v6),
        ["BackgroundTransparency"] = 1
    }, p5[v_u_2.Children])
end
return v3