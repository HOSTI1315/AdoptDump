--// ReplicatedStorage.SharedModules.ContentPacks.Soccer2024.Interiors (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("Maid")
local v_u_3 = v_u_1("SoundPlayer")
local v_u_4 = v_u_1("RouterClient")
local v20 = {
    ["housing!soccer_house"] = {
        ["interactions"] = function(p5)
            return v_u_1("InteriorsDB").housing.interactions(p5)
        end,
        ["render"] = function(p6, p_u_7)
            v_u_1("InteriorsDB").housing.render(p6, p_u_7)
            p_u_7.render_maid = v_u_2.new()
            local v8 = p6.Soccer.ScoreBoard:FindFirstChild("Score").SurfaceGui.Frame
            local v_u_9 = v8.A
            local v_u_10 = v8.B
            local v_u_11 = p6.Soccer.Confetti
            local v_u_17 = v_u_4.get("LocationAPI/SyncedAreaEvent").OnClientEvent:connect(function(p12, p13, p14)
                if p_u_7.house_owner == p12 and p13 == "goal" then
                    v_u_9.Text = p14.a_goals
                    v_u_10.Text = p14.b_goals
                    v_u_3.FX:play("Soccer House Goal")
                    for _, v15 in v_u_11:GetChildren() do
                        for v16 = 1, 9 do
                            v15["Blast" .. v16]:Emit(15)
                        end
                        v15.Cloud1:Emit(10)
                        v15.Cloud2:Emit(10)
                        v15.BlastPretty:Emit(30)
                    end
                end
            end)
            p_u_7.render_maid:GiveTask(function()
                v_u_17:disconnect()
            end)
        end,
        ["cleanup"] = function(p18, p19)
            p19.render_maid:DoCleaning()
            v_u_1("InteriorsDB").housing.cleanup(p18, p19)
        end
    }
}
return v20