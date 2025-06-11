--// ReplicatedStorage.CmdrClient.Commands.impersonatenpc (ModuleScript)

local v1 = {
    ["Name"] = "impersonatenpc",
    ["Aliases"] = { "npc" },
    ["Description"] = "Impersonates the selected NPC.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "npc",
            ["Name"] = "NPC Kind",
            ["Description"] = "The kind of the NPC to impersonate."
        }
    }
}
return v1