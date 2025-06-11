--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.AboveCharStack (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("new:PetRigs")
local v_u_5 = v1("package:Sift")
local v_u_6 = v1("new:ChunkedLookup").new({
    ["chunk_size"] = 50
})
local v_u_7 = {}
local v_u_8 = {}
local v_u_9 = {}
local v_u_10 = true
local v11 = v2("AboveCharStack", v1("UIBaseElement"))
function v11.get(p12)
    return v_u_8[p12]
end
function v11.get_chars_in_cache()
    return v_u_5.Dictionary.keys(v_u_8)
end
function v11.set_global_visible(p13)
    local v14 = p13 == true and true or p13 == false
    assert(v14)
    v_u_10 = p13
end
function v11.start(p_u_15, p16)
    local v17 = p16 or {}
    local v18 = v17.char
    if typeof(v18) ~= "Instance" then
        local v19 = error
        local v20 = v17.char
        v19((("Bad char passed to AboveCharStack: (%*) %*"):format(typeof(v20), v17.char)))
    end
    p_u_15.char = v17.char
    p_u_15.components = {}
    p_u_15.max_distances = {}
    p_u_15.maid = v_u_3.new()
    if v_u_8[p_u_15.char] then
        p_u_15.visible = v_u_8[p_u_15.char].visible
    else
        p_u_15.visible = true
    end
    if v_u_8[p_u_15.char] then
        v_u_8[p_u_15.char]:destroy()
    end
    v_u_8[p_u_15.char] = p_u_15
    p_u_15:start_render_stepped_loop()
    coroutine.wrap(function()
        local v21 = p_u_15.char:FindFirstChild("Humanoid")
        if v21 then
            v21.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        end
    end)()
    p_u_15.char.AncestryChanged:connect(function(_, p22)
        if p22 == nil then
            p_u_15:destroy()
        end
    end)
    p_u_15:_update_lookup()
    return p_u_15
end
function v11._update_lookup(p23)
    if p23.visible then
        v_u_9[p23] = true
        local v24 = p23.char:FindFirstChild("PetModel")
        local v25 = v24 or p23.char
        local v26
        if v24 then
            v26 = v_u_4.get(v24).get_part(v24, "Head")
        else
            v26 = v25:FindFirstChild("Head")
        end
        if v26 then
            local v27 = p23._prev_position
            if v27 then
                local v28 = v26.Position - v27
                local v29 = v28.X
                local v30 = math.abs(v29)
                local v31 = v28.Y
                local v32 = math.abs(v31)
                local v33 = v28.Z
                local v34 = math.abs(v33)
                if math.max(v30, v32, v34) < 1 then
                    return
                end
            end
            v_u_6:place_item(p23, v26.Position, 0)
            p23._prev_position = v26.Position
        else
            v_u_6:remove_item(p23)
            p23._prev_position = nil
        end
    else
        v_u_6:remove_item(p23)
        v_u_9[p23] = nil
        p23._prev_position = nil
        return
    end
end
local v_u_35 = nil
function v11.start_render_stepped_loop(_)
    if not v_u_35 then
        v_u_35 = true
        game:GetService("RunService").RenderStepped:connect(function()
            debug.profilebegin("AboveCharStack:start_render_stepped_loop")
            debug.profilebegin("AboveCharStack:start_render_stepped_loop.update_lookups")
            for v36 in v_u_9 do
                v36:_update_lookup()
            end
            debug.profileend()
            debug.profilebegin("AboveCharStack:start_render_stepped_loop.chunked_lookup")
            local v37 = v_u_6:get_items_at_position_flattened(workspace.CurrentCamera.CFrame.Position, 50)
            debug.profileend()
            debug.profilebegin("AboveCharStack:start_render_stepped_loop.refresh_nearby")
            local v38 = {}
            for v39, _ in v37 do
                if not v_u_7[v39] and v39:refresh() then
                    v38[v39] = true
                end
            end
            debug.profileend()
            debug.profilebegin("AboveCharStack:start_render_stepped_loop.refresh_prev_visible")
            for v40, _ in v_u_7 do
                if v40:refresh() then
                    v38[v40] = true
                end
            end
            debug.profileend()
            v_u_7 = v38
            debug.profileend()
        end)
    end
end
function v11._unparent_components(p41)
    for _, v42 in p41.components do
        v42.Parent = nil
    end
end
function v11.refresh(p43)
    debug.profilebegin("AboveCharStack:refresh")
    if p43.destroyed then
        error((("Tried to refresh destroyed AboveCharStack of %*"):format(p43.char)))
    end
    if not p43.char:IsDescendantOf(workspace) then
        p43:_unparent_components()
        debug.profileend()
        return false
    end
    if #p43.components == 0 then
        p43:_unparent_components()
        debug.profileend()
        return false
    end
    local v44 = p43.char:FindFirstChild("PetModel")
    local v45 = v44 or p43.char
    local v46
    if v44 then
        v46 = v_u_4.get(v44).get_part(v44, "Head")
    else
        v46 = v45:FindFirstChild("Head")
    end
    if not v46 then
        p43:_unparent_components()
        debug.profileend()
        return false
    end
    if not (p43.visible and v_u_10) then
        p43:_unparent_components()
        debug.profileend()
        return false
    end
    local v47 = p43.components[1]
    local v48
    if v44 then
        local v49 = v46.CFrame.Position
        local v50 = v46.Size.Y / 2 + v47.Size.Y / 2
        v48 = v49 + Vector3.new(0, v50, 0)
    elseif v46:IsA("BasePart") then
        v48 = (v46.CFrame * CFrame.new(0, v46.Size.Y / 2 + v47.Size.Y / 2, 0)).Position
    else
        v48 = (v46.WorldCFrame * CFrame.new(0, v47.Size.Y / 2, 0)).Position
    end
    local v51 = v46.AssemblyRootPart
    local v52 = game.Players.LocalPlayer.Character
    local v53
    if v52 then
        v53 = v52:FindFirstChild("HumanoidRootPart")
    else
        v53 = nil
    end
    local v54 = not v53 and 0 or (v53.CFrame.Position - v51.CFrame.Position).magnitude
    local v55 = v46:GetAttribute("AboveCharStackYOffset") or 0
    local v56 = v45:GetAttribute("MaxHatHeight") or 0
    debug.profilebegin("AboveCharStack:refresh.update_components")
    local v57 = v55 + math.max(v56, 0.6)
    local v58 = v48 + Vector3.new(0, v57, 0)
    v47.CFrame = CFrame.new(v58) * (workspace.CurrentCamera.CFrame - workspace.CurrentCamera.CFrame.Position) * CFrame.Angles(0, 3.141592653589793, 0)
    v47.Parent = game.Players.LocalPlayer.PlayerGui
    local v59 = 1
    for v60 = 2, #p43.components do
        local v61 = p43.components[v60]
        local v62 = p43.max_distances[v60]
        if v62 > 0 and v62 < v54 then
            v61.Parent = nil
        else
            v61.Parent = game.Players.LocalPlayer.PlayerGui
            v59 = v59 + 1
            local v63 = v59 - 1
            local v64 = p43.components[v63]
            while v64 and v64:GetAttribute("IndependentComponent") do
                v63 = v63 - 1
                v64 = p43.components[v63]
            end
            local v65
            if v61:GetAttribute("ComponentOffset") then
                v65 = CFrame.new(v61:GetAttribute("ComponentOffset"))
            elseif v61:GetAttribute("HorizontalAlignment") then
                v65 = CFrame.new(-v61.Size.X / 2 - v64.Size.X / 2 - 0.2, 0, 0)
            else
                v65 = CFrame.new(0, v61.Size.Y / 2 + v64.Size.Y / 2 + 0.2, 0)
            end
            v61.CFrame = v64.CFrame * v65
        end
    end
    debug.profileend()
    debug.profileend()
    return true
end
function v11.force_visible(p66)
    v_u_7[p66] = true
end
function v11.set_visible(p67, p68)
    p67.visible = p68
    p67:_update_lookup()
end
function v11.add_component(p69, p70, p71, p72)
    local v73 = p69.instance[p70]:clone()
    v73.Anchored = true
    v73.CanCollide = false
    local v74 = p72 or {}
    v73:SetAttribute("IndependentComponent", v74.independent)
    v73:SetAttribute("ComponentOffset", v74.offset)
    v73:SetAttribute("HorizontalAlignment", v74.horizontal_alignment)
    if v74.cleanup then
        p69.maid:GiveTask(v74.cleanup)
    end
    if v74.max_distance then
        local v75 = p69.max_distances
        local v76 = v74.max_distance
        table.insert(v75, v76)
    else
        local v77 = p69.max_distances
        table.insert(v77, -1)
    end
    p71(v73)
    local v78 = p69.components
    table.insert(v78, v73)
end
function v11.destroy(p79)
    if not p79.destroyed then
        p79.destroyed = true
        v_u_8[p79.char] = nil
        v_u_9[p79] = nil
        v_u_7[p79] = nil
        v_u_6:remove_item(p79)
        p79.maid:DoCleaning()
        for _, v80 in p79.components do
            v80:Destroy()
        end
    end
end
return v11