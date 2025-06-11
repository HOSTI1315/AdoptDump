--// ReplicatedStorage.CmdrClient.Commands.greet (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
return {
    ["Name"] = "greet",
    ["Aliases"] = {},
    ["Description"] = "Play pet greet reaction.",
    ["Group"] = "EveryoneOnRobloxInTesting",
    ["Args"] = {},
    ["ClientRun"] = function()
        local v2 = v_u_1("PetEntityManager")
        local v3 = v_u_1("PetEntityHelper")
        local v4 = v_u_1("PetReactionName")
        for _, v5 in v2.wait_for_local_owned_pet_entities() do
            v3.stage_reaction(v5, {
                ["name"] = v4.GreetOnJoinReaction
            })
        end
        return "Played pet reaction!"
    end
}