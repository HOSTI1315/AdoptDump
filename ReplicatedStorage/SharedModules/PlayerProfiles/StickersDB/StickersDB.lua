--// ReplicatedStorage.SharedModules.PlayerProfiles.StickersDB (ModuleScript)

local v1 = {
    ["stickers"] = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("InventoryDB").stickers
}
local v2 = {
    ["all"] = {
        ["index"] = 1,
        ["name"] = "All",
        ["image"] = "rbxassetid://16722877105"
    },
    ["pets"] = {
        ["index"] = 2,
        ["name"] = "Pets",
        ["image"] = "rbxassetid://16723019826"
    },
    ["petwear"] = {
        ["index"] = 3,
        ["name"] = "Pet Wear",
        ["image"] = "rbxassetid://16725499335"
    },
    ["emotes"] = {
        ["index"] = 4,
        ["name"] = "Emotes",
        ["image"] = "rbxassetid://16712390722"
    },
    ["environment"] = {
        ["index"] = 5,
        ["name"] = "Environment",
        ["image"] = "rbxassetid://16712646469"
    },
    ["vehicles"] = {
        ["index"] = 6,
        ["name"] = "Vehicles",
        ["image"] = "rbxassetid://16725599967"
    },
    ["buildings"] = {
        ["index"] = 7,
        ["name"] = "Buildings",
        ["image"] = "rbxassetid://16712335508"
    },
    ["misc"] = {
        ["index"] = 8,
        ["name"] = "Miscellaneous",
        ["image"] = "rbxassetid://16714835666"
    }
}
v1.categories = v2
for v3, v4 in v1.categories do
    v4.kind = v3
end
return v1