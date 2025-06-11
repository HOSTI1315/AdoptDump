--// ReplicatedStorage.ClientDB.Inventory.ContentPackDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("InventoryDB")
local v2 = {}
for _, v3 in v1 do
    for _, v4 in v3 do
        local v5 = v4.contentpack
        if v5 then
            if not v2[v5] then
                v2[v5] = {}
            end
            v2[v5][v4.kind] = v4
        end
    end
end
local v6 = {}
for v7, v8 in v2 do
    v6[v7] = {}
    for v9, _ in v1 do
        v6[v7][v9] = {}
    end
    for _, v10 in v8 do
        v6[v7][v10.category][v10.kind] = v10
    end
end
return {
    ["by_content_pack"] = v2,
    ["by_content_pack_then_category"] = v6
}