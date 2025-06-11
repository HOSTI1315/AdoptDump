--// ReplicatedStorage.SharedModules.ContentPacks.Jokes2024.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v8 = {
    ["SimpleThrowToyTool"] = {
        ["client_use"] = function(p2, _, p3, _, p4)
            v_u_1("SimpleThrowToyHelper").simple_throw_toy_use(p3.item_data, p4, {
                ["lifetime_after_use"] = p2.lifetime_after_use,
                ["animation_name"] = p2.model_handle .. "FX",
                ["sound_name"] = p2.model_handle .. "SFX"
            })
        end
    },
    ["ParticleEmitterTool"] = {
        ["server_use"] = function(_, _, _, p5)
            for _, v6 in p5 do
                for _, v_u_7 in v6:FindFirstChild("Emitters"):GetDescendants() do
                    if v_u_7:IsA("ParticleEmitter") then
                        task.spawn(function()
                            v_u_7.Enabled = true
                            task.wait(0.5)
                            v_u_7.Enabled = false
                        end)
                    end
                end
            end
        end
    }
}
return v8