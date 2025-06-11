--// ReplicatedStorage.ClientModules.Utilities.CoreUIInsetHelper (ModuleScript)

require(game.ReplicatedStorage:WaitForChild("Fsys")).load("PlatformM")
local v1 = game:GetService("Players")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = {}
local v4 = game:GetService("ReplicatedStorage").Resources.TopbarIntersections:Clone()
v4.Parent = v1.LocalPlayer.PlayerGui
local v_u_5 = {
    ["collapsed"] = {
        ["left"] = v4:FindFirstChild("Left"),
        ["right"] = v4:FindFirstChild("Right")
    },
    ["extended"] = {
        ["left"] = v4:FindFirstChild("LeftExtended"),
        ["right"] = v4:FindFirstChild("RightExtended")
    }
}
function v_u_3.is_new_core_ui_enabled()
    return v_u_2.TopbarInset.Height > 36
end
function v_u_3.is_intersecting(_)
    return false
end
local v_u_6 = {}
function v_u_3.run_once_if_intersecting(p7, p8)
    if v_u_3.is_intersecting(p7) then
        local v9 = debug.info(2, "n")
        local v10 = debug.info(2, "l") .. "_" .. p7:GetFullName() .. "_" .. v9
        if not v_u_6[v10] then
            local v11
            if v_u_3.is_intersecting(p7) then
                local v12 = p7.AbsolutePosition
                local v13 = p7.AbsoluteSize
                local v14 = Rect.new(v12, v12 + v13)
                local v15 = v_u_5.extended.right
                local v16 = v15.AbsolutePosition
                local v17 = v15.AbsoluteSize
                local v18 = Rect.new(v16, v16 + v17)
                v11 = v14.Max.X - v18.Min.X
            else
                v11 = 0
            end
            local v19
            if v_u_3.is_intersecting(p7) then
                local v20 = p7.AbsolutePosition
                local v21 = p7.AbsoluteSize
                local v22 = Rect.new(v20, v20 + v21)
                local v23 = v_u_5.extended.right
                local v24 = v23.AbsolutePosition
                local v25 = v23.AbsoluteSize
                local v26 = Rect.new(v24, v24 + v25)
                local v27 = v22.Min.Y
                v19 = v26.Max.Y - v27
            else
                v19 = 0
            end
            p8(v11, v19)
            v_u_6[v10] = true
        end
    end
end
return v_u_3