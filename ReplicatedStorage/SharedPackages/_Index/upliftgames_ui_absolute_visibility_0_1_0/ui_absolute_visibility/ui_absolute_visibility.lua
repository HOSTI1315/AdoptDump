--// ReplicatedStorage.SharedPackages._Index.upliftgames_ui-absolute-visibility@0.1.0.ui-absolute-visibility (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("PluginGuiService")
local v3 = require(script.Parent.Signal)
local v_u_4 = require(script.Parent.Janitor)
local v_u_5 = require(script.Parent.Promise)
local v_u_6 = require(script.CascadeTree)
local v_u_7 = {}
local v_u_8 = {}
local v_u_9 = {}
local v_u_10 = v3.new()
local v_u_11 = v_u_5.resolve()
local function v_u_14(p12)
    while true do
        local v13 = p12:FindFirstAncestorWhichIsA("LayerCollector")
        if not v13 then
            break
        end
        p12 = v13
    end
    if p12:IsA("LayerCollector") then
        return p12
    else
        return nil
    end
end
local function v_u_22(p15)
    if p15.Enabled then
        if p15:IsA("ScreenGui") then
            local v16 = p15:FindFirstAncestorWhichIsA("BasePlayerGui")
            local v17
            if v16 == nil then
                v17 = false
            else
                v17 = not v16:IsA("StarterGui")
            end
            return v17
        end
        if p15:IsA("BillboardGui") or p15:IsA("SurfaceGuiBase") then
            local v18 = p15.Parent
            if v18 then
                if not p15.Adornee then
                    local v19 = v18:IsA("BasePart") and not v18:IsA("Terrain")
                    if v19 then
                        v19 = p15:IsDescendantOf(workspace)
                    end
                    return v19
                end
                if p15:IsDescendantOf(workspace) then
                    return true
                end
                local v20 = p15:FindFirstAncestorWhichIsA("BasePlayerGui")
                local v21
                if v20 == nil then
                    v21 = false
                else
                    v21 = not v20:IsA("StarterGui")
                end
                return v21
            end
        elseif p15:IsA("PluginGui") then
            return p15.Parent == v_u_2
        end
    end
    return false
end
local function v_u_24(p23)
    if p23:IsA("GuiObject") then
        if not p23.Visible then
            return false
        end
    elseif p23:IsA("LayerCollector") then
        if not (p23.Enabled and v_u_22(p23)) then
            return false
        end
    elseif not p23:IsA("Folder") then
        return false
    end
    return true
end
local function v_u_28(p25, p26, p27)
    if p25 ~= p26 and not p25:IsDescendantOf(p26) then
        return false
    end
    if p27 and not v_u_24(p26) then
        return false
    end
    while p25 ~= p26 do
        if not v_u_24(p25) then
            return false
        end
        p25 = p25.Parent
    end
    return true
end
local function v_u_38(p_u_29, p_u_30)
    local v_u_31 = v_u_4.new()
    local v_u_32 = v_u_4.new()
    local function v_u_35(p33, p34)
        if p33:IsA("GuiObject") then
            p34:Add(p33:GetPropertyChangedSignal("Visible"):Connect(function()
                p_u_30()
            end))
        elseif p33:IsA("LayerCollector") then
            p34:Add(p33:GetPropertyChangedSignal("Enabled"):Connect(function()
                p_u_30()
            end))
            if p33:IsA("BillboardGui") or p33:IsA("SurfaceGuiBase") then
                p34:Add(p33:GetPropertyChangedSignal("Adornee"):Connect(function()
                    p_u_30()
                end))
            end
        end
    end
    local function v_u_37()
        v_u_32:Cleanup()
        local v36 = p_u_29
        while v36 and v36 ~= game do
            v_u_35(v36, v_u_32)
            v36 = v36.Parent
        end
    end
    v_u_37()
    v_u_31:Add(p_u_29.AncestryChanged:Connect(function()
        v_u_37()
        p_u_30()
    end))
    v_u_35(p_u_29, v_u_31)
    return function()
        v_u_31:Destroy()
        v_u_32:Destroy()
    end
end
local function v_u_48()
    local v39 = {}
    for v40, _ in v_u_9 do
        table.insert(v39, v40)
        v_u_9[v40] = nil
    end
    for _, v41 in v_u_6.getSortedDescendants(v39) do
        local v42 = v_u_8[v41]
        if v42 then
            local v43 = false
            local v44 = nil
            local v45 = v_u_6.getNearestAncestor(v41)
            if v45 then
                local v46 = v_u_8[v45]
                if v46 then
                    if not v46.visible then
                        v45 = v44
                    end
                else
                    v45 = v44
                end
            else
                v45 = v_u_14(v41)
                v43 = true
            end
            local v47
            if v45 then
                v47 = v_u_28(v41, v45, v43)
            else
                v47 = false
            end
            v42.visible = v47
            v41:SetAttribute("AbsoluteVisibility", v42.visible)
        end
    end
    v_u_10:Fire()
end
function v_u_7.is_tracking(p49)
    return v_u_8[p49] ~= nil
end
function v_u_7.track(p_u_50)
    local v51 = p_u_50:IsA("GuiBase2d")
    assert(v51, "Provided argument was not a GuiBase2d.")
    local v52 = {
        ["visible"] = false,
        ["instance"] = p_u_50,
        ["janitor"] = v_u_4.new()
    }
    v_u_6.add(p_u_50)
    local v53 = false
    local v54 = nil
    local v55 = v_u_6.getNearestAncestor(p_u_50)
    if v55 then
        local v56 = v_u_8[v55]
        if v56 then
            if not v56.visible then
                v55 = v54
            end
        else
            v55 = v54
        end
    else
        v55 = v_u_14(p_u_50)
        v53 = true
    end
    local v57
    if v55 then
        v57 = v_u_28(p_u_50, v55, v53)
    else
        v57 = false
    end
    v52.visible = v57
    p_u_50:SetAttribute("AbsoluteVisibility", v52.visible)
    v52.janitor:Add((v_u_38(p_u_50, function()
        v_u_9[p_u_50] = true
        v_u_11:cancel()
        v_u_11 = v_u_5.fromEvent(v_u_1.PreRender):andThen(function()
            v_u_48()
        end)
    end)))
    v52.janitor:Add(p_u_50.Destroying:Connect(function()
        v_u_7.untrack(p_u_50)
    end))
    v52.janitor:Add(function()
        v_u_9[p_u_50] = nil
        v_u_6.remove(p_u_50)
        p_u_50:SetAttribute("AbsoluteVisibility", nil)
        v_u_8[p_u_50] = nil
    end)
    v_u_8[p_u_50] = v52
end
function v_u_7.untrack(p58)
    local v59 = v_u_8[p58]
    if v59 then
        v59.janitor:Destroy()
    end
end
function v_u_7.getAbsoluteVisibility(p60)
    local v61 = p60:IsA("GuiBase2d")
    assert(v61, "Provided argument was not a GuiBase2d.")
    local v62 = v_u_8[p60]
    if v62 then
        return v62.visible
    else
        local v63 = v_u_14(p60)
        if v63 then
            return v_u_28(p60, v63, true)
        else
            return false
        end
    end
end
function v_u_7.getAbsoluteVisibilityChangedSignal(p64)
    if not v_u_7.is_tracking(p64) then
        error("Cannot get the AbsoluteVisibility Changed Signal of an untracked instance.")
    end
    return p64:GetAttributeChangedSignal("AbsoluteVisibility")
end
local v65 = v_u_1:IsClient()
assert(v65, "This module only be run on the client.")
return v_u_7