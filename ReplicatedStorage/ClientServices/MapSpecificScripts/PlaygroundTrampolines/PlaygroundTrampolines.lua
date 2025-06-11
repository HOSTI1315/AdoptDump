--// ReplicatedStorage.ClientServices.MapSpecificScripts.PlaygroundTrampolines (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v1("ClientData")
v1("UIManager")
v1("RouterClient")
local v_u_2 = v1("Trampoline")
return {
    ["init"] = function()
        if not workspace:FindFirstChild("StaticMap") then
            local v3 = {
                ["streaming_enabled"] = workspace.StreamingEnabled,
                ["streaming_enabled_on_init"] = _G.DEBUG_StreamingEnabledInit,
                ["game_loaded"] = game:IsLoaded(),
                ["persistent_loaded"] = game:GetAttribute("PersistentLoaded"),
                ["server_init_done"] = game:GetService("ReplicatedStorage"):GetAttribute("ServerInitDone")
            }
            print("MISSING STATIC MAP DEBUG")
            for v4, v5 in v3 do
                print((("  %*: %*"):format(v4, v5)))
            end
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LoadAPI/ReportStreamingEnabledDebug"):FireServer(v3)
        end
        for _, v6 in pairs(workspace.StaticMap.Park.Trampolines:GetChildren()) do
            for _, v7 in ipairs(v6:GetChildren()) do
                if v7.Name == "Trampoline" then
                    v_u_2.hook_up_trampoline(v7, {
                        ["upwards_velocity"] = 200,
                        ["time_length"] = 0.1,
                        ["upper_height_cutoff"] = 8.5
                    })
                elseif v7.Name == "HighTrampoline" then
                    v_u_2.hook_up_trampoline(v7, {
                        ["upwards_velocity"] = 250,
                        ["time_length"] = 0.12,
                        ["upper_height_cutoff"] = 8.5
                    })
                end
            end
        end
    end
}