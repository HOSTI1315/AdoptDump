--// ReplicatedStorage.ClientServices.MapSpecificScripts.Slides (ModuleScript)

local _ = require(game.ReplicatedStorage.Fsys).load
local v1 = {}
game:GetService("RunService")
local v_u_2 = {
    {
        ["slide"] = workspace:WaitForChild("StaticMap"):WaitForChild("Park"):WaitForChild("PlaygroundSlide"),
        ["power"] = 70,
        ["duration"] = 1.25
    }
}
local function v_u_10(p_u_3, p_u_4)
    local v_u_5 = false
    for _, v6 in pairs(p_u_3:GetChildren()) do
        if v6.Name == "sit_block" then
            v6.Touched:connect(function(p7)
                local v8 = game.Players:GetPlayerFromCharacter(p7.Parent)
                if v8 == nil or v8 ~= game.Players.LocalPlayer then
                    return
                elseif v8.Character.Humanoid.Sit == true then
                    return
                elseif not v_u_5 then
                    v_u_5 = true
                    v8.Character.Humanoid.Sit = true
                    wait(0.3)
                    local v9 = Instance.new("BodyVelocity")
                    v9.MaxForce = Vector3.new(inf, 0, inf)
                    v9.Velocity = p_u_3.sit_block.CFrame.lookVector * p_u_4.power
                    v9.Parent = p7.Parent.HumanoidRootPart
                    wait(p_u_4.duration)
                    v9:Destroy()
                    wait(3)
                    v_u_5 = false
                end
            end)
        end
    end
end
function v1.init()
    for _, v11 in pairs(v_u_2) do
        v_u_10(v11.slide, v11)
    end
end
return v1