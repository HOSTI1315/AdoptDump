--// ReplicatedStorage.ClientServices.UserInterfaceService (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("UI")
v1("Rodux")
v1("Roact")
v1("TableUtil")
local v_u_3 = v1("ClientStore")
local v4 = {}
local v_u_5 = {}
local function v_u_11(p6)
    for _, v7 in pairs(p6:GetChildren()) do
        if v7:IsA("ModuleScript") then
            local v8 = require(v7)
            if typeof(v8) == "function" then
                v_u_2[v7.Name] = v8
            elseif typeof(v8) == "table" then
                for v9, v10 in pairs(v8) do
                    v_u_2[v9] = v10
                end
            else
                error("unknown module return type")
            end
        end
        v_u_11(v7)
    end
end
function v4.init()
    local v12 = game.ReplicatedStorage.RoactComponents
    v_u_11(v12:WaitForChild("Elements"))
    for _, v13 in pairs(v12:WaitForChild("Apps"):GetChildren()) do
        v_u_5[v13.Name] = require(v13)
        if v_u_5[v13.Name].init then
            v_u_5[v13.Name].init(v_u_3.store)
        end
    end
end
return v4