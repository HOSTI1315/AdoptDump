--// ReplicatedStorage.CmdrClient.Commands.cam (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("Splines")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("Workspace")
local v_u_4 = Color3.fromRGB(38, 233, 87)
local v_u_5 = Color3.fromRGB(206, 30, 30)
local v_u_6 = {
    ["mouse"] = function()
        return v_u_2.LocalPlayer:GetMouse().Hit.p
    end,
    ["character"] = function()
        return v_u_2.LocalPlayer.Character.HumanoidRootPart.Position
    end,
    ["current-camera"] = function()
        return v_u_3.CurrentCamera.CFrame.p
    end
}
local v_u_13 = {
    ["push"] = function(p7, p8)
        local v9 = v_u_6[p8]
        table.insert(p7, v9())
    end,
    ["pop"] = function(p10)
        table.remove(p10, #p10)
    end,
    ["reset"] = function(p11)
        for v12 in pairs(p11) do
            p11[v12] = nil
        end
    end
}
local function v_u_22(p14, p15, p16)
    p14:ClearAllChildren()
    for v17 = 1, #p15 do
        local v18 = Instance.new("SphereHandleAdornment")
        v18.Adornee = v_u_3.Terrain
        v18.AlwaysOnTop = true
        v18.ZIndex = 5
        v18.Color3 = p16
        v18.Name = tostring(v17)
        v18.CFrame = CFrame.new(p15[v17])
        v18.Parent = p14
        if p15[v17 + 1] == nil then
            break
        end
    end
    local v19 = v_u_1.getPoints(p15, 0.1)
    for v20 = 1, #v19 - 1 do
        local v21 = Instance.new("CylinderHandleAdornment")
        v21.Height = (v19[v20] - v19[v20 + 1]).magnitude
        v21.CFrame = CFrame.new(v19[v20], v19[v20 + 1])
        v21.Radius = 0.4
        v21.Adornee = workspace.Terrain
        v21.AlwaysOnTop = true
        v21.ZIndex = 4
        v21.Transparency = 0.4
        v21.Parent = p14
    end
end
return {
    ["Name"] = "cam",
    ["Aliases"] = {},
    ["Description"] = "Sets camera waypoint options",
    ["Group"] = "CameraTools",
    ["AutoExec"] = { "alias cam-reset cam eye reset && cam focus reset", "alias \"cam-bindings|Creates bindings for controlling camera paths.\" " .. table.concat({
            "bind x cam eye push current-camera",
            "bind h cam eye push mouse",
            "bind y cam eye push character",
            "bind six cam eye pop",
            "bind n cam focus push current-camera",
            "bind j cam focus push mouse",
            "bind u cam focus push character",
            "bind seven cam focus pop",
            "bind Backspace cam-reset",
            "bind k cam-play 3 Quad InOut 0",
            "echo X - Add camera current position to eye path\nH - Add mouse position to eye path\nY - Add character position to eye path\n6 - Remove last eye node\n\nN - Add camera current position to focus path\nJ - Add mouse position to focus path\nU - Add character position to focus path\n7 - Remove last focus node\n\nBackspace - Reset both paths\n\nK - Preview path\n\nCtrl + Shift + G - Hide Roblox GUI (Developers only)\nCtrl + Shift + C - Hide Game GUI (Developers only)\n\nUse the cam and cam-play commands for more granular options."
        }, " && ") },
    ["Args"] = { function(p23)
            return {
                ["Type"] = p23.Cmdr.Util.MakeEnumType("option", { "eye", "focus" }),
                ["Name"] = "Target",
                ["Description"] = "The target set of waypoints you want to modify."
            }
        end, function(p24)
            return {
                ["Type"] = p24.Cmdr.Util.MakeEnumType("option", { "push", "pop", "reset" }),
                ["Name"] = "Operation",
                ["Description"] = "The operation you want to apply to the set of waypoints."
            }
        end, function(p25)
            if p25:GetArgument(2):GetValue() == "push" then
                return {
                    ["Type"] = p25.Cmdr.Util.MakeEnumType("option", { "mouse", "character", "current-camera" }),
                    ["Name"] = "Position",
                    ["Description"] = "The position you want to push onto the set of waypoints."
                }
            end
        end },
    ["ClientRun"] = function(p26, p27, p28, p29)
        local v30 = p26:GetStore("camera")
        if v30.container == nil then
            v30.container = Instance.new("Folder")
            v30.container.Name = "CameraContainer"
            v30.container.Parent = v_u_3
        end
        if v30.paths == nil then
            v30.paths = {}
        end
        if v30.paths[p27] == nil then
            v30.paths[p27] = {}
            local v31 = Instance.new("Folder")
            v31.Name = p27
            v31.Parent = v30.container
        end
        v_u_13[p28](v30.paths[p27], p29)
        v_u_22(v30.container:FindFirstChild(p27), v30.paths[p27], p27 == "eye" and v_u_5 or v_u_4)
        local v32 = v_u_3.CurrentCamera.CFrame * Vector3.new(0, 0, -100)
        if p28 == "push" and (p29 == "current-camera" and (p27 == "eye" and p26.Dispatcher:Run("var", ".CAM_AUTO_FOCUS") ~= "")) then
            if v30.paths.focus == nil then
                v30.paths.focus = {}
                local v33 = Instance.new("Folder")
                v33.Name = "focus"
                v33.Parent = v30.container
            end
            local v34 = v30.paths.focus
            table.insert(v34, v32)
            v_u_22(v30.container:FindFirstChild("focus"), v30.paths.focus, v_u_4)
        end
        return ""
    end
}