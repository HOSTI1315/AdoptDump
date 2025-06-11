--// ReplicatedStorage.CmdrClient.Commands.performances (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v12 = {
    ["Name"] = "performances",
    ["Aliases"] = {},
    ["Description"] = "Stage or end a performance on your equipped pet",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p2)
            return {
                ["Type"] = p2.Cmdr.Util.MakeEnumType("option", { "stage", "end" }),
                ["Name"] = "Action",
                ["Description"] = "Stage or end"
            }
        end,
        {
            ["Type"] = "petPerformance",
            ["Name"] = "Performance",
            ["Description"] = "Performance to stage or end"
        }
    },
    ["ClientRun"] = function(_, p3, p4)
        local v5 = v_u_1("EquippedPets")
        local v6 = v_u_1("PetEntityHelper")
        local v7 = v_u_1("PetEntityManager")
        local v8 = v5.get_my_equipped_char_wrappers()
        if not v8 or #v8 <= 0 then
            return string.format("Failed to %s performance -- couldn\'t get equipped pet entity.", p3)
        end
        for _, v10 in v8 do
            if v10 then
                local v10 = v10.char
            end
            local v11 = v7.get_pet_entity(v10)
            if v11 then
                if p3 == "stage" then
                    v6.stage_performance(v11, {
                        ["name"] = p4
                    })
                elseif p3 == "end" then
                    v6.end_performance(v11, p4)
                end
            end
        end
        return string.format("%s %s performance.", p3 == "stage" and "Staged" or "Ended", p4)
    end
}
return v12