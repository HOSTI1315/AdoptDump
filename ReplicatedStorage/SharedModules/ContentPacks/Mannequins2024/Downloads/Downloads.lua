--// ReplicatedStorage.SharedModules.ContentPacks.Mannequins2024.Downloads (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v15 = {
    ["FurnitureMannequin/*"] = {
        ["get_model"] = function(p2, _, _, p3)
            local v4 = v_u_1("CharacterAppearance")
            local v5 = v_u_1("DefaultRobloxAppearance")
            local v6 = game.Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
            v6.HumanoidRootPart.Anchored = true
            v6.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            v6.Parent = workspace.CurrentCamera
            local v7 = p3.outfit or v5.get_default_outfit()
            local v8 = v7.assets
            local v9 = v5.new(p2, {
                ["base_avatar_description"] = v7.base_avatar
            })
            v4.new({
                ["char"] = v6
            }):update(v8, v9, true)
            task.wait()
            return v6
        end,
        ["check_rate_limiting"] = function(p10, _, _, _)
            local v11 = v_u_1("DataM")
            local v12 = v_u_1("TokenBucket")
            local v13 = v11.get_store(p10)
            if not v13 then
                return false
            end
            local v14 = v13:get("download_times") or {}
            v14.mannequin_token_bucket = v14.mannequin_token_bucket or v12.new(0.25, 5)
            v13:set("download_times", v14)
            return v14.mannequin_token_bucket:request()
        end
    }
}
return v15