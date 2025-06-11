--// ReplicatedStorage.SharedModules.ContentPacks.SocialStones2025.PlayerManagerBehaviors (ModuleScript)

return {
    ["load"] = function(_, p1, p2, _)
        p1:set("social_stones_2025", p2.stats.social_stones_june_2025 or 0)
    end,
    ["save"] = function(p3, p4)
        p4.stats.social_stones_june_2025 = p3:get("social_stones_2025")
    end
}