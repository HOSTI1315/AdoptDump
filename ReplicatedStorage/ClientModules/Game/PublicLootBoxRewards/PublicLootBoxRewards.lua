--// ReplicatedStorage.ClientModules.Game.PublicLootBoxRewards (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("InventoryDB")
local v_u_4 = v1("RarityDB")
local v5 = v1("Signal")
local v_u_6 = v1("Number")
local v_u_7 = v1("package:Promise")
local v_u_8 = v1("SpecialLootBoxTypesHelper")
local v_u_9 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game:GetService("Players").LocalPlayer)
local v_u_10 = {}
local v_u_11 = nil
local v_u_12 = v5.new()
function v_u_10.request()
    return v_u_7.new(function(p13)
        if not v_u_11 then
            v_u_12:Wait()
        end
        p13(v_u_11)
    end)
end
function v_u_10.format_drop_chance_human_readable(p14, p15)
    local v16 = p15 or {}
    local v17 = v16.decimal_places or 1
    local v18 = v16.use_fractions or false
    local v19 = v16.fraction_denominator or 100
    if v18 then
        return v_u_6.round(p14 * v19) .. "/" .. v19
    end
    local v20 = v_u_6.round(p14 * 100, v17)
    if not v16.decimal_places then
        while v17 < 4 do
            local v21 = v20 - p14
            if math.abs(v21) <= 0.00001 then
                break
            end
            v17 = v17 + 1
            v20 = v_u_6.round(p14 * 100, v17)
        end
    end
    return v20 .. "%"
end
function v_u_10.format_drop_human_readable(p22, p23, p24)
    return ("%s: %s"):format(p22, (v_u_10.format_drop_chance_human_readable(p23, p24)))
end
function v_u_10.convert_to_human_readable(p25, p26)
    local v27 = {}
    for v28, v29 in ipairs(p25.possible_loot) do
        local v30 = {}
        for v31, v32 in ipairs(v29.rewards) do
            local v33 = v_u_8.get_name_transform(v32.category)
            local v34
            if v33 then
                v34 = v33(v32)
            else
                local v35 = v_u_3[v32.category][v32.kind]
                v34 = v_u_9:Translate(workspace, v35.name)
            end
            v30[v31] = v34
        end
        v27[v28] = v_u_10.format_drop_human_readable(table.concat(v30, ", "), v29.chance, p26)
    end
    return table.concat(v27, "\n")
end
function v_u_10.convert_rarity_chances_to_human_readable(p36, p37)
    local v38 = {}
    for v39, v40 in p36.rarity_chances do
        local v41 = v_u_4[v40.rarity]
        local v42 = v_u_9:Translate(workspace, v41.name)
        v38[v39] = v_u_10.format_drop_human_readable(v42, v40.chance, p37)
    end
    if p36.forced_chances then
        for _, v43 in p36.forced_chances do
            local v44 = v_u_9:Translate(workspace, v43.name)
            local v45 = v_u_10.format_drop_human_readable
            local v46 = v43.chance
            table.insert(v38, v45(v44, v46, p37))
        end
    end
    return table.concat(v38, "\n")
end
function v_u_10.init()
    v_u_7.try(function()
        v_u_11 = v_u_2.get("LootBoxAPI/RequestPublicDBEntries"):InvokeServer()
        v_u_12:Fire()
    end)
end
return v_u_10