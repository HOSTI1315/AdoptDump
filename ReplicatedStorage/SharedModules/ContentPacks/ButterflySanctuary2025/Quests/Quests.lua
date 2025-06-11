--// ReplicatedStorage.SharedModules.ContentPacks.ButterflySanctuary2025.Quests (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.ClientDB.TaskBoard.QuestsDBHelper)
local v3 = require(game.ReplicatedStorage.Fsys).load("QuestFrameStyleDB")
local v4 = {}
local v5 = {}
local v6 = {
    ["name"] = "Visit the Butterfly Sanctuary!",
    ["can_reroll"] = false,
    ["sort_override"] = 101,
    ["contributes_to_quest_limit"] = false,
    ["reward"] = v2.make_teleport_reward({ "Butterfly2025Sanctuary", "MainDoor" }),
    ["can_step_quest"] = function(_)
        return false
    end,
    ["frame_info"] = {
        ["style"] = v3.Butterfly2025,
        ["template"] = "TeleportTemplate"
    }
}
v5.butterfly_2025_navigate = v6
v4.butterfly_2025 = v5
return v4