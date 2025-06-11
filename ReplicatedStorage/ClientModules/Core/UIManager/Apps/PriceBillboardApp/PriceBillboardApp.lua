--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PriceBillboardApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v1("ClientData")
v1("PlatformM")
v1("RouterClient")
v1("XboxSupport")
local v2 = v1("Class")("PriceBillboardApp", v1("UIBaseApp"))
function v2.show_pricing_status(p3, p4)
    p3.instance.Price.Text = "$" .. p4.Parent:WaitForChild("Configuration"):WaitForChild("cost").Value
    local v5 = p3.instance
    local v6 = UDim2.new
    local v7 = p3.instance.Price.Text
    v5.Size = v6(0, string.len(v7) * 14 + 20, 0, p3.instance.Size.Y.Offset)
    p3.instance.Adornee = p4
    p3.instance.Parent = game.Players.LocalPlayer.PlayerGui
    p3.last_cost_object = p4
    p3.last_spawned_time = tick()
end
local function v_u_10(p8, p9)
    if p8.last_cost_object and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) and (not p9 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - p8.last_cost_object.Position).magnitude >= 12 and tick() - p8.last_spawned_time > 1) then
        p8.last_despawned_time = tick()
        p8.last_cost_object = nil
        p8.instance.Adornee = nil
        p8.instance.Parent = nil
    end
end
function v2.show(_) end
function v2.hide(_) end
function v2.start(p_u_11)
    p_u_11.instance.Adornee = nil
    spawn(function()
        while true do
            wait(0.5)
            v_u_10(p_u_11, true)
        end
    end)
    p_u_11.instance.Parent = nil
end
return v2