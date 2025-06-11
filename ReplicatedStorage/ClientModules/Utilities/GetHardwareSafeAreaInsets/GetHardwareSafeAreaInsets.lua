--// ReplicatedStorage.ClientModules.Utilities.GetHardwareSafeAreaInsets (ModuleScript)

return function()
    local v1 = game.Players.LocalPlayer.PlayerGui
    assert(v1)
    local v2 = v1:FindFirstChild("_FullscreenTestGui")
    if not v2 then
        v2 = Instance.new("ScreenGui")
        v2.Name = "_FullscreenTestGui"
        v2.Parent = v1
        v2.ScreenInsets = Enum.ScreenInsets.None
    end
    local v3 = v1:FindFirstChild("_DeviceTestGui")
    if not v3 then
        v3 = Instance.new("ScreenGui")
        v3.Name = "_DeviceTestGui"
        v3.Parent = v1
        v3.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    end
    local v4 = v3.AbsolutePosition - v2.AbsolutePosition
    local v5 = v2.AbsolutePosition + v2.AbsoluteSize - (v3.AbsolutePosition + v3.AbsoluteSize)
    return {
        ["left"] = v4.X,
        ["top"] = v4.Y,
        ["right"] = v5.X,
        ["bottom"] = v5.Y
    }
end