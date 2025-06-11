--// ReplicatedStorage.ClientModules.Utilities.MouseCursorHider (ModuleScript)

local v1 = {}
local v_u_2 = 0
local v_u_3 = 0
local v_u_4 = 0
function v1.hide()
    v_u_2 = v_u_2 + 1
    local v5 = v_u_2 >= 0
    assert(v5)
    local v6 = v_u_3 >= 0
    assert(v6)
    local v7 = v_u_3 > 0 and true or v_u_2 == 0
    game:GetService("UserInputService").MouseIconEnabled = v7
    local v_u_8 = false
    local v_u_9 = v_u_4
    return function()
        if v_u_8 then
            return
        elseif v_u_9 == v_u_4 then
            v_u_8 = true
            v_u_2 = v_u_2 - 1
            local v10 = v_u_2 >= 0
            assert(v10)
            local v11 = v_u_3 >= 0
            assert(v11)
            local v12 = v_u_3 > 0 and true or v_u_2 == 0
            game:GetService("UserInputService").MouseIconEnabled = v12
        end
    end
end
function v1.force_show()
    v_u_3 = v_u_3 + 1
    local v13 = v_u_2 >= 0
    assert(v13)
    local v14 = v_u_3 >= 0
    assert(v14)
    local v15 = v_u_3 > 0 and true or v_u_2 == 0
    game:GetService("UserInputService").MouseIconEnabled = v15
    local v_u_16 = false
    local v_u_17 = v_u_4
    return function()
        if v_u_16 then
            return
        elseif v_u_17 == v_u_4 then
            v_u_16 = true
            v_u_3 = v_u_3 - 1
            local v18 = v_u_2 >= 0
            assert(v18)
            local v19 = v_u_3 >= 0
            assert(v19)
            local v20 = v_u_3 > 0 and true or v_u_2 == 0
            game:GetService("UserInputService").MouseIconEnabled = v20
        end
    end
end
function v1.reset()
    v_u_2 = 0
    v_u_3 = 0
    v_u_4 = v_u_4 + 1
    local v21 = v_u_2 >= 0
    assert(v21)
    local v22 = v_u_3 >= 0
    assert(v22)
    local v23 = v_u_3 > 0 and true or v_u_2 == 0
    game:GetService("UserInputService").MouseIconEnabled = v23
end
return v1