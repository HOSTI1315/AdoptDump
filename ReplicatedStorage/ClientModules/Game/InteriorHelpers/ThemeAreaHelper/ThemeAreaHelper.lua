--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.ThemeAreaHelper (ModuleScript)

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(game.ReplicatedStorage.Fsys).load
local v3 = v2("SharedConstants")
local v_u_4 = v2("LiveOpsTime")
local v5 = v2("Maid")
local v_u_6 = v3.theme_area
local v_u_7 = v_u_6.enabled
local v_u_8 = v5.new()
local v_u_14 = {
    ["is_active"] = function()
        local v9 = v_u_7
        if v9 then
            v9 = v_u_4.is_within_timestamps(v_u_6.start_date, v_u_6.end_date)
        end
        return v9
    end,
    ["render"] = function(p10, _)
        local v11 = p10:FindFirstChild("ThemeArea")
        local v12
        if v11 then
            v12 = v11:FindFirstChild("ThemeAreaComingSoon")
        else
            v12 = v11
        end
        local v13 = v11 and not v12 and v_u_1.Resources:FindFirstChild("ThemeAreaComingSoon")
        if v13 then
            v13 = v13:Clone()
            v13:PivotTo(v11.ThemeRoot:GetPivot())
        end
        if v_u_7 then
            if v_u_14.is_active() then
                if v13 then
                    v13:Destroy()
                    return
                end
            elseif v13 then
                v13.Parent = p10
                v11:Destroy()
            end
        else
            if v13 then
                v13:Destroy()
            end
            if v11 then
                v11:Destroy()
                return
            end
        end
    end,
    ["register_interactions"] = function(_, _)
        if not (v_u_7 and v_u_14.is_active()) then
        end
    end,
    ["cleanup"] = function(_, _)
        if v_u_7 then
            v_u_8:DoCleaning()
        end
    end
}
return v_u_14