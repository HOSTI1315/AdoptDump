--// ReplicatedStorage.CmdrClient.Commands.cam-play (ModuleScript)

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Workspace")
local v5 = require(game.ReplicatedStorage.Fsys).load
local v_u_6 = v5("package:Promise")
local v_u_7 = v5("Splines")
local v_u_8 = {}
v_u_8.__index = v_u_8
function v_u_8.new(p9)
    local v10 = v_u_7.getPoints(p9)
    local v11 = 0
    local v12 = {}
    for v13, v14 in ipairs(v10) do
        if v10[v13 + 1] ~= nil then
            local v15 = (v14 - v10[v13 + 1]).magnitude
            local v16 = {
                ["len"] = v15,
                ["start"] = v11,
                ["from"] = v14,
                ["to"] = v10[v13 + 1]
            }
            table.insert(v12, v16)
            v11 = v11 + v15
        end
    end
    local v17 = {
        ["total"] = v11,
        ["ranges"] = v12,
        ["first"] = p9[1]
    }
    local v18 = v_u_8
    return setmetatable(v17, v18)
end
function v_u_8.getRange(p19, p20)
    for v21 = 1, #p19.ranges do
        if p20 < p19.ranges[v21].start / p19.total then
            return p19.ranges[v21 - 1]
        end
    end
    return p19.ranges[#p19.ranges]
end
function v_u_8.projectAlpha(p22, p23, p24)
    local v25 = p24.start / p22.total
    local v26 = (p24.start + p24.len) / p22.total
    return (p23 - v25) / (v26 - v25)
end
function v_u_8.getPosition(p27, p28)
    local v29 = math.max(0, p28)
    if #p27.ranges < 2 then
        return p27.first
    end
    local v30 = p27:getRange(v29)
    return v30.from:lerp(v30.to, p27:projectAlpha(v29, v30))
end
local v_u_31 = nil
local v_u_32 = nil
local v_u_33 = nil
local v59 = {
    ["Name"] = "cam-play",
    ["Aliases"] = {},
    ["Description"] = "Play animation over camera waypoints",
    ["Group"] = "CameraTools",
    ["Args"] = {
        {
            ["Type"] = "number",
            ["Name"] = "Length",
            ["Description"] = "The length of the animation"
        },
        function(p34)
            return {
                ["Type"] = p34.Cmdr.Util.MakeEnumType("option", Enum.EasingStyle),
                ["Name"] = "EasingStyle",
                ["Description"] = "The EasingStyle you want the animation to follow",
                ["Optional"] = true
            }
        end,
        function(p35)
            return {
                ["Type"] = p35.Cmdr.Util.MakeEnumType("option", Enum.EasingDirection),
                ["Name"] = "EasingDirection",
                ["Description"] = "The EasingDirection you want the animation to follow",
                ["Optional"] = true
            }
        end,
        {
            ["Type"] = "number",
            ["Name"] = "Delay",
            ["Description"] = "Delay before and after the animation",
            ["Default"] = 2
        }
    },
    ["ClientRun"] = function(p_u_36, p_u_37, p38, p39, p_u_40)
        local v_u_41 = p38 or Enum.EasingStyle.Quad
        local v_u_42 = p39 or Enum.EasingDirection.InOut
        local v_u_43 = p_u_36:GetStore("camera")
        if v_u_43.paths == nil or (v_u_43.paths.eye == nil or #v_u_43.paths.eye == 0) then
            return "You must create a path first with the cam command."
        end
        if v_u_32 then
            v_u_32:cancel()
        end
        v_u_32 = v_u_6.delay(p_u_40)
        if p_u_40 > 0 then
            p_u_36:Reply(("Playing in %.1f seconds..."):format(p_u_40))
        end
        if not v_u_32:await() then
            return ""
        end
        local v_u_44 = v_u_8.new(v_u_43.paths.eye)
        local v_u_45
        if v_u_43.paths.focus and #v_u_43.paths.focus > 0 then
            v_u_45 = v_u_8.new(v_u_43.paths.focus) or nil
        else
            v_u_45 = nil
        end
        if v_u_31 then
            v_u_31:Disconnect()
            v_u_31 = nil
        end
        v_u_43.container.Parent = nil
        if v_u_33 == nil then
            v_u_33 = {}
            for _, v46 in ipairs(v_u_1.LocalPlayer.PlayerGui:GetChildren()) do
                if v46:IsA("ScreenGui") and v46.Enabled == true then
                    v46.Enabled = false
                    local v47 = v_u_33
                    table.insert(v47, v46)
                end
            end
        end
        local v_u_48 = v_u_4.CurrentCamera
        v_u_48.CameraType = Enum.CameraType.Scriptable
        v_u_48.CFrame = CFrame.new(v_u_44.first, v_u_45 and v_u_45.first or p_u_36.Executor.Character.HumanoidRootPart.Position)
        local v_u_49 = 0
        v_u_31 = v_u_2.RenderStepped:Connect(function(p50)
            local v51 = v_u_3
            local v52 = v_u_49 / p_u_37
            local v53 = v51:GetValue(math.clamp(v52, 0, 1), v_u_41, v_u_42)
            local v54 = v_u_45 and v_u_45:getPosition(v53) or p_u_36.Executor.Character.HumanoidRootPart.Position
            local v55 = CFrame.new(v_u_44:getPosition(v53), v54)
            v_u_48.CFrame = v_u_48.CFrame:lerp(v55, p50 * 10)
            v_u_49 = v_u_49 + p50
            if v_u_49 >= p_u_37 + 0.5 then
                v_u_31:Disconnect()
                v_u_31 = nil
                local v56 = v_u_6.delay
                local v57 = p_u_40 - 0.5
                v_u_32 = v56((math.max(v57, 0)))
                if not v_u_32:await() then
                    return
                end
                v_u_43.container.Parent = v_u_4
                v_u_48.CameraType = Enum.CameraType.Custom
                if v_u_33 then
                    for _, v58 in ipairs(v_u_33) do
                        if v58.Parent then
                            v58.Enabled = true
                        end
                    end
                    v_u_33 = nil
                end
            end
        end)
        return "Playing"
    end
}
return v59