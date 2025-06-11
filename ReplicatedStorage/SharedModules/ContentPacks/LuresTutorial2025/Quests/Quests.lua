--// ReplicatedStorage.SharedModules.ContentPacks.LuresTutorial2025.Quests (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("QuestFrameStyleDB")
local v3 = {}
local v7 = {
    ["name"] = "Place a Bait on a Lure.",
    ["reward"] = v_u_1("QuestsDBHelper").make_bucks_reward(50),
    ["frame_info"] = {
        ["style"] = v2.lures_2023_daily
    },
    ["quest_help_entry"] = "lures_tutorial",
    ["can_step_quest"] = function(p4, p5)
        if p4.name == "quest_added" and p4.options.quest_unique_id == p5.unique_id then
            local v6 = v_u_1("DataM").get_store(p4.player)
            if v6 then
                v6 = v6:get("lures_2023_lure_manager")
            end
            if v6 and v6:has_ever_used_lure() then
                return true
            end
        elseif p4.name == "lure_baited" then
            return true
        end
        return false
    end
}
v3.tutorial_place_lure = v7
return {
    ["lures_tutorial_quests"] = v3
}