--// ReplicatedStorage.ClientServices.Order_01.SendClientErrorReportsToServer (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("RouterClient")
local v_u_2 = game:GetService("ScriptContext")
local v_u_3 = game:GetService("LogService")
local v4 = {}
local v_u_5 = {}
function v4.init()
    v_u_2.Error:connect(function(p6, p7, _)
        if p6:find("SendClientErrorReportsToServer") or p7:find("SendClientErrorReportsToServer") then
            return
        elseif not v_u_5[p6] then
            v_u_5[p6] = true
            v_u_1.get("ErrorReportAPI/SendUniqueError"):FireServer(p6, p7)
        end
    end)
    v_u_3.MessageOut:Connect(function(p8, p9)
        if p9 == Enum.MessageType.MessageWarning then
            if p8:find("SendClientErrorReportsToServer") then
                return
            elseif not v_u_5[p8] then
                v_u_5[p8] = true
                v_u_1.get("ErrorReportAPI/SendUniqueError"):FireServer(p8, nil)
            end
        else
            return
        end
    end)
end
return v4