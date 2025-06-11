--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FurnitureSelectorApp.FurniturePlaneLock (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Signal")
local v3 = v1("Class")
local v_u_4 = v1("Maid")
local v5 = v3("FurniturePlaneLock")
function v5.__init(p6, p7)
    p6.billboard = p7
    p6.icon = p7.HeightLock
    p6.folder = nil
    p6.folder_maid = v_u_4.new()
    p6.folder_changed = v_u_2.new()
    p6:set_active(false)
end
function v5.is_active(p8)
    return p8.billboard.Enabled
end
function v5.set_active(p9, p10)
    if not p10 then
        p9:set_icon_visible(false)
        p9:set_locked_furniture_folder(nil)
    end
    p9.billboard.Enabled = p10
end
function v5.set_locked_furniture_folder(p_u_11, p12)
    p_u_11.folder = p12
    p_u_11.folder_maid:DoCleaning()
    p_u_11.billboard.Adornee = nil
    if p12 then
        p_u_11.folder_maid:GiveTask(p12.ChildAdded:Connect(function()
            p_u_11.billboard.Adornee = p_u_11.folder:FindFirstChild("PlacementBlock", true)
        end))
        p_u_11.billboard.Adornee = p_u_11.folder:FindFirstChild("PlacementBlock", true)
    end
    p_u_11.folder_changed:Fire(p12)
end
function v5.get_locked_furniture_folder(p13)
    return p13.folder
end
function v5.set_icon_visible(p14, p15)
    p14.icon.Visible = p15
end
function v5.get_plane(p16)
    local v17 = p16.billboard.Adornee
    if v17 then
        local v18 = v17.Position
        local v19 = v17.Size.Y / 2
        return v18 + Vector3.new(0, v19, 0), Vector3.new(0, 1, 0)
    end
end
function v5.get_folder_changed_signal(p20)
    return p20.folder_changed
end
return v5