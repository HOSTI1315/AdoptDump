--// ReplicatedStorage.new.modules.PlatformUITransform (ModuleScript)

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("ServerStorage")
local v_u_4 = {
    ["tablet"] = "phone",
    ["console"] = "desktop"
}
local v_u_5 = {
    ["phone"] = "phone",
    ["tablet"] = "tablet",
    ["console"] = "console",
    ["desktop"] = "desktop"
}
local function v_u_9(p6, p7)
    for _, v8 in p6:GetChildren() do
        if p7[v8.Name] then
            v8:Destroy()
        end
    end
end
return {
    ["platforms"] = v_u_5,
    ["get_raw_ui"] = function()
        return v_u_1:FindFirstChild("RawUI") or v_u_2:IsServer() and v_u_3.ServerResources:FindFirstChild("RawUI") or error("Could not find RawUI")
    end,
    ["transform_app_for_platform_mutate"] = function(p10, p11)
        local v12 = p10:FindFirstChild("PlatformTransform")
        local v13
        if v12 then
            v13 = require(v12)[p11](p10)
            v12:Destroy()
        else
            v13 = nil
        end
        local v14 = v13 or (p10:FindFirstChild(p11) and p11 and p11 or v_u_4[p11])
        if v14 then
            v14 = p10:FindFirstChild(v14)
        end
        if v14 then
            v14.Parent = nil
            p10:ClearAllChildren()
            for _, v15 in v14:GetChildren() do
                v15.Parent = p10
            end
        else
            v_u_9(p10, v_u_5)
        end
        if p10:IsA("ScreenGui") then
            p10.Enabled = false
        end
    end
}