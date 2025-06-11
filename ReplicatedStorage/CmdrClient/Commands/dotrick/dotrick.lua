--// ReplicatedStorage.CmdrClient.Commands.dotrick (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("InventoryDB")
local v_u_3 = v_u_1("EquippedPets")
local v_u_4 = v_u_1("AdoptMeEnums/PetEntities/PetCommandType")
return {
    ["Name"] = "dotrick",
    ["Aliases"] = { "trick" },
    ["Description"] = "Make your pet perform a trick",
    ["Group"] = "Debug",
    ["Args"] = { function(p5)
            local v6 = {}
            local v7 = {}
            for _, v9 in v_u_3.get_my_equipped_char_wrappers() do
                local v9
                if v9 then
                    v9 = v_u_2.pets[v9.pet_id]
                end
                if v9 then
                    v9 = v9.tricks
                end
                for _, v10 in v9 do
                    local v11 = v10[1]
                    if not v6[v11] then
                        v6[v11] = true
                        table.insert(v7, v11)
                    end
                end
            end
            local v12 = #v7 == 0 and { "no_pet" } or v7
            return {
                ["Type"] = p5.Cmdr.Util.MakeEnumType("trick", v12),
                ["Name"] = "Trick",
                ["Description"] = "Trick you want your pet to perform"
            }
        end },
    ["ClientRun"] = function(_, p13)
        local v14 = v_u_1("PetWorldState")
        for _, v15 in v_u_3.get_my_equipped_char_wrappers() do
            v14.buffer_command(v15.char, v_u_4.DoTrick, {
                ["trick_name"] = p13
            })
        end
        return "Performing trick"
    end
}