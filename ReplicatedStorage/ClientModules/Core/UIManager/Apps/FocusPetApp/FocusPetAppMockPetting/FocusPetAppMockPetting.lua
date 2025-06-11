--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppMockPetting (ModuleScript)

local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v4 = v_u_3("Class")
local v_u_5 = v_u_3("Maid")
local v_u_6 = v_u_3("PetPerformanceName")
local v7 = v4("FocusPetAppMockPetting", v_u_3("UIBaseElement"))
function v7.capture_focus(p8, p9)
    p8.maid:DoCleaning()
    p8.pet_entity = p9
    p8.is_petting = false
    p8:listen_for_petting()
end
function v7.release_focus(p10)
    p10.maid:DoCleaning()
    p10.pet_entity = nil
end
local v_u_11 = {
    [Enum.UserInputType.MouseButton1] = true
}
function v7.listen_for_petting(p_u_12)
    local v_u_13 = p_u_12.UIManager.apps.MockFocusPetApp.ailments.instance.AbsoluteSize.X
    p_u_12.maid:GiveTask(v_u_1.InputBegan:Connect(function(p14)
        if v_u_11[p14.UserInputType] then
            local v15 = workspace.CurrentCamera.ViewportSize * 0.5
            if (Vector2.new(p14.Position.X, p14.Position.Y) + v_u_2:GetGuiInset() - v15).Magnitude <= v_u_13 * 0.5 then
                p_u_12:start_petting(function()
                    return v_u_1:GetMouseLocation()
                end)
            end
        end
    end))
    p_u_12.maid:GiveTask(v_u_1.InputEnded:Connect(function(p16)
        if v_u_11[p16.UserInputType] then
            p_u_12:stop_petting()
        end
    end))
end
function v7.start_petting(p17, p_u_18)
    if not p17.is_petting then
        p17.is_petting = true
        local v19 = v_u_3("PetEntityHelper").stage_performance
        local v20 = p17.pet_entity
        local v22 = {
            ["name"] = v_u_6.Petting,
            ["options"] = {
                ["update_petting"] = function()
                    local v21 = p_u_18()
                    return v21, v21 ~= nil
                end
            }
        }
        v19(v20, v22)
    end
end
function v7.stop_petting(p23)
    if p23.is_petting then
        p23.is_petting = false
        v_u_3("PetEntityHelper").end_performance(p23.pet_entity, v_u_6.Petting)
    end
end
function v7.start(p24)
    p24.maid = v_u_5.new()
end
return v7