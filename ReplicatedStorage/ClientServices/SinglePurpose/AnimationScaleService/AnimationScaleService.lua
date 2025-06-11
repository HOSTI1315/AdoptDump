--// ReplicatedStorage.ClientServices.SinglePurpose.AnimationScaleService (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AnimationScale")
local v_u_3 = v1("SimpleEvents")
local v4 = {}
local v_u_5 = {}
local function v_u_11(p6)
    local v7 = p6:FindFirstChildWhichIsA("Humanoid") or p6:FindFirstChildWhichIsA("AnimationController")
    local v8 = nil
    if v7 then
        local v9 = v7:FindFirstChild("AnimationScale")
        if v9 and v9.Value ~= 1 then
            v8 = v9.Value
        end
    end
    if v8 then
        if v_u_2.register_model(p6, v8) then
            local v10 = p6:FindFirstChild("HumanoidRootPart") or p6:FindFirstChild("RootPart")
            if v10 then
                v10 = (v10.Position - workspace.CurrentCamera.Focus.Position).Magnitude <= 200
            end
            if v10 then
                v_u_2.rebuild_active_list()
                return
            end
        end
    else
        v_u_2.unregister_model(p6)
    end
end
local function v_u_15(p12)
    local v13 = p12.Parent
    if v13:IsA("Humanoid") or v13:IsA("AnimationController") then
        local v14 = v13.Parent
        if v14:IsA("Model") then
            if not v14.Parent or v14.Parent ~= game then
                return v14
            end
        end
    else
        return
    end
end
local function v_u_21(p_u_16)
    if not v_u_5[p_u_16] then
        v_u_5[p_u_16] = true
        local v_u_17 = nil
        local v_u_18 = nil
        local v_u_19 = v_u_15(p_u_16)
        v_u_17 = p_u_16.AncestryChanged:Connect(function()
            if p_u_16:IsDescendantOf(game) then
                v_u_19 = v_u_15(p_u_16)
            else
                v_u_5[p_u_16] = nil
                v_u_17:Disconnect()
                v_u_18:Disconnect()
                v_u_11(v_u_19)
            end
        end)
        local function v20()
            if v_u_19 then
                v_u_11(v_u_19)
            end
        end
        v_u_18 = p_u_16.Changed:Connect(v20)
        if v_u_19 then
            v_u_11(v_u_19)
        end
    end
end
function v4.init()
    v_u_3.foreach_tagged_including_new("AnimationScale", function(p22)
        v_u_21(p22)
    end)
end
return v4