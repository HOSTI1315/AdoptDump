--// ReplicatedStorage.ClientDB.RarityDB (ModuleScript)

local v1 = {
    ["common"] = {
        ["name"] = "Common",
        ["color"] = Color3.new(0, 0, 1),
        ["value"] = 1
    },
    ["uncommon"] = {
        ["name"] = "Uncommon",
        ["color"] = Color3.new(0.3764705882352941, 0, 1),
        ["value"] = 2
    },
    ["rare"] = {
        ["name"] = "Rare",
        ["color"] = Color3.new(0.23137254901960785, 0.7568627450980392, 0),
        ["value"] = 3
    },
    ["ultra_rare"] = {
        ["name"] = "Ultra-Rare",
        ["color"] = Color3.new(1, 0, 0),
        ["value"] = 4
    },
    ["legendary"] = {
        ["name"] = "Legendary",
        ["color"] = Color3.new(0, 0, 0),
        ["value"] = 5
    },
    ["event"] = {
        ["name"] = "Event",
        ["color"] = Color3.fromRGB(255, 170, 0),
        ["value"] = 6
    },
    ["house"] = {
        ["name"] = "House",
        ["color"] = Color3.fromRGB(139, 69, 19),
        ["value"] = 7
    }
}
for v2, v3 in v1 do
    v3.key = v2
end
return v1