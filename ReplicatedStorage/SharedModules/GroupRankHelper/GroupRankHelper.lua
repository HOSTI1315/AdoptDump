--// ReplicatedStorage.SharedModules.GroupRankHelper (ModuleScript)

local v_u_1 = game:GetService("GroupService")
local v_u_2 = nil
local v_u_3 = {
    ["founder"] = "rbxassetid://134774943953693",
    ["developer"] = "rbxassetid://134774943953693",
    ["staff"] = "rbxassetid://134774943953693",
    ["influencer"] = "rbxassetid://93946093561589",
    ["friend"] = "rbxassetid://84667805159408"
}
return {
    ["get_rank_from_player"] = function(p4, p5)
        return p4:GetRankInGroup(p5 or 295182)
    end,
    ["get_rank_from_user_id"] = function(p6)
        for _, v7 in v_u_1:GetGroupsAsync(p6) do
            if v7.Id == 295182 then
                return v7.Rank
            end
        end
        return 0
    end,
    ["get_tag_from_rank"] = function(p8)
        return p8 == 91 and "influencer" or (p8 == 92 and "contributor" or (p8 == 95 and "adviser" or (p8 == 100 and "tester" or (p8 == 245 and "admin" or (p8 == 246 and "staff" or (p8 >= 247 and p8 <= 253 and "developer" or (p8 >= 254 and "founder" or nil)))))))
    end,
    ["get_icon_from_tag"] = function(p9)
        return v_u_3[p9]
    end,
    ["get_group_info"] = function()
        if not v_u_2 then
            v_u_2 = v_u_1:GetGroupInfoAsync(295182)
        end
        return v_u_2
    end
}