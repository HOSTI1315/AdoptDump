--// ReplicatedStorage.ClientDB.DepthButtonColorDB (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("package:t")
local v2 = v1.strictInterface({
    ["base"] = v1.Color3,
    ["highlight"] = v1.Color3,
    ["shadow_middle"] = v1.Color3,
    ["shadow_left"] = v1.Color3,
    ["shadow_right"] = v1.Color3
})
local v3 = {
    ["green"] = {
        ["base"] = Color3.fromRGB(74, 198, 85),
        ["highlight"] = Color3.fromRGB(140, 216, 100),
        ["shadow_middle"] = Color3.fromRGB(43, 165, 69),
        ["shadow_right"] = Color3.fromRGB(32, 140, 53)
    },
    ["orange"] = {
        ["base"] = Color3.fromRGB(247, 147, 30),
        ["highlight"] = Color3.fromRGB(251, 176, 59),
        ["shadow_middle"] = Color3.fromRGB(239, 114, 60),
        ["shadow_right"] = Color3.fromRGB(224, 98, 27)
    },
    ["blue"] = {
        ["base"] = Color3.fromRGB(12, 151, 255),
        ["highlight"] = Color3.fromRGB(82, 186, 255),
        ["shadow_middle"] = Color3.fromRGB(0, 116, 255),
        ["shadow_right"] = Color3.fromRGB(41, 94, 255)
    },
    ["black"] = {
        ["base"] = Color3.fromRGB(68, 69, 71),
        ["highlight"] = Color3.fromRGB(102, 106, 109),
        ["shadow_middle"] = Color3.fromRGB(51, 51, 51),
        ["shadow_right"] = Color3.fromRGB(26, 26, 26)
    },
    ["red"] = {
        ["base"] = Color3.fromRGB(216, 42, 63),
        ["highlight"] = Color3.fromRGB(242, 78, 78),
        ["shadow_middle"] = Color3.fromRGB(175, 23, 56),
        ["shadow_right"] = Color3.fromRGB(155, 14, 51)
    }
}
for _, v4 in pairs(v3) do
    v4.shadow_left = v4.shadow_left or v4.base
    local v5 = v2(v4)
    assert(v5, "Depth button color failed to validate.")
end
return v3