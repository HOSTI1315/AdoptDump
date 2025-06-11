--// ReplicatedStorage.new.modules.SoundOptimizer (ModuleScript)

local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("SoundService")
local v_u_14 = {
    ["start_server"] = function()
        -- failed to decompile
    end,
    ["start"] = function()
        if v_u_3:IsServer() then
            v_u_14.start_server()
        end
        local function v7(p_u_5)
            debug.profilebegin("SoundOptimizer for_tagged")
            if p_u_5:IsA("Sound") then
                if p_u_5.SoundId == "" then
                    p_u_5.Played:Once(function(p6)
                        debug.profilebegin("SoundOptimizer Played")
                        if p6 == "" then
                            v_u_14.restore(p_u_5)
                            p_u_5:Play()
                        end
                        debug.profileend()
                    end)
                    debug.profileend()
                end
            else
                return
            end
        end
        v_u_1:GetInstanceAddedSignal("SoundOptimizerOptimized"):Connect(v7)
        for _, v8 in v_u_1:GetTagged("SoundOptimizerOptimized") do
            task.spawn(v7, v8)
        end
    end,
    ["get_id"] = function(p9)
        return p9.SoundId == "" and (p9:GetAttribute("SoundOptimizerId") or "") or p9.SoundId
    end,
    ["restore"] = function(p10)
        if typeof(p10) == "Instance" and (p10:IsA("Sound") and p10:GetAttribute("SoundOptimizerId")) then
            p10.SoundId = p10:GetAttribute("SoundOptimizerId")
            p10:SetAttribute("SoundOptimizerId", nil)
            p10:RemoveTag("SoundOptimizerOptimized")
            local v11
            if p10.SoundGroup then
                v11 = p10.SoundGroup.Name
            else
                v11 = p10:GetAttribute("SoundGroup")
            end
            local v12
            if v11 then
                v12 = v_u_4:FindFirstChild(v11)
            else
                v12 = v_u_4:FindFirstChild("SoundEffects")
            end
            p10.SoundGroup = v12
        end
        return p10
    end,
    ["play"] = function(p13)
        v_u_14.restore(p13)
        p13:Play()
    end
}
return v_u_14