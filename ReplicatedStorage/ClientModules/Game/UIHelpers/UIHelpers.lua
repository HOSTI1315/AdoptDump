--// ReplicatedStorage.ClientModules.Game.UIHelpers (ModuleScript)

local _ = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
return {
    ["call_func_on_made_invisible"] = function(p_u_1, p_u_2)
        local v3 = p_u_1
        local v_u_4 = {}
        while not (p_u_1:IsA("ScreenGui") or (p_u_1:IsA("SurfaceGui") or p_u_1:IsA("BillboardGui"))) do
            if p_u_1:IsA("GuiObject") then
                local v5 = p_u_1:GetPropertyChangedSignal("Visible"):connect(function()
                    if p_u_1.Visible == false then
                        p_u_2()
                    end
                end)
                table.insert(v_u_4, v5)
            end
            p_u_1 = p_u_1.Parent
        end
        local v6 = p_u_1:GetPropertyChangedSignal("Enabled"):connect(function()
            if p_u_1.Enabled == false then
                p_u_2()
            end
        end)
        table.insert(v_u_4, v6)
        v3.AncestryChanged:Connect(function(_, p7)
            if p7 == nil then
                for _, v8 in ipairs(v_u_4) do
                    v8:Disconnect()
                end
            end
        end)
    end
}