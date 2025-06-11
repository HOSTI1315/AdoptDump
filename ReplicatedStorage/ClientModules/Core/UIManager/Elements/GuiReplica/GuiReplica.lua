--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.GuiReplica (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
v1("UIDB")
v1("PlatformM")
v1("UIHelpers")
local v_u_3 = v1("Maid")
local v_u_4 = {
    ["BackgroundTransparency"] = true,
    ["ImageTransparency"] = true,
    ["Scale"] = true,
    ["Image"] = true,
    ["Text"] = true
}
local v5 = v2("GuiReplica", v1("UIBaseElement"))
function v5.track_changes(p_u_6, p_u_7, p_u_8)
    local v13 = p_u_7.Changed:connect(function(p9)
        if v_u_4[p9] then
            local v10 = true
            for v11, v12 in pairs(p_u_6.no_track) do
                if v11 == p_u_7.Name and v12 == p9 then
                    v10 = false
                end
            end
            if v10 then
                p_u_8[p9] = p_u_7[p9]
            end
        end
    end)
    p_u_6.maid:GiveTask(v13)
end
function v5.recursive_track_changes(p14, p15, p16)
    p14:track_changes(p15, p16)
    for _, v17 in pairs(p15:GetChildren()) do
        if p16:FindFirstChild(v17.Name) then
            p14:recursive_track_changes(v17, p16[v17.Name])
        end
    end
end
function v5.start(p_u_18, p19)
    p_u_18.no_track = (p19 or {}).no_track or {}
    p_u_18.replica = p_u_18.instance:clone()
    p_u_18.maid = v_u_3.new()
    p_u_18.maid.descendant_added = p_u_18.instance.DescendantAdded:connect(function(p20)
        local v21 = p20:clone()
        v21.Parent = p_u_18.replica
        p_u_18:track_changes(p20, v21)
    end)
    p_u_18.maid.descendant_removing = p_u_18.instance.DescendantRemoving:connect(function(p22)
        if p_u_18.replica:FindFirstChild(p22.Name) then
            p_u_18.replica[p22.Name]:Destroy()
        end
    end)
    p_u_18:recursive_track_changes(p_u_18.instance, p_u_18.replica)
end
function v5.destroy(p23)
    p23.replica:Destroy()
    p23.maid:Destroy()
end
return v5