--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.DiscosplosionPerformance (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_2 = game:GetService("Workspace")
local function v_u_8(p3)
    local v4 = {}
    for _, v5 in p3 do
        local v6 = table.concat(v5, " ")
        local v7 = v5[2]
        if v6:lower():find("dance") or v6:lower():find("trick") then
            table.insert(v4, v7)
        end
    end
    if #v4 > 0 then
        return v4[math.random(1, #v4)]
    end
end
return {
    ["name"] = script.Name,
    ["validate"] = function(_, p9)
        local v10 = p9.discosplosion
        local v11
        if v10 == nil then
            v11 = false
        else
            v11 = v10:IsDescendantOf(v_u_2)
        end
        return v11
    end,
    ["init_performance"] = function(p12, p13)
        return {
            ["discosplosion"] = p13.discosplosion,
            ["trick_anim_name"] = v_u_8(p12.base.entry.tricks)
        }
    end,
    ["step"] = function(p14, p15)
        local v16 = p15.discosplosion
        local v17 = p14.base.root.Position
        local v18 = v16.Position
        if not v16:IsDescendantOf(v_u_2) or (v17 - v18).magnitude > 25 then
            return v_u_1.Complete
        end
    end,
    ["calculate_modifiers"] = function(p19, p20)
        return p19.move_state.is_moving and {} or {
            ["anim_name"] = p20.trick_anim_name or nil,
            ["eyes_id"] = "happy_eyes",
            ["effects"] = { "sparkly" }
        }, {}
    end
}