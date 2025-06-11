--// ReplicatedStorage.ClientModules.CloudValues (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = game:GetService("HttpService")
local v3 = game:GetService("ReplicatedFirst")
local v_u_4 = v1("RouterClient")
local v5 = v1("package:Promise")
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.new()
    local v7 = v_u_6
    local v8 = setmetatable({}, v7)
    v8.values = {}
    v8.changed = Instance.new("BindableEvent")
    return v8
end
function v_u_6.update(p9, p10)
    p9.values = p10
    p9.changed:Fire()
end
function v_u_6.getValue(p11, p12, p13)
    local v14 = p11.values[p12]
    if v14 then
        v14 = p11.values[p12][p13]
    end
    return v14
end
function v_u_6.onChange(p15, p16)
    local v17 = Instance.new("BindableEvent")
    v17.Event:Connect(p16)
    v17:Fire()
    v17:Destroy()
    return p15.changed.Event:Connect(p16)
end
local v_u_18 = v_u_6.new()
v_u_18:update((v2:JSONDecode(v3.CloudValueDefaults.Value)))
v5.new(function()
    v_u_18:update((v_u_4.get("CloudActionsAPI/GetReplicatedCloudValues"):InvokeServer()))
end)
v_u_4.get_event("CloudActionsAPI/CloudValuesUpdated").OnClientEvent:Connect(function(p19)
    v_u_18:update(p19)
end)
return v_u_18