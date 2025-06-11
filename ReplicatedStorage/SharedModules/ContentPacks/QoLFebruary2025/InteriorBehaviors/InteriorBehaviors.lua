--// ReplicatedStorage.SharedModules.ContentPacks.QoLFebruary2025.InteriorBehaviors (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("ClientData")
local v_u_3 = v_u_1("GameplayFX")
local v_u_4 = v_u_1("package:Promise")
local v_u_5 = v_u_1("TweenPromise")
local function v_u_16(p6, p7)
    local v8 = p6:FindFirstChild("LikesReward")
    if v8 == nil then
        return
    elseif p7 then
        local v_u_9 = v8:FindFirstChild("Padlock")
        local v_u_10 = v8:FindFirstChild("Dome")
        local v_u_11 = v8:FindFirstChild("Hat")
        if v_u_9 and (v_u_10 and v_u_11) then
            return v_u_4.delay(0.1):andThen(function()
                v_u_3.emit_poof(v_u_9:GetPivot().Position, 11, 1)
                v_u_9:Destroy()
                v_u_5.new(v_u_10, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["Position"] = v_u_10.Position + Vector3.new(0, 3.5, 0),
                    ["Transparency"] = 1
                }):andThen(function()
                    v_u_10:Destroy()
                end)
                return v_u_4.delay(0.7)
            end):andThen(function()
                local v12 = game.Players.LocalPlayer.Character
                local v_u_13 = v12 and v12:FindFirstChild("RightHand") or (v12:FindFirstChild("HumanoidRootPart") or v_u_11)
                local v_u_14 = v_u_11.CFrame
                v_u_11.CanCollide = false
                return v_u_5.callback(0, 1, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.In), function(p15)
                    v_u_11.CFrame = v_u_14:Lerp(v_u_13.CFrame, p15) * CFrame.Angles(-p15 * 3.141592653589793 * 6, 0, 0)
                end)
            end):andThen(function()
                v_u_3.emit_poof(v_u_11.Position, 20, 3)
                v_u_11:Destroy()
                return v_u_4.delay(0.2)
            end)
        else
            return v_u_4.resolve()
        end
    else
        v8:Destroy()
        return v_u_4.resolve()
    end
end
local v25 = {
    ["Neighborhood"] = {
        ["render"] = function(p17, _)
            if (v_u_2.get("time_played_since_join") or 0) == 0 or v_u_1("UIManager").apps.LikesRewardApp:has_claimed_reward() then
                v_u_16(p17)
            end
        end,
        ["interactions"] = function(p_u_18)
            local v19 = v_u_1("InteractionsEngine")
            local v_u_20 = v_u_1("UIManager")
            local v21 = p_u_18:FindFirstChild("LikesReward")
            if not v21 or v_u_1("UIManager").apps.LikesRewardApp:has_claimed_reward() then
                return {}
            end
            local v_u_22 = false
            local v23 = {}
            local v24 = {
                ["text"] = "Claim",
                ["part"] = v21.ClaimBlock,
                ["on_selected"] = function()
                    if v_u_20.apps.LikesRewardApp:can_claim_reward() then
                        v_u_20.set_app_visibility("LikesRewardApp", false)
                        v_u_22 = true
                        v_u_16(p_u_18, true):andThen(function()
                            v_u_20.apps.LikesRewardApp:try_claim_reward()
                        end)
                    else
                        v_u_20.set_app_visibility("LikesRewardApp", true)
                    end
                end,
                ["is_visible"] = function()
                    return not v_u_22
                end
            }
            table.insert(v23, v19:register(v24))
            return v23
        end,
        ["cleanup"] = function(_, _) end
    }
}
return v25