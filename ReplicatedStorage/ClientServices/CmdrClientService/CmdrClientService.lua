--// ReplicatedStorage.ClientServices.CmdrClientService (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("ClientData")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("TextChatService")
local v_u_5 = game:GetService("RunService")
local v6 = {}
local function v_u_9()
    local v_u_7 = require(v_u_3:WaitForChild("CmdrClient"))
    v_u_7:SetEnabled(false)
    if v_u_5:IsStudio() or (v_u_1.get("has_camera_tools") == true and true or v_u_2.LocalPlayer:GetRankInGroup(295182) >= 101) then
        v_u_7:SetEnabled(true)
        v_u_4.SendingMessage:Connect(function(p8)
            if p8.Text:lower() == "cmdr" then
                v_u_7:Toggle()
            end
        end)
        v_u_7:SetActivationKeys({ Enum.KeyCode.F1, Enum.KeyCode.F2 })
    end
end
function v6.init()
    task.spawn(v_u_9)
end
return v6