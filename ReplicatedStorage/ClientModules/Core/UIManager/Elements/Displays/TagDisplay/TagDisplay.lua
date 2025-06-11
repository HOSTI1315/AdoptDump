--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Displays.TagDisplay (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("InventoryDB")
local v3 = v1("Class")
local v_u_4 = game:GetService("ReplicatedStorage").Resources:WaitForChild("UI_Resources"):WaitForChild("Templates")
local v5 = v3("TagDisplay", v1("UIBaseElement"))
function v5._refresh(p6)
    p6.rideable_pip.Visible = p6.rideable_visible
    p6.flyable_pip.Visible = p6.flyable_visible
    p6.mega_neon_pip.Visible = p6.mega_neon_visible
    p6.neon_pip.Visible = p6.neon_visible
    p6.wearing_pip.Visible = p6.wearing_visible
    p6.sticker_pip.Visible = p6.is_sticker
    p6.bonus_pip.Visible = p6.has_bonus
    p6.left_aligned_container.Visible = false
    for _, v7 in p6.left_aligned_tags do
        if v7.Visible then
            local v8 = p6.tag_display_frame.UIListLayout.Padding.Offset
            local v9 = 0
            for _, v10 in p6.tag_display_frame:GetChildren() do
                if not v10:IsA("UIListLayout") and v10.Visible then
                    v9 = v9 + (v10.AbsoluteSize.X + v8)
                end
            end
            p6.left_aligned_container.Size = UDim2.new(1, -v9, 1, 0)
            p6.left_aligned_container.Visible = true
            return
        end
    end
end
function v5.update_tags(p11, p12, p13)
    local v14 = p12 or {}
    local v15 = v14.rideable == true
    local v16 = v14.flyable == true
    local v17 = v14.mega_neon == true
    local v18 = v14.neon == true
    if not v14.multiple_tags_visible and v17 then
        v18 = false
    end
    local v19 = p13 or false
    if p11.rideable_visible ~= v15 or (p11.flyable_visible ~= v16 or (p11.mega_neon_visible ~= v17 or (p11.neon_visible ~= v18 or p11.wearing_visible ~= v19))) then
        p11.rideable_visible = v15
        p11.flyable_visible = v16
        p11.mega_neon_visible = v17
        p11.neon_visible = v18
        p11.wearing_visible = v19
        local v20
        if p11.kind then
            v20 = v_u_2.stickers[p11.kind] ~= nil
        else
            v20 = false
        end
        p11.is_sticker = v20
        p11.has_bonus = v14.bonus
        p11:_refresh()
    end
end
function v5._destroy_scale_apparatus(p21)
    if not p21.ui_scale then
        return false
    end
    p21.ui_scale:Destroy()
    p21.ui_scale = nil
    p21.tag_display_frame.Parent = p21.instance
    p21.scale_container:Destroy()
    p21.scale_container = nil
end
function v5._get_ui_scale(p22)
    if p22.ui_scale then
        return p22.ui_scale
    end
    local v23 = Instance.new("Frame")
    v23.Name = "ScaleContainer"
    v23.Size = UDim2.new(0, 76, 0, 76)
    v23.BackgroundTransparency = 1
    v23.ZIndex = p22.tag_display_frame.ZIndex
    v23.Parent = p22.instance
    p22.scale_container = v23
    p22.tag_display_frame.Parent = v23
    p22.ui_scale = Instance.new("UIScale")
    p22.ui_scale.Parent = v23
    return p22.ui_scale
end
function v5.set_scale(p24, p25)
    p24:_get_ui_scale().Scale = p25
end
function v5._refresh_text_visibility(p26)
    local v27 = p26.instance.AbsoluteSize.X < 38
    if p26.hide_text ~= v27 then
        p26.hide_text = v27
        for _, v28 in p26.text_labels do
            v28.Visible = not p26.hide_text
        end
    end
end
function v5._refresh_size(p29)
    if p29.fixed_property_size then
        return
    else
        local v30 = p29.instance.AbsoluteSize.X / 76
        if v30 ~= 1 or p29.ui_scale then
            p29:set_scale(v30)
        end
    end
end
function v5.is_visible(p31, p32)
    return p31[p32 .. "_visible"] == true
end
function v5.start(p_u_33, p34)
    p_u_33.options = p34 or {}
    p_u_33.kind = p_u_33.options.kind
    local v35 = v_u_4.TagDisplayTemplate:Clone()
    p_u_33.text_labels = {}
    for _, v36 in v35:GetDescendants() do
        if v36:IsA("TextLabel") then
            v36.AutoLocalize = false
            local v37 = p_u_33.text_labels
            table.insert(v37, v36)
        end
    end
    p_u_33.fixed_property_size = p34.fixed_property_size
    if p34.fixed_property_size then
        local v38 = p34.fixed_property_size / 15
        local v39 = v35.Size
        v35.Size = UDim2.new(v39.X.Scale, v39.X.Offset * v38, v39.Y.Scale, p34.fixed_property_size)
        local v40 = v35.Position
        v35.Position = UDim2.new(v40.X.Scale, v40.X.Offset * v38, v40.Y.Scale, v40.Y.Offset * v38)
        local v41 = UDim2.fromOffset(p34.fixed_property_size, p34.fixed_property_size)
        for _, v42 in { v35, p_u_33.left_aligned_container } do
            for _, v43 in v42:GetChildren() do
                if not v43:IsA("UIListLayout") then
                    v43.Size = v41
                end
            end
        end
    end
    v35.Parent = p_u_33.instance
    p_u_33.tag_display_frame = v35
    p_u_33.rideable_pip = p_u_33.tag_display_frame.rideable
    p_u_33.flyable_pip = p_u_33.tag_display_frame.flyable
    p_u_33.mega_neon_pip = p_u_33.tag_display_frame.mega_neon
    p_u_33.neon_pip = p_u_33.tag_display_frame.neon
    p_u_33.wearing_pip = p_u_33.tag_display_frame.wearing
    p_u_33.sticker_pip = p_u_33.tag_display_frame.sticker
    p_u_33.bonus_pip = p_u_33.tag_display_frame.bonus
    p_u_33.left_aligned_tags = { p_u_33.bonus_pip }
    p_u_33.left_aligned_container = p_u_33.tag_display_frame.left_aligned
    for _, v44 in p_u_33.left_aligned_tags do
        v44.Parent = p_u_33.left_aligned_container
    end
    p_u_33:update_tags(p_u_33.options.properties, p_u_33.options.wearing)
    if p_u_33.instance:IsDescendantOf(game) then
        p_u_33:_refresh_size()
        p_u_33:_refresh_text_visibility()
    end
    p_u_33.instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        p_u_33:_refresh_size()
        p_u_33:_refresh_text_visibility()
    end)
    return p_u_33
end
return v5