--// ReplicatedStorage.CmdrClient.Types.item (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Sift")
local v_u_3 = v1("InventoryDB")
return function(p4)
    local v5 = {}
    for v6, v7 in pairs(v_u_3) do
        for v8, v9 in pairs(v7) do
            if not v9.temporary then
                table.insert(v5, ("%s:%s"):format(v6, v8))
            end
        end
    end
    local v_u_10 = p4.Cmdr.Util.MakeFuzzyFinder(v5)
    local v_u_11 = p4.Cmdr.Util.MakeFuzzyFinder(v_u_2.Dictionary.keys(v_u_3))
    p4:RegisterType("item", {
        ["Transform"] = function(p12)
            return v_u_10(p12), p12
        end,
        ["Validate"] = function(p13)
            local v14 = string.split
            local v15 = p13[1] or ""
            local v16, v17 = unpack(v14(v15, ":"))
            local v18 = v_u_3[v16]
            if v18 then
                v18 = v_u_3[v16][v17]
            end
            return v18 and (v18.temporary and "Cannot add temporary items via addItem" or true) or "Invalid item"
        end,
        ["Autocomplete"] = function(p19, p20)
            if p20:find(":") then
                return p19
            else
                return v_u_2.List.map(v_u_11(p20), function(p21)
                    return p21 .. ":"
                end), {
                    ["IsPartial"] = true
                }
            end
        end,
        ["Parse"] = function(p22)
            local v23 = string.split
            local v24 = p22[1] or ""
            local v25, v26 = unpack(v23(v24, ":"))
            return {
                ["category"] = v25,
                ["name"] = v26
            }
        end
    })
end