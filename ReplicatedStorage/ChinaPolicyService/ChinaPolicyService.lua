--// ReplicatedStorage.ChinaPolicyService (ModuleScript)

local v1 = game:GetService("RunService")
local v_u_2 = game:GetService("Players")
game:GetService("PolicyService")
local v_u_3 = Instance.new("BindableEvent")
local v_u_4 = Instance.new("BindableEvent")
local v_u_5 = false
local v_u_6 = true
local v_u_7 = false
local v_u_8 = false
local v9 = {}
for _, v10 in pairs(script:GetChildren()) do
    if v10:IsA("BoolValue") then
        if v10.Name == "Forced" then
            v_u_5 = v10.Value
        elseif v10.Name == "DisableGroupCheck" then
            v_u_6 = not v10.Value
        end
    end
end
local function v_u_16(p11, p12)
    for v13 = 1, p11 do
        local v14, v15 = pcall(p12)
        if v14 then
            return v15
        end
        wait(v13 / 2)
    end
end
local v_u_17 = {}
local v_u_18 = {}
local function v_u_22(p_u_19)
    if v_u_17[p_u_19] == nil then
        local v20 = nil
        local v21 = v_u_5 and true or (v_u_6 and (not v20 and (p_u_19.UserId > 0 and v_u_16(3, function()
            return p_u_19:IsInGroup(5018342)
        end))) and true or v20)
        if p_u_19.Parent == v_u_2 then
            if v21 == nil then
                v_u_17[p_u_19] = false
            else
                v_u_17[p_u_19] = v21
            end
            v_u_18[p_u_19] = v21 == nil
        end
    end
    return v_u_17[p_u_19], v_u_18[p_u_19]
end
v_u_2.PlayerRemoving:Connect(function(p23)
    v_u_17[p23] = nil
    v_u_18[p23] = nil
end)
if v1:IsServer() then
    if v_u_5 then
        v_u_8 = true
    else
        local v_u_24 = nil
        local function v28(p25)
            if v_u_24 then
                v_u_24:Disconnect()
                v_u_24 = nil
                local v26, v27 = v_u_22(p25)
                v_u_5 = v26
                v_u_7 = v27
                v_u_8 = true
                if v_u_5 then
                    v_u_3:Fire(v_u_5, v_u_7)
                end
                v_u_4:Fire(v_u_5, v_u_7)
            end
        end
        v_u_24 = v_u_2.PlayerAdded:Connect(v28)
        if #v_u_2:GetPlayers() > 0 then
            local v29 = v_u_2:GetPlayers()[1]
            if v_u_24 then
                v_u_24:Disconnect()
                v_u_24 = nil
                local v30, v31 = v_u_22(v29)
                local v32 = v30
                local v33 = v31
                local v34 = true
                if v32 then
                    v_u_3:Fire(v32, v33)
                end
                v_u_4:Fire(v32, v33)
                v_u_8 = v34
                v_u_7 = v33
                v_u_5 = v32
            end
        end
    end
else
    v_u_5, v_u_7 = v_u_22(v_u_2.LocalPlayer)
    v_u_8 = true
end
function v9.IsActive(_)
    return v_u_5, v_u_7
end
function v9.IsReady(_)
    return v_u_8
end
function v9.WaitForReady(_)
    if v_u_8 then
        return v_u_5, v_u_7
    else
        return v_u_4.Event:Wait()
    end
end
v9.Changed = v_u_3.Event
function v9.IsActiveForPlayer(_, p35)
    if typeof(p35) ~= "Instance" or not p35:IsA("Player") then
        error("bad argument #1 to \'IsActiveForPlayer\' (Player expected, got " .. typeof(p35) .. ")", 2)
    end
    return v_u_22(p35)
end
return v9