--// ReplicatedStorage.ClientDB.Housing.FurnitureDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("ContentPackHelper")
local v_u_3 = v1("EntryHelper")
local v_u_4 = v1("InventoryDB")
local v_u_5 = v1("package:Sift")
local v_u_6 = {}
(function()
    local v_u_7 = {}
    local function v10(p8)
        for _, v9 in p8 do
            if v_u_7[v9.kind] then
                error((("Two entries have the same kind: %*"):format(v9.kind)))
            else
                v_u_7[v9.kind] = true
            end
            if not v9.typechecked then
                error((("%* was not properly typechecked. Make sure you\'re using EntryHelper.lua"):format(v9.kind)))
            end
            v_u_6[v9.kind] = v9
        end
    end
    v_u_2.foreach("Furniture", v10)
    local v12 = v_u_5.Dictionary.map(v_u_4.pets, function(p11)
        return p11.generate_npc_furniture_on_runtime and not v_u_7[p11.kind] and {
            ["name"] = p11.name,
            ["model_name"] = p11.kind
        } or nil
    end)
    v10(v_u_3.furniture(v12))
end)()
return v_u_6