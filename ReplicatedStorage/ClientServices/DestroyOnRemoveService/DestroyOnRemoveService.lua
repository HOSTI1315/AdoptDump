--// ReplicatedStorage.ClientServices.DestroyOnRemoveService (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = v1("CloudValues")
local v_u_5 = v1("TagNames")
local v6 = {}
local function v_u_8(p7)
    if v_u_4:getValue("performance", "destroyOnRemoveEnabled") then
        v_u_3.Heartbeat:Wait()
        p7:Destroy()
    end
end
function v6.init()
    v_u_2:GetInstanceRemovedSignal(v_u_5.DestroyOnRemove):Connect(v_u_8)
end
return v6