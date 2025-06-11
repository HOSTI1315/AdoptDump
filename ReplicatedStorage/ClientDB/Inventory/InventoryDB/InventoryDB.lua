--// ReplicatedStorage.ClientDB.Inventory.InventoryDB (ModuleScript)

local v_u_1 = game:GetService("ReplicatedStorage"):WaitForChild("SharedModules"):WaitForChild("ContentPacks")
local v_u_2 = require(game.ReplicatedFirst.Load.LoadTimers)
local v_u_3 = {
    ["pets"] = {},
    ["toys"] = {},
    ["food"] = {},
    ["gifts"] = {},
    ["roleplay"] = {},
    ["stickers"] = {},
    ["strollers"] = {},
    ["transport"] = {},
    ["pet_accessories"] = {}
}
local v_u_4 = {
    ["Pets"] = true,
    ["Toys"] = true,
    ["Food"] = true,
    ["Gifts"] = true,
    ["Roleplay"] = true,
    ["Stickers"] = true,
    ["Strollers"] = true,
    ["Transport"] = true,
    ["PetAccessories"] = true
}
(function()
    local v5 = {}
    for _, v6 in v_u_1:GetChildren() do
        local v7 = v6:FindFirstChild("InventorySubDB")
        if v7 then
            for _, v8 in v7:GetChildren() do
                if v_u_4[v8.Name] then
                    local v9 = v_u_2.start_misc_timer((("081_inventory_db_%*_%*"):format(v6.Name, v8.Name)))
                    local v10 = require(v8)
                    v9()
                    for _, v11 in v10 do
                        if v5[v11.kind] then
                            error((("Two entries have the same kind: %*"):format(v11.kind)))
                        else
                            v5[v11.kind] = true
                        end
                        if not v11.typechecked then
                            error((("%* was not properly typechecked. Make sure you\'re using EntryHelper.lua"):format(v11.kind)))
                        end
                        v_u_3[v11.category][v11.kind] = v11
                    end
                end
            end
        end
    end
end)()
return v_u_3