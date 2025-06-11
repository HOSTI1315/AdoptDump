--// ReplicatedStorage.SharedModules.RepeatPromise (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("package:Promise")
return {
    ["new"] = function(p_u_2, p_u_3)
        return v_u_1.new(function(p4, p5, p6)
            local v_u_7 = nil
            local v_u_8 = false
            p6(function()
                v_u_8 = true
                if v_u_7 then
                    v_u_7:cancel()
                end
            end)
            local v9 = 0
            while not v_u_8 do
                v_u_7 = p_u_2()
                local v10, v11 = v_u_7:await()
                if not v_u_8 then
                    if not v10 then
                        p5(v11)
                        return
                    end
                    v9 = v9 + 1
                    if p_u_3 and not p_u_3(v9) then
                        break
                    end
                end
            end
            p4()
        end)
    end
}