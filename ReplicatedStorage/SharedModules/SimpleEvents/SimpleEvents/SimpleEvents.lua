--// ReplicatedStorage.SharedModules.SimpleEvents.SimpleEvents (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SimpleEventsSignal")
local v_u_3 = v1("Debug")
local v_u_4 = game:GetService("CollectionService")
local v_u_5 = {}
local v_u_18 = {
    ["MyCharacterAdded"] = function(p6, p7)
        p7:GiveTask(game.Players.LocalPlayer.CharacterAdded:connect(p6))
        if game.Players.LocalPlayer.Character then
            p6(game.Players.LocalPlayer.Character)
        end
    end,
    ["PlayerAddedPlusExisting"] = function(p8, p9)
        p9:GiveTask(game.Players.PlayerAdded:connect(p8))
        for _, v10 in pairs(game.Players:GetPlayers()) do
            p8(v10)
        end
    end,
    ["ChildAddedPlusExisting"] = function(p11, p12, p13)
        p12:GiveTask(p13.ChildAdded:connect(p11))
        for _, v14 in pairs(p13:GetChildren()) do
            p11(v14)
        end
    end,
    ["AllCharacterAddedPlusExisting"] = function(p_u_15, p_u_16)
        p_u_16:GiveTask(v_u_5.get("PlayerAddedPlusExisting"):connect(function(p17)
            p_u_16:GiveTask(p17.CharacterAdded:connect(p_u_15))
            if p17.Character then
                p_u_15(p17.Character)
            end
        end))
    end
}
function v_u_5.foreach_child_including_new(p19, p_u_20)
    local v21 = p19.ChildAdded:connect(p_u_20)
    for _, v_u_22 in pairs(p19:GetChildren()) do
        coroutine.wrap(function()
            v_u_3.pcall_warn_error(function()
                p_u_20(v_u_22)
            end)
        end)()
    end
    return v21
end
function v_u_5.foreach_descendant_including_new(p23, p_u_24)
    local v25 = p23.DescendantAdded:connect(p_u_24)
    for _, v_u_26 in pairs(p23:GetDescendants()) do
        coroutine.wrap(function()
            v_u_3.pcall_warn_error(function()
                p_u_24(v_u_26)
            end)
        end)()
    end
    return v25
end
function v_u_5.foreach_tagged_including_new(p27, p_u_28)
    local v29 = v_u_4:GetInstanceAddedSignal(p27):Connect(p_u_28)
    for _, v_u_30 in ipairs(v_u_4:GetTagged(p27)) do
        coroutine.wrap(function()
            v_u_3.pcall_warn_error(function()
                p_u_28(v_u_30)
            end)
        end)()
    end
    return v29
end
function v_u_5.get(p31, ...)
    return v_u_2.new(v_u_18[p31], ...)
end
return v_u_5