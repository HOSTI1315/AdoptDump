--// ReplicatedStorage.SharedModules.GitInfo (ModuleScript)

local v_u_1 = game:GetService("HttpService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("ReplicatedFirst")
local v_u_4 = nil
local v_u_5 = nil
local function v_u_18()
    local v_u_6 = game:GetService("ServerScriptService"):FindFirstChild(".git")
    if v_u_6 then
        local function v10(p7)
            local v8 = v_u_6
            for _, v9 in p7:split("/") do
                v8 = v8:FindFirstChild(v9)
                if not v8 then
                    return nil
                end
            end
            if v8:IsA("StringValue") then
                return v8.Value
            else
                return nil
            end
        end
        local v11 = v10("HEAD")
        local v12, v13
        if v11:match("^ref: ") then
            local v14 = v11:match("^ref: (.-)%s*$")
            v12 = v10(v14)
            if v14:match("^refs/heads/") then
                v13 = v14:match("^refs/heads/(.-)%s*$")
            else
                v13 = "unknown"
            end
        else
            v12 = v11
            v13 = "unknown"
        end
        local v15, v16
        if v12 then
            v15 = v12:match("^(.-)%s*$")
            v16 = v15:sub(1, 7)
        else
            v16 = "unknown"
            v15 = "unknown"
        end
        local v17
        if v16 == "unknown" and v13 == "unknown" then
            v17 = string.format("unknown (HEAD: %s)", v11:match("^(.-)%s*$"))
        else
            v17 = string.format("%s (%s)", v16, v13)
        end
        v_u_4 = {
            ["dev_display_name"] = v17,
            ["branch"] = v13,
            ["commit_hash_long"] = v15,
            ["commit_hash_short"] = v16
        }
    else
        v_u_4 = {
            ["dev_display_name"] = "unknown (using fallback data)",
            ["branch"] = "unknown",
            ["commit_hash_long"] = "unknown",
            ["commit_hash_short"] = "unknown"
        }
    end
end
local function v_u_21()
    v_u_18()
    table.freeze(v_u_4)
    local v19 = table.clone(v_u_4)
    v19.branch = "<hidden>"
    v19.dev_display_name = v19.commit_hash_short
    local v20 = Instance.new("StringValue")
    v20.Value = v_u_1:JSONEncode(v19)
    v20.Name = "GitInfo"
    v20.Parent = v_u_3
    v20:Clone().Parent = v_u_2
    _G.git_info = v_u_4
    return v_u_4
end
local function v_u_22()
    if v_u_5 then
        v_u_5.Event:Wait()
        return v_u_4
    end
    v_u_5 = Instance.new("BindableEvent")
    v_u_4 = v_u_1:JSONDecode((v_u_3:FindFirstChild("GitInfo") or v_u_2:WaitForChild("GitInfo")).Value)
    table.freeze(v_u_4)
    _G.git_info = v_u_4
    v_u_5:Fire()
    return v_u_4
end
local v_u_23 = {
    ["setup"] = function()
        if not v_u_4 then
            if game:GetService("RunService"):IsServer() then
                v_u_21()
                return
            end
            v_u_22()
        end
    end,
    ["get"] = function()
        v_u_23.setup()
        return v_u_4
    end
}
return v_u_23