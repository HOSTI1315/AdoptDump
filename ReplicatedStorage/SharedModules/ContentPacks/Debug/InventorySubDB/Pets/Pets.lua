--// ReplicatedStorage.SharedModules.ContentPacks.Debug.InventorySubDB.Pets (ModuleScript)

if game:GetService("RunService"):IsStudio() ~= true then
    return {}
end
local v1 = game.ReplicatedStorage:FindFirstChild("PetDebug")
if not v1 then
    return {}
end
local v2 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper)
local v3 = {}
for _, v4 in v1:GetChildren() do
    if v4:IsA("Model") then
        local v5 = "Debug_" .. v4.Name
        local v6 = {
            ["name"] = v4.Name,
            ["image"] = "",
            ["model"] = v4.Name,
            ["rarity"] = "common",
            ["temporary"] = true,
            ["origin_entry"] = {
                ["origin"] = "Debug",
                ["year"] = 0
            },
            ["anims"] = {
                ["double_hold"] = v4.Name .. "BeingHeldDouble",
                ["eating"] = v4.Name .. "Eat",
                ["hold"] = v4.Name .. "BeingHeldSingle",
                ["idle"] = v4.Name .. "Idle",
                ["running"] = v4.Name .. "Run",
                ["sit"] = v4.Name .. "Sit",
                ["sleep"] = v4.Name .. "Sleep"
            },
            ["tricks"] = {
                { "Sit", v4.Name .. "Sit" },
                { "Joyful", v4.Name .. "Joyful" },
                { "Beg", v4.Name .. "Beg" },
                { "Jump", v4.Name .. "Jump" },
                { "Trick 1", v4.Name .. "Trick1" },
                { "Trick 2", v4.Name .. "Trick2" }
            },
            ["neon_parts"] = {}
        }
        v3[v5] = v6
    end
end
return v2.pets(v3)