--// ReplicatedStorage.CmdrClient.Commands.dbgpath (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("Raycast")
local v_u_3 = v1("package:Promise")
local v_u_4 = game:GetService("PathfindingService")
local function v_u_19(p_u_5, p_u_6, p7)
    local v8 = v_u_4
    local v9 = {}
    local v10
    if p7 then
        v10 = p7.AgentRadius
    else
        v10 = p7
    end
    v9.AgentRadius = v10
    local v11
    if p7 then
        v11 = p7.AgentHeight
    else
        v11 = p7
    end
    v9.AgentHeight = v11
    if p7 then
        p7 = p7.AgentCanJump
    end
    v9.AgentCanJump = p7
    local v_u_12 = v8:CreatePath(v9)
    local v_u_14 = {
        ["destroy"] = function(_)
            if v_u_14.vis then
                for _, v13 in ipairs(v_u_14.vis) do
                    v13:Destroy()
                end
                v_u_14.vis = nil
            end
            v_u_14.destroyed = true
        end
    }
    v_u_3.async(function()
        v_u_12:ComputeAsync(p_u_5, p_u_6)
        warn(v_u_12.Status)
        if not v_u_14.destroyed then
            v_u_14.waypoints = v_u_12:GetWaypoints()
            v_u_14.vis = {}
            for v15, v16 in ipairs(v_u_14.waypoints) do
                local v17 = Instance.new("Part")
                v17.Anchored = true
                v17.CanCollide = false
                v17.Color = v16.Action.Name == "Walk" and Color3.new(0, 0, 1) or Color3.new(1, 0, 0)
                v17.CFrame = CFrame.new(v16.Position)
                v17.Name = "Path_" .. v15
                v17.Size = Vector3.new(0.5, 0.5, 0.5)
                v17.Material = "Neon"
                v17.TopSurface = "Smooth"
                v17.BottomSurface = "Smooth"
                v17.Parent = workspace
                local v18 = v_u_14.vis
                table.insert(v18, v17)
            end
        end
    end)
    return v_u_14
end
local v_u_20 = nil
local function v_u_27(p21)
    if v_u_20 then
        v_u_20:destroy()
        v_u_20 = nil
    end
    local v22 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    local v23 = game:GetService("UserInputService"):GetMouseLocation()
    local v24 = workspace.CurrentCamera:ViewportPointToRay(v23.X, v23.Y, 0)
    local _, v25, v26 = v_u_2.FindPartOnRay(Ray.new(v24.Origin, v24.Direction * 1000), nil, nil, {
        ["ignore_non_cancollide"] = true,
        ["ignore_water"] = true
    })
    v_u_20 = v_u_19(v22, v25 + v26, p21)
end
local v31 = {
    ["Name"] = "dbgpath",
    ["Aliases"] = {},
    ["Description"] = "Create a debug path visualization from your character to your mouse hit position",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "integer",
            ["Name"] = "AgentRadius",
            ["Description"] = "Agent Radius",
            ["Default"] = 2
        },
        {
            ["Type"] = "integer",
            ["Name"] = "AgentHeight",
            ["Description"] = "Agent Height",
            ["Default"] = 5
        },
        {
            ["Type"] = "boolean",
            ["Name"] = "AgentCanJump",
            ["Description"] = "Agent Can Jump",
            ["Default"] = true
        }
    },
    ["ClientRun"] = function(_, p28, p29, p30)
        v_u_27({
            ["AgentRadius"] = p28,
            ["AgentHeight"] = p29,
            ["AgentCanJump"] = p30
        })
        return "Debug path made"
    end
}
return v31