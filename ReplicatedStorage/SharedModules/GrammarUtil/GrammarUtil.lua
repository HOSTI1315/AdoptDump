--// ReplicatedStorage.SharedModules.GrammarUtil (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("CloudValues")
local v_u_3 = v_u_1("RarityDB")
local v4 = v_u_1("package:t")
local v_u_5 = {
    ["rideable"] = "(R)",
    ["flyable"] = "(F)",
    ["mega_neon"] = "(M)",
    ["neon"] = "(N)"
}
local v_u_6 = {
    "neon",
    "mega_neon",
    "flyable",
    "rideable"
}
local v_u_7 = {
    ["neon"] = "mega_neon"
}
local v_u_12 = {
    ["get_a_or_an"] = function(p8)
        return ({
            ["a"] = true,
            ["e"] = true,
            ["i"] = true,
            ["o"] = true,
            ["u"] = true
        })[string.lower((string.sub(p8, 1, 1)))] and "an" or "a"
    end,
    ["get_plural_or_singular"] = function(p9, p10, p11)
        if p9 == 1 then
            return p11
        else
            return p10
        end
    end
}
local v13 = v4.strictInterface
local v14 = {
    ["entry"] = v4.interface({
        ["name"] = v4.string,
        ["rarity"] = v4.string,
        ["is_proper_name"] = v4.optional(v4.boolean)
    }),
    ["subject_phrase"] = v4.string,
    ["verb_phrase"] = v4.string
}
local v_u_15 = v13(v14)
function v_u_12.build_subject_verb_item_string(p16)
    local v17 = v_u_15
    assert(v17(p16))
    local v18 = p16.entry
    local v19 = p16.subject_phrase
    local v20 = p16.verb_phrase
    local v21 = v18.name
    local v22 = v18.is_proper_name
    local v23 = v_u_3[v18.rarity].name
    if v_u_2:getValue("cloud_actions", "localizationRemoveAOrAnTranslations") then
        return ("%s %s: %s (%s)"):format(v19, v20, v21, v23)
    end
    local v24 = v19 .. " " .. v20 .. " "
    local v25
    if v22 then
        v25 = v24 .. v21 .. " "
    else
        v25 = v24 .. v_u_12.get_a_or_an(v21) .. " " .. v21 .. " "
    end
    return v25 .. "(" .. v23 .. ")"
end
function v_u_12.append_properties(p26, p27)
    local v28 = not p26 and "" or v_u_1("TranslationHelper").translate(workspace, p26)
    if p27 then
        for _, v29 in v_u_6 do
            if p27[v29] and not p27[v_u_7[v29]] then
                v28 = ("%s %s"):format(v28, v_u_5[v29])
            end
        end
    end
    return v28
end
return v_u_12