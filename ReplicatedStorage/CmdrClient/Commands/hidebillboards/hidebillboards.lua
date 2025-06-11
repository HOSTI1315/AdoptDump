--// ReplicatedStorage.CmdrClient.Commands.hidebillboards (ModuleScript)

local v_u_1 = {}
local v_u_2 = {}
local function v_u_7(p_u_3)
    v_u_1[p_u_3] = p_u_3.MaxDistance >= (1 / 0) and (1 / 0) or p_u_3.MaxDistance
    p_u_3.MaxDistance = 0.001
    local v4 = v_u_2
    local v5 = p_u_3.Destroying
    local function v6()
        v_u_1[p_u_3] = nil
    end
    table.insert(v4, v5:Connect(v6))
end
local function v_u_14(p8)
    for _, v9 in p8:GetDescendants() do
        if v9:IsA("BillboardGui") then
            v_u_7(v9)
        end
    end
    local v10 = v_u_2
    local v11 = p8.DescendantAdded
    local function v13(p12)
        if p12:IsA("BillboardGui") then
            v_u_7(p12)
        end
    end
    table.insert(v10, v11:Connect(v13))
end
local function v_u_18()
    for v15, v16 in v_u_1 do
        v15.MaxDistance = v16
    end
    for _, v17 in v_u_2 do
        v17:Disconnect()
    end
    v_u_1 = {}
    v_u_2 = {}
end
local v20 = {
    ["Name"] = "hidebillboards",
    ["Aliases"] = {},
    ["Description"] = "Hide all world space gui for screenshots.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "boolean",
            ["Name"] = "State",
            ["Description"] = "Whether to hide world space gui."
        }
    },
    ["ClientRun"] = function(_, p19)
        v_u_18()
        if p19 then
            v_u_14(workspace)
            v_u_14(game.Players.LocalPlayer.PlayerGui)
        end
        return ("Set hidden to %*."):format(p19)
    end
}
return v20