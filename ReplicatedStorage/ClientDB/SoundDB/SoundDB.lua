--// ReplicatedStorage.ClientDB.SoundDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("new:SoundOptimizer")
local v2 = game:GetService("HttpService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("ServerStorage")
local v_u_6 = {
    ["fade_time"] = "number"
}
local v_u_7 = {
    ["Silence"] = {
        ["id"] = 0
    },
    ["SilenceFastFade"] = {
        ["id"] = 0,
        ["fade_time"] = 0
    }
}
local function v21()
    local v8 = v_u_4:IsServer()
    assert(v8, "This API can only be called on the server.")
    for _, v9 in v_u_5.ForSFXPermissionsGranting.SoundDB:GetChildren() do
        if v9:IsA("Sound") then
            local v10 = {}
            local v11 = v_u_1.get_id(v9)
            v10.id = tonumber(v11:match("%d+$"))
            v10.from_instance = true
            for v12, v13 in v9:GetAttributes() do
                local v14 = v_u_6[v12]
                if v14 and typeof(v13) == v14 then
                    v10[v12] = v13
                end
            end
            v_u_7[v9.Name] = v10
        end
    end
    local v15 = {}
    for v16, v17 in v_u_7 do
        local v18 = {
            ["id"] = "rbxassetid://" .. v17.id,
            ["name"] = v16
        }
        for v19, v20 in v17 do
            if v_u_6[v19] then
                v18[v19] = v20
            end
        end
        if v_u_4:IsServer() and (not v17.from_instance and v18.id ~= "rbxassetid://0") then
            error("Sounds with non-zero ids should be added directly to the ServerStorage.ForSFXPermissionsGranting.SoundDB folder (or content pack) so their permissions can be granted by upmake")
        end
        v15[v16] = v18
    end
    return v15
end
if not v_u_4:IsServer() then
    return v2:JSONDecode(v3:WaitForChild("SoundDB").Value)
end
local v22 = v21()
local v23 = Instance.new("StringValue")
v23.Name = "SoundDB"
v23.Value = v2:JSONEncode(v22)
v23.Parent = v3
return v22