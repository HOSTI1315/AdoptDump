--// ReplicatedStorage.ClientServices.ToolsClient.GrapplingHookClientService (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("GrapplingHook")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("new:StreamingHelper")
local v_u_5 = v1("Debug").create_log()
return {
    ["init"] = function()
        game:GetService("CollectionService"):GetInstanceAddedSignal("GrapplingHookParts"):connect(function(p6)
            local v7 = game.Players.LocalPlayer.Character
            if not (v7 and p6:IsDescendantOf(v7)) then
                local v8 = p6:WaitForChild("GrappleRope", 10)
                if v8 then
                    v8.Length = 1
                end
            end
        end)
        v_u_3.get_event("ToolAPI/GrapplingHookFired").OnClientEvent:connect(function(p9, p10, p11, p12)
            local v13 = v_u_4.get(p10)
            if v13 then
                v_u_5("REPLICATED HOOK", p9, v13, p11, p12)
                v_u_2.replicate_fired_grappling_hook(p9, v13, p11, p12)
            end
        end)
    end
}