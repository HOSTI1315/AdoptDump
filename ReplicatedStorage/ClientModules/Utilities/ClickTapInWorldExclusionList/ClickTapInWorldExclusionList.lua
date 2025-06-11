--// ReplicatedStorage.ClientModules.Utilities.ClickTapInWorldExclusionList (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("PlatformM")
local v_u_2 = v_u_1.get_platform()
local v_u_3 = {}
local v_u_4 = {}
function v_u_3.register(p5, p6)
    local v_u_7 = {
        ["callback"] = p6,
        ["priority"] = p5
    }
    local v8 = v_u_4
    table.insert(v8, v_u_7)
    table.sort(v_u_4, function(p9, p10)
        return p9.priority < p10.priority
    end)
    local v_u_11 = false
    return function()
        local v12 = not v_u_11 and table.find(v_u_4, v_u_7)
        if v12 then
            table.remove(v_u_4, v12)
            v_u_11 = true
        end
    end
end
function v_u_3.call_callback()
    for _, v13 in ipairs(v_u_4) do
        local v14 = v13.callback()
        if v14 ~= "pass" then
            if v14 ~= nil then
                if v14 == "sink" then
                    return
                end
                error("Function must return pass or sink")
            end
        end
    end
end
function v_u_3.init()
    if v_u_2 == v_u_1.platform.phone or v_u_2 == v_u_1.platform.tablet then
        game:GetService("UserInputService").TouchTapInWorld:connect(function(_, p15)
            if not p15 then
                v_u_3.call_callback()
            end
        end)
    else
        game.Players.LocalPlayer:GetMouse().Button1Down:connect(v_u_3.call_callback)
    end
end
return v_u_3