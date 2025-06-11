--// ReplicatedStorage.ClientModules.Utilities.MouseEnterLeave (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Signal")
local v_u_3 = v1("TimerAction")
v1("PlatformM")
game:GetService("RunService")
return {
    ["get_events"] = function(p_u_4)
        local v_u_5 = v_u_2.new()
        local v_u_6 = v_u_2.new()
        local v_u_7 = game.Players.LocalPlayer:GetMouse()
        local v_u_8 = false
        local function v_u_15()
            local v9 = p_u_4
            local v10 = v_u_7.X
            local v11 = v_u_7.Y
            local v12 = v9.AbsolutePosition
            local v13 = v9.AbsoluteSize
            local v14
            if v10 < v12.X + v13.X and (v12.X <= v10 and v11 < v12.Y + v13.Y) then
                v14 = v12.Y < v11
            else
                v14 = false
            end
            if v_u_8 or not v14 then
                if v_u_8 and not v14 then
                    v_u_8 = false
                    v_u_6:Fire()
                end
            else
                v_u_8 = true
                v_u_5:Fire()
            end
        end
        local v_u_16 = nil
        local v_u_17 = v_u_3.new()
        p_u_4.MouseMoved:connect(function()
            v_u_16 = v_u_16 or v_u_7.Move:connect(v_u_15)
            v_u_17:restart(0.1, function()
                v_u_16:Disconnect()
                v_u_16 = nil
            end)
        end)
        p_u_4.SelectionLost:connect(function()
            v_u_6:Fire()
        end)
        p_u_4.SelectionGained:connect(function()
            v_u_5:Fire()
        end)
        return v_u_5, v_u_6
    end
}